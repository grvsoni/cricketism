json.array!(@match_types) do |match_type|
  json.extract! match_type, :id, :name, :player_count, :max_over_batting, :max_run_batting, :max_over_bowling, :innings, :balls_per_over, :rebowl_noball, :noball_runs, :dismiss_on_wicket, :wicket_value, :last_man_bat
  json.url match_type_url(match_type, format: :json)
end
