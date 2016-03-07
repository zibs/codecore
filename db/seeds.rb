# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do
  u = User.create first_name:   Faker::Name.first_name,
                  last_name:    Faker::Name.last_name,
                  email:        Faker::Internet.email,
                  description:  Faker::Lorem.sentences(4),
                  password:     Faker::Internet.password,
                  image:        Faker::Avatar.image("my-own-slug", "400x400")
  
end
