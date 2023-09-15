require "application_system_test_case"

class Admins::EventsTest < ApplicationSystemTestCase
  setup do
    @admins_event = admins_events(:one)
  end

  test "visiting the index" do
    visit admins_events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit admins_events_url
    click_on "New event"

    fill_in "Date", with: @admins_event.date
    fill_in "Description", with: @admins_event.description
    fill_in "Location", with: @admins_event.location
    fill_in "Name", with: @admins_event.name
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit admins_event_url(@admins_event)
    click_on "Edit this event", match: :first

    fill_in "Date", with: @admins_event.date
    fill_in "Description", with: @admins_event.description
    fill_in "Location", with: @admins_event.location
    fill_in "Name", with: @admins_event.name
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit admins_event_url(@admins_event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
