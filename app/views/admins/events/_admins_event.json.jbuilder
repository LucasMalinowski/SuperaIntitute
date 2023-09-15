json.extract! admins_event, :id, :name, :description, :date, :location, :created_at, :updated_at
json.url admins_event_url(admins_event, format: :json)
