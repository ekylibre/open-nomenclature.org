module ApplicationHelper

  def title(*args)
    if args.any?
      if args.first.is_a?(String)
        content_for(:title, args.first)
      end
    else
      return content_tag(:h1, content_for?(:title) ? content_for(:title) : "actions.#{controller_path}.#{action_name}".t)
    end
  end

  
  

end
