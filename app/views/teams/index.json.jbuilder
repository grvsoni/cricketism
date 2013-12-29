json.array!(@teams) do |team|
  json.extract! team, :id, :name, :user_id, :club_id, :active
  json.url team_url(team, format: :json)
end
