json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :user_id
  json.url sponsor_url(sponsor, format: :json)
end
