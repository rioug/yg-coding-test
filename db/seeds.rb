# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bakery_retailer = Retailer.create(name: 'Bakery')
dairy_retailer = Retailer.create(name: 'Dairy')
supermarket_retailer = Retailer.create(name: 'Supermarket')

Product.create([
  {
    name: 'Baguette',
    price: '7.99'.to_d,
    retailer: bakery_retailer,
  },
  {
    name: 'Organic Sourdough',
    price: '14.99'.to_d,
    retailer: bakery_retailer,
  },
  {
    name: 'Milk',
    price: '4.99'.to_d,
    retailer: dairy_retailer,
  },
  {
    name: 'Avocado',
    price: '4.99'.to_d,
    retailer: supermarket_retailer,
  },
  {
    name: 'Banana',
    price: '1.50'.to_d,
    retailer: supermarket_retailer,
  },
  {
    name: 'Toilet Paper 6 Pack',
    price: '5.99'.to_d,
    retailer: supermarket_retailer,
  },
])
