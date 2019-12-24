namespace :cartrek do
  desc "Create basic sample data for app"
  task sample_data: :environment do
    car = Car.new(
      model: "BMW",
      make: "Z3",
      color: "Violet",
      mileage: 150000,
      is_for_sale: true
    )
    car.save
    car = Car.new(
      model: "Porsche",
      make: "911",
      color: "Red",
      mileage: 10000,
      is_for_sale: false
    )
    car.save
    car = Car.new(
      model: "Lotus",
      make: "Evora",
      color: "Yellow",
      mileage: 0,
      is_for_sale: true
    )
    car.save
    car = Car.new(
      model: "Chevrolet",
      make: "Impala",
      color: "Black",
      mileage: 300000,
      is_for_sale: false
    )
    car.save
    car = Car.new(
      model: "Dodge",
      make: "Charger",
      color: "Lime Green",
      mileage: 30000,
      is_for_sale: false
    )
    car.save
  end
end
