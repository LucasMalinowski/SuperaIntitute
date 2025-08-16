# frozen_string_literal: true

# Provides a fluent interface to filter events by various criteria.
class EventQuery
  def initialize(relation = Event.all)
    @relation = relation
  end

  # Return only upcoming events (starting today or later)
  def upcoming
    @relation.merge(Event.upcoming)
  end

  # Return only past events (already started)
  def past
    @relation.merge(Event.past)
  end

  # Filter by case‑insensitive name substring
  def by_keyword(keyword)
    return @relation if keyword.blank?

    @relation.where('unaccent(name) ILIKE unaccent(?)', "%#{keyword}%")
  end

  # Apply all filters from provided params
  def apply(params = {})
    scope = @relation
    scope = upcoming if params[:status] == 'upcoming'
    scope = past if params[:status] == 'past'
    scope = by_keyword(params[:query])
    scope
  end
end