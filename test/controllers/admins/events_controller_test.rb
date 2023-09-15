require "test_helper"

class Admins::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admins_event = admins_events(:one)
  end

  test "should get index" do
    get admins_events_url
    assert_response :success
  end

  test "should get new" do
    get new_admins_event_url
    assert_response :success
  end

  test "should create admins_event" do
    assert_difference("Admins::Event.count") do
      post admins_events_url, params: { admins_event: { date: @admins_event.date, description: @admins_event.description, location: @admins_event.location, name: @admins_event.name } }
    end

    assert_redirected_to admins_event_url(Admins::Event.last)
  end

  test "should show admins_event" do
    get admins_event_url(@admins_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_admins_event_url(@admins_event)
    assert_response :success
  end

  test "should update admins_event" do
    patch admins_event_url(@admins_event), params: { admins_event: { date: @admins_event.date, description: @admins_event.description, location: @admins_event.location, name: @admins_event.name } }
    assert_redirected_to admins_event_url(@admins_event)
  end

  test "should destroy admins_event" do
    assert_difference("Admins::Event.count", -1) do
      delete admins_event_url(@admins_event)
    end

    assert_redirected_to admins_events_url
  end
end
