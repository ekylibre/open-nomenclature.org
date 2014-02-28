module ApplicationHelper

  def title(*args, &block)
    default = "actions.#{controller_path}.#{action_name}".t
    if args.any?
      if args.first.is_a?(String)
        content_for(:title, args.first)
      end
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
    return content_tag(:i, "", class: classes.join(' '))
  end
  

end
