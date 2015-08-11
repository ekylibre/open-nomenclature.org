for item in @nomenclature.items
  json.set! item.name do
    json.label item.label
  end
end
