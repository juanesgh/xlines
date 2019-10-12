require 'test_helper'

class GamePlayerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get game_player_create_url
    assert_response :success
  end

end
