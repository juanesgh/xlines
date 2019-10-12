require "application_system_test_case"

class GameStadisticsTest < ApplicationSystemTestCase
  setup do
    @game_stadistic = game_stadistics(:one)
  end

  test "visiting the index" do
    visit game_stadistics_url
    assert_selector "h1", text: "Game Stadistics"
  end

  test "creating a Game stadistic" do
    visit game_stadistics_url
    click_on "New Game Stadistic"

    fill_in "Amount lines", with: @game_stadistic.amount_lines
    fill_in "Color", with: @game_stadistic.color
    fill_in "Completed squares", with: @game_stadistic.completed_squares
    fill_in "Game", with: @game_stadistic.game_id
    fill_in "Player", with: @game_stadistic.player_id
    fill_in "Streak", with: @game_stadistic.streak
    click_on "Create Game stadistic"

    assert_text "Game stadistic was successfully created"
    click_on "Back"
  end

  test "updating a Game stadistic" do
    visit game_stadistics_url
    click_on "Edit", match: :first

    fill_in "Amount lines", with: @game_stadistic.amount_lines
    fill_in "Color", with: @game_stadistic.color
    fill_in "Completed squares", with: @game_stadistic.completed_squares
    fill_in "Game", with: @game_stadistic.game_id
    fill_in "Player", with: @game_stadistic.player_id
    fill_in "Streak", with: @game_stadistic.streak
    click_on "Update Game stadistic"

    assert_text "Game stadistic was successfully updated"
    click_on "Back"
  end

  test "destroying a Game stadistic" do
    visit game_stadistics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game stadistic was successfully destroyed"
  end
end
