json.array!(@profiles) do |profile|
  json.extract! profile, :id, :firstname, :lastname, :dob, :street, :city, :state, :country, :height, :weight, :user_id
  json.url profile_url(profile, format: :json)
end
