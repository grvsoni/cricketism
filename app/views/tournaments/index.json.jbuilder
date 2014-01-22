json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :match_type_id, :level_id, :user_id
  json.url tournament_url(tournament, format: :json)
end
