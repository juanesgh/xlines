require 'test_helper'

class TurnsControllerTest < ActionDispatch::IntegrationTest
  test "should get change_turn" do
    get turns_change_turn_url
    assert_response :success
  end

end
