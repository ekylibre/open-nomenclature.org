for nomenclature in @nomenclatures
  json.set! nomenclature.name do
    json.label nomenclature.label
    json.uri nomenclature_url(nomenclature)
  end
end
