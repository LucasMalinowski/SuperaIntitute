# frozen_string_literal: true

# Encapsulates business logic for creating, updating and deleting events.
class EventService
  def initialize(event: Event.new, params: {})
    @event = event
    @params = params
  end

  attr_reader :event

  def create
    event.assign_attributes(@params)
    event.save
  end

  def update
    event.update(@params)
  end

  def destroy
    event.destroy
  end
end