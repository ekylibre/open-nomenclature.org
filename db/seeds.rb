# -*- coding: utf-8 -*-
XMLNS = 'http://www.ekylibre.org/XML/2013/nomenclatures'.freeze
NS_SEPARATOR = '-'

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

LOCALES = translations.keys.freeze
puts LOCALES.inspect

STDOUT.sync = true

def import_items(nomenclature, name, subsets, parent = nil)
  print "<#{name}"
  for element in subsets[name].xpath('xmlns:items/xmlns:item')
    item = Item.create!(name: element.attr(:name), nomenclature: nomenclature, state: 'approved', parent: parent)
    for locale in LOCALES
      I18n.with_locale(locale) do
        item.label = "nomenclatures.#{nomenclature.name}.items.#{item.name}".t
      end
    end if nomenclature.translateable?

    for property_nature in nomenclature.property_natures
      if element.has_attribute?(property_nature.name)
        property = item.properties.new(nature: property_nature)
        property.value = element.attr(property_nature.name)
        property.save!
      end
    end

    print '·'
    import_items(nomenclature, item.name, subsets, item) if subsets[item.name]
  end
  print '>'
end

for name, subsets in master
  print "#{name}: "
  root = subsets[:root]
  nomenclature = Nomenclature.create!(name: name, state: 'approved', translateable: (root.attr('translateable').to_s != 'false'))
  for locale in LOCALES
    I18n.with_locale(locale) do
      nomenclature.label = "nomenclatures.#{name}.name".t
    end
  end
  for element in subsets[:root].xpath('xmlns:property-natures/xmlns:property-nature')
    property_nature = PropertyNature.create!(name: element.attr(:name), nomenclature: nomenclature, datatype: element.attr('type'), state: 'approved')
    for locale in LOCALES
      I18n.with_locale(locale) do
        property_nature.label = "nomenclatures.#{name}.property_natures.#{property_nature.name}".t
      end
    end
  end

  import_items(nomenclature, :root, subsets)
  puts ''
end
