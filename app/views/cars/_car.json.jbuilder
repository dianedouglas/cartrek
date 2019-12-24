json.extract! car, :id, :model, :make, :color, :mileage, :is_for_sale, :created_at, :updated_at
json.url car_url(car, format: :json)
