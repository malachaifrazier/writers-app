json.extract! location, :id, :name, :nation, :state, :city, :position, :description, :created_at, :updated_at
json.url location_url(location, format: :json)