require 'test_helper'

class MovementControllerTest < ActionDispatch::IntegrationTest
  test "should get move" do
    get movement_move_url
    assert_response :success
  end

end
