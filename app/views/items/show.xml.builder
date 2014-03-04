xml.instruct!
xml.item(name: @item.name) {
  for property in @item.properties
    xml.property name: property.name, value: property.value
  end
}
