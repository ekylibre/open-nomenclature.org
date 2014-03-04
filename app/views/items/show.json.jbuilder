json.set! @item.name do
  for property in @item.properties
    json.set! property.name, property.value
  end
end
