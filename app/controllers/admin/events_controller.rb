# frozen_string_literal: true

module Admin
  # Controller for managing events in the admin panel.
  class EventsController < ApplicationController
    before_action :set_event, only: %i[show edit update destroy]

    def index
      @events = EventQuery.new.apply(params).page(params[:page]).per(20)
      authorize @events
    end

    def show
      authorize @event
    end

    def new
      @event = Event.new
      authorize @event
    end

    def edit
      authorize @event
    end

    def create
      @event = Event.new
      authorize @event
      service = EventService.new(event: @event, params: event_params)
      if service.create
        redirect_to admin_event_path(@event), notice: t('events.created')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @event
      service = EventService.new(event: @event, params: event_params)
      if service.update
        redirect_to admin_event_path(@event), notice: t('events.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @event
      EventService.new(event: @event).destroy
      redirect_to admin_events_path, notice: t('events.destroyed')
    end

    private

    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Strong parameters restrict attributes to those needed for creation/updating.
    def event_params
      params.require(:event).permit(:name, :description, :starts_at, :ends_at, :location, :image)
    end
  end
end