json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :war_cry, :level, :status, :city, :state, :is_verified, :is_registered, :verification_date, :registration_date
  json.url club_url(club, format: :json)
end
