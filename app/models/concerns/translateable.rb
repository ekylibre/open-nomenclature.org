module Translateable
  extend ActiveSupport::Concern
  
  included do
    has_many :translations, class_name: "#{self.name}Translation"
  end

  def label
    if translation = self.translations.find_by(language: I18n.locale)
      return translation.label
    end
  end

  def description
    if translation = self.translations.find_by(language: I18n.locale)
      return translation.description
    end
  end

  def label=(value)
    unless translation = self.translations.find_by(language: I18n.locale)
      translation = self.translations.build(language: I18n.locale)
    end
    translation.label = value
    translation.save!
  end

  def description=(value)
    unless translation = self.translations.find_by(language: I18n.locale)
      translation = self.translations.build(language: I18n.locale)
    end
    translation.description = value
    translation.save!
  end

end
