class EventPresenter < ApplicationPresenter
  def formatted_date_with_time
    object.date.strftime('%A, %B %d, %Y at %I:%M %p')
  end

  def short_description(limit = 150)
    return object.description if object.description.length <= limit

    "#{object.description.truncate(limit)}..."
  end

  def status_badge_class
    object.upcoming? ? 'badge-success' : 'badge-secondary'
  end

  def status_text
    object.upcoming? ? 'Upcoming' : 'Past'
  end
end

# app/presenters/role_presenter.rb
class RolePresenter < ApplicationPresenter
  def formatted_salary
    return object.salary if object.salary.match?(/^R\$/)

    "R$ #{object.salary}"
  end

  def benefits_list
    return 'No benefits listed' if object.benefits.blank?

    object.benefits.join(', ')
  end

  def short_description(limit = 200)
    return object.description if object.description.length <= limit

    "#{object.description.truncate(limit)}..."
  end

  def company_with_location
    "#{object.company} - #{object.location}"
  end
end