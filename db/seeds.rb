# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

XMLNS = "http://www.ekylibre.org/XML/2013/nomenclatures".freeze
NS_SEPARATOR = "-"

# Import data
# ActiveRecord::Base.transation do
master = HashWithIndifferentAccess.new
for path in Dir.glob(Rails.root.join("db", "import", "nomenclatures", "**", "*.xml"))
  f = File.open(path, "rb")
  document = Nokogiri::XML(f) do |config|
    config.strict.nonet.noblanks.noent
  end
  f.close
  if document.root.namespace.href.to_s == XMLNS
    document.root.xpath('xmlns:nomenclature').each do |element|
      nomenclature, item = element.attr("name").to_s.split(NS_SEPARATOR)[0..1]
      item = :root if item.blank?
      master[nomenclature] ||= HashWithIndifferentAccess.new
      master[nomenclature][item] = element
    end
  else
    Rails.logger.info("File #{path} is not a nomenclature as defined by #{XMLNS}")
  end
end


translations = {}
Dir.chdir(Rails.root.join("config", "locales", "import")) do
  for locale in Dir.glob("*")
    translations.update YAML.load_file("#{locale}/nomenclatures.yml").symbolize_keys
  end
end

locales = translations.keys
puts locales.inspect

for name, subsets in master
  nomenclature = Nomenclature.create!(name: name, state: "approved")
  for locale in locales
    I18n.with_locale(locale) do
      nomenclature.label = "nomenclatures.#{name}.name".t
    end
  end
  for element in subsets[:root].xpath('xmlns:items/xmlns:item')
    item = Item.create!(name: element.attr(:name), nomenclature: nomenclature, state: "approved")
    for locale in locales
      I18n.with_locale(locale) do
        item.label = "nomenclatures.#{name}.items.#{item.name}".t
      end
    end

  end


end
