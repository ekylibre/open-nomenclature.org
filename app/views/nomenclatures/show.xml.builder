xml.instruct!
xml.nomenclature(name: @nomenclature.name) {
  xml.items {
    for item in @nomenclature.items
      xml.item name: item.name, label: item.label
    end
  }
}
