# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create(name: "Boston", city: "Boston", state: "MA", country: "USA")
Location.create(name: "Quincy", city: "Quincy", state: "MA", country: "USA")
Location.create(name: "Cambridge", city: "Boston", state: "MA", country: "USA")
User.create(email: "test@test.com", password: "Test1234", password_confirmation: "Test1234")
