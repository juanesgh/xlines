json.extract! game_stadistic, :id, :game_id, :player_id, :completed_squares, :amount_lines, :color, :streak, :created_at, :updated_at
json.url game_stadistic_url(game_stadistic, format: :json)
