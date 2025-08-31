module AdminHelper
  def admin_breadcrumb(*links)
    content_tag :nav, class: 'breadcrumb' do
      content_tag :ol, class: 'breadcrumb-list' do
        links.map do |link|
          if link.is_a?(Array)
            content_tag :li, link_to(link.first, link.last), class: 'breadcrumb-item'
          else
            content_tag :li, link, class: 'breadcrumb-item active'
          end
        end.join.html_safe
      end
    end
  end

  def status_badge(status)
    case status
    when true, 'published'
      content_tag :span, 'Published', class: 'badge badge-success'
    when false, 'unpublished'
      content_tag :span, 'Draft', class: 'badge badge-secondary'
    else
      content_tag :span, status.to_s.humanize, class: 'badge badge-info'
    end
  end

  def sort_link(column, title = nil)
    title ||= column.to_s.humanize
    direction = (params[:sort] == column.to_s && params[:direction] == 'asc') ? 'desc' : 'asc'

    link_to title, params.permit!.merge(sort: column, direction: direction)
  end
end
