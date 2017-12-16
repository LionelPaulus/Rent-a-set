json.extract! place, :id, :user_id, :photo_id, :name, :description, :category, :address, :city, :ambience, :area, :exposure, :price, :created_at, :updated_at
json.url place_url(place, format: :json)
