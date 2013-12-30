json.array!(@players) do |player|
  json.extract! player, :id, :user_id, :batting_hand, :bowling_hand, :skill, :batting_style, :bowling_style, :is_wicketkeeper
  json.url player_url(player, format: :json)
end
