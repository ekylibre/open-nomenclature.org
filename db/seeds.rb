# coding: utf-8
XMLNS = 'http://www.ekylibre.org/XML/2013/nomenclatures'.freeze
NS_SEPARATOR = '-'.freeze

# Import data
# ActiveRecord::Base.transation do
master = HashWithIndifferentAccess.new
for path in Dir.glob(Rails.root.join('db', 'import', 'nomenclatures', '**', '*.xml'))
  f = File.open(path, 'rb')
  document = Nokogiri::XML(f) do |config|
    config.strict.nonet.noblanks.noent
  end
  f.close
  if document.root.namespace.href.to_s == XMLNS
    document.root.xpath('xmlns:nomenclature').each do |element|
      nomenclature, item = element.attr('name').to_s.split(NS_SEPARATOR)[0..1]
      item = :root if item.blank?
      master[nomenclature] ||= HashWithIndifferentAccess.new
      master[nomenclature][item] = element
    end
  else
    Rails.logger.info("File #{path} is not a nomenclature as defined by #{XMLNS}")
  end
end

translations = {}
Dir.chdir(Rails.root.join('config', 'locales')) do
  for file in Dir.glob('**/*.yml')
    translations.update YAML.load_file(file).symbolize_keys
  end
end

LOCALES = [:eng, :fra] || translations.keys.freeze
puts LOCALES.inspect

STDOUT.sync = true

def import_items(nomenclature, name, subsets)
  print "<#{name}"
  subsets[name].xpath('xmlns:items/xmlns:item').each do |element|
    item = Item.create!(name: element.attr(:name), nomenclature: nomenclature, state: 'approved', parent_name: element.attr('parent'))
    if nomenclature.translateable?
      LOCALES.each do |locale|
        I18n.with_locale(locale) do
          item.label = "nomenclatures.#{nomenclature.name}.items.#{item.name}".t
        end
      end
    end

    nomenclature.property_natures.each do |property_nature|
      next unless element.has_attribute?(property_nature.name)
      property = item.properties.new(nature: property_nature)
      property.value = element.attr(property_nature.name)
      property.save!
    end

    print '·'
    import_items(nomenclature, item.name, subsets, item) if subsets[item.name]
  end
  print '>'
end

def set_parents
  Nomenclature.find_each do |nomenclature|
    print " - #{nomenclature.name}"
    set_parent(nomenclature)
    puts '!'
  end
end

def set_parent(nomenclature)
  ActiveRecord::Base.connection.execute("UPDATE items SET parent_id = parents.id FROM items AS parents WHERE items.nomenclature_id = #{nomenclature.id} AND parents.nomenclature_id = #{nomenclature.id} AND items.parent_name = parents.name")
end

master.each do |name, subsets|
  print "#{name}: "
  root = subsets[:root]
  nomenclature = Nomenclature.create!(name: name, state: 'approved', translateable: (root.attr('translateable').to_s != 'false'))
  LOCALES.each do |locale|
    I18n.with_locale(locale) do
      nomenclature.label = "nomenclatures.#{name}.name".t
    end
  end
  subsets[:root].xpath('xmlns:properties/xmlns:property').each do |element|
    datatype = element.attr('type').strip.to_sym
    property_nature = PropertyNature.create!(name: element.attr(:name), nomenclature: nomenclature, datatype: datatype, state: 'approved', choices_nomenclature_name: ([:item, :item_list].include?(datatype) ? element.attr(:choices) : nil))
    LOCALES.each do |locale|
      I18n.with_locale(locale) do
        property_nature.label = "nomenclatures.#{name}.property_natures.#{property_nature.name}".t
      end
    end
  end

  import_items(nomenclature, :root, subsets)
  set_parent(nomenclature)
  puts ''
end

ActiveRecord::Base.connection.execute('UPDATE property_natures SET choices_nomenclature_id = n.id FROM nomenclatures AS n WHERE property_natures.choices_nomenclature_name = n.name')
