xml.instruct!
xml.nomenclatures {
  for nomenclature in @nomenclatures
    xml.nomenclature name: nomenclature.name, label: nomenclature.label, uri: nomenclature_url(nomenclature)
  end
}
