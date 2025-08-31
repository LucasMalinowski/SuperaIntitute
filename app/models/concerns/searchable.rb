module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search, ->(query) {
      return all if query.blank?

      searchable_columns = %w[name description location]
      conditions = searchable_columns.map do |column|
        "#{column} ILIKE ?"
      end.join(' OR ')

      query_param = "%#{query.strip}%"
      where(conditions, *([query_param] * searchable_columns.length))
    }
  end
end