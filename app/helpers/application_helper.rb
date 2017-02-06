module ApplicationHelper
  def title(*args, &_block)
    default = "actions.#{controller_path}.#{action_name}".t
    if args.any?
      content_for(:title, args.first) if args.first.is_a?(String)
    elsif block_given?
      content_for(:title) do
        yield default
      end
    else
      return content_tag(:h1, content_for?(:title) ? content_for(:title) : default)
    end
  end

  def state_icon(record)
    classes = [:fa, :state, record.class.name.underscore, record.state]
    content_tag(:i, '', class: classes.join(' '))
  end

  def graph(_item); end

  def human_property(*args)
    if args.first.is_a?(Property)
      property = args.shift
    elsif args.first.is_a?(Item)
      item = args.shift
      property = item.get(args.shift)
    end
    return nil unless property
    if property.choices_nomenclature
      foreign_items = property.choices_nomenclature.items
      if property.datatype == 'item'
        target = foreign_items.find_by(name: property.value)
        return target ? link_to_item(target) : name
      elsif property.datatype == 'item_list'
        return foreign_items.localized.where(name: property.value.split(/\s*\,\s*/)).map do |target|
          link_to_item(target)
        end.to_sentence(locale: :fr).html_safe
      else
        property.value
      end
    else
      property.value
    end
  end

  def link_to_item(item)
    link_to(item.label, { controller: :items, action: :show, nomenclature_id: item.nomenclature.to_param, id: item.name }, title: item.name)
  end
end
