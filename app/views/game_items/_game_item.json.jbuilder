json.extract! game_item, :id, :game_id, :item_id, :active, :created_at, :updated_at
json.url game_item_url(game_item, format: :json)
