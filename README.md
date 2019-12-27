# _Car Trek_

#### _A Rails App For Keeping Track of Cars and Their Owners_

#### By Diane Douglas

## Description

This app demonstrates a has_many_through relationship between Cars and People through Ownerships. A car potentially has a history of many owners, and a person can own many cars. We join together the foreign key of a car with that of an owner through the Ownerships table.

## Setup/Installation Requirements

1. Clone or download this repository, then change directory into the project folder.

```
git clone https://github.com/dianedouglas/cartrek.git
cd cartrek
```

2. Install gems:


```
bundle
```

3. Create the database and seed with sample data:

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake cartrek:sample_data
```

4. Launch a local server:

```
bin/rails s
```

5. Navigate to localhost:3000 in your browser:

```
localhost:3000
```

6. Run the test suite:


```
bin/rails test:system test
```

## Support and contact details

* Email: diane.douglas1@gmail.com
* My Website: [www.MelodicCode.com](http://www.melodiccode.com)

## Technologies Used

* Ruby on Rails 5
* Bootstrap/SASS
* Minitest/Capybara/Selenium

Copyright (c) 2019 **Diane Douglas**