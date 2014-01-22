json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :is_active
  json.url organization_url(organization, format: :json)
end
