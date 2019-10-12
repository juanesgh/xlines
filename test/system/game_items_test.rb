require "application_system_test_case"

class GameItemsTest < ApplicationSystemTestCase
  setup do
    @game_item = game_items(:one)
  end

  test "visiting the index" do
    visit game_items_url
    assert_selector "h1", text: "Game Items"
  end

  test "creating a Game item" do
    visit game_items_url
    click_on "New Game Item"

    fill_in "Active", with: @game_item.active
    fill_in "Game", with: @game_item.game_id
    fill_in "Item", with: @game_item.item_id
    click_on "Create Game item"

    assert_text "Game item was successfully created"
    click_on "Back"
  end

  test "updating a Game item" do
    visit game_items_url
    click_on "Edit", match: :first

    fill_in "Active", with: @game_item.active
    fill_in "Game", with: @game_item.game_id
    fill_in "Item", with: @game_item.item_id
    click_on "Update Game item"

    assert_text "Game item was successfully updated"
    click_on "Back"
  end

  test "destroying a Game item" do
    visit game_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game item was successfully destroyed"
  end
end
