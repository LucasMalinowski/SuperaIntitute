module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    else 'alert alert-info'
    end
  end

  def admin_layout?
    controller.class.name.start_with?('Admin::')
  end

  def present(object, presenter_class = nil)
    presenter_class ||= "#{object.class.name}Presenter".constantize
    presenter_class.new(object)
  rescue NameError
    object
  end

  def active_nav_link(path)
    'active' if current_page?(path)
  end

  def truncate_html(text, length = 150)
    strip_tags(text).truncate(length)
  end
end
