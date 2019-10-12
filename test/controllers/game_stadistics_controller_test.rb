require 'test_helper'

class GameStadisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_stadistic = game_stadistics(:one)
  end

  test "should get index" do
    get game_stadistics_url
    assert_response :success
  end

  test "should get new" do
    get new_game_stadistic_url
    assert_response :success
  end

  test "should create game_stadistic" do
    assert_difference('GameStadistic.count') do
      post game_stadistics_url, params: { game_stadistic: { amount_lines: @game_stadistic.amount_lines, color: @game_stadistic.color, completed_squares: @game_stadistic.completed_squares, game_id: @game_stadistic.game_id, player_id: @game_stadistic.player_id, streak: @game_stadistic.streak } }
    end

    assert_redirected_to game_stadistic_url(GameStadistic.last)
  end

  test "should show game_stadistic" do
    get game_stadistic_url(@game_stadistic)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_stadistic_url(@game_stadistic)
    assert_response :success
  end

  test "should update game_stadistic" do
    patch game_stadistic_url(@game_stadistic), params: { game_stadistic: { amount_lines: @game_stadistic.amount_lines, color: @game_stadistic.color, completed_squares: @game_stadistic.completed_squares, game_id: @game_stadistic.game_id, player_id: @game_stadistic.player_id, streak: @game_stadistic.streak } }
    assert_redirected_to game_stadistic_url(@game_stadistic)
  end

  test "should destroy game_stadistic" do
    assert_difference('GameStadistic.count', -1) do
      delete game_stadistic_url(@game_stadistic)
    end

    assert_redirected_to game_stadistics_url
  end
end
