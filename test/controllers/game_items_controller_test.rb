require 'test_helper'

class GameItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_item = game_items(:one)
  end

  test "should get index" do
    get game_items_url
    assert_response :success
  end

  test "should get new" do
    get new_game_item_url
    assert_response :success
  end

  test "should create game_item" do
    assert_difference('GameItem.count') do
      post game_items_url, params: { game_item: { active: @game_item.active, game_id: @game_item.game_id, item_id: @game_item.item_id } }
    end

    assert_redirected_to game_item_url(GameItem.last)
  end

  test "should show game_item" do
    get game_item_url(@game_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_item_url(@game_item)
    assert_response :success
  end

  test "should update game_item" do
    patch game_item_url(@game_item), params: { game_item: { active: @game_item.active, game_id: @game_item.game_id, item_id: @game_item.item_id } }
    assert_redirected_to game_item_url(@game_item)
  end

  test "should destroy game_item" do
    assert_difference('GameItem.count', -1) do
      delete game_item_url(@game_item)
    end

    assert_redirected_to game_items_url
  end
end
