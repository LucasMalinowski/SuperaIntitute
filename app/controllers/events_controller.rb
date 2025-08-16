# frozen_string_literal: true

# Public controller for browsing events. Only shows published events.
class EventsController < ApplicationController
  def index
    @events = EventQuery.new.upcoming.page(params[:page]).per(6)
  end

  def show
    @event = Event.friendly.find(params[:id])
  end
end