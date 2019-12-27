namespace :cartrek do
  desc "Create basic sample data for app"
  task sample_data: :environment do
    cars = {}
    people = {}

    car = Car.create!(
      model: "BMW",
      make: "Z3",
      color: "Violet",
      mileage: 150000,
      is_for_sale: true
    )
    cars[:bmw] = car

    car = Car.create!(
      model: "Porsche",
      make: "911",
      color: "Red",
      mileage: 10000,
      is_for_sale: false
    )
    cars[:porsche] = car
    
    car = Car.create!(
      model: "Lotus",
      make: "Evora",
      color: "Yellow",
      mileage: 0,
      is_for_sale: true
    )
    cars[:lotus] = car
    
    car = Car.create!(
      model: "Chevrolet",
      make: "Impala",
      color: "Black",
      mileage: 300000,
      is_for_sale: false
    )
    cars[:impala] = car
    
    car = Car.create!(
      model: "Dodge",
      make: "Charger",
      color: "Lime Green",
      mileage: 30000,
      is_for_sale: false
    )
    cars[:charger] = car    

    person = Person.create!(
      name: 'James T. Kirk',
      email: 'jameskirk@gmail.com',
      phone_number: '617-823-3333'
    )
    people[:kirk] = person

    person = Person.create!(
      name: 'Jean-Luc Picard',
      email: 'jlp@gmail.com',
      phone_number: '323-132-5553'
    )
    people[:picard] = person

    person = Person.create!(
      name: 'Dean Winchester',
      email: 'dwinchester@gmail.com',
      phone_number: '555-666-7777'
    )
    people[:dean] = person

    person = Person.create!(
      name: 'Sam Winchester',
      email: 'swinchester@gmail.com',
      phone_number: '333-666-4444'
    )
    people[:sam] = person

    Ownership.create(car: cars[:impala], person: people[:dean])
    Ownership.create(car: cars[:bmw], person: people[:kirk])
    Ownership.create(car: cars[:charger], person: people[:picard])
  end
end
