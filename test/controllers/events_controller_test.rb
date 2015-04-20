require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get event_home" do
    get :event_home
    assert_response :success
  end

end
