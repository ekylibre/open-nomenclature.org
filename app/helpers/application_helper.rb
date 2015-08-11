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
end
