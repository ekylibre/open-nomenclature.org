module Translateable
  extend ActiveSupport::Concern

  included do
    has_many :translations, class_name: "#{name}Translation"

    scope :localized, lambda {
      where(translations_model.table_name => { language: I18n.locale }).includes(:translations).order("#{translations_model.table_name}.label")
    }
  end

  module ClassMethods
    def translations_model
      reflections['translations'].class_name.constantize
    end
  end

  def label
    if translation = translations.find_by(language: I18n.locale)
      translation.label
    end
  end

  def description
    if translation = translations.find_by(language: I18n.locale)
      translation.description
    end
  end

  def label=(value)
    translation = translations.find_or_initialize_by(language: I18n.locale)
    translation.label = value
    translation.save!
  end

  def description=(value)
    translation = translations.find_or_initialize_by(language: I18n.locale)
    translation.description = value
    translation.save!
  end
end
