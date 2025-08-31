class ProjectPresenter < ApplicationPresenter
  def status_text
    return 'Ongoing' if object.date.nil?

    object.upcoming? ? 'Upcoming' : 'Completed'
  end

  def status_badge_class
    return 'badge-info' if object.date.nil?

    object.upcoming? ? 'badge-primary' : 'badge-success'
  end

  def formatted_date_or_ongoing
    return 'Ongoing project' if object.date.nil?

    object.date.strftime('%B %d, %Y')
  end

  def short_description(limit = 180)
    return object.description if object.description.length <= limit

    "#{object.description.truncate(limit)}..."
  end
end
