# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Users
User.create!(name: "Test User",
             email: "test@gmail.com",
             password: "password",
             password_confirmation: "password")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password)
end

# Following Relationships
users = User.all
user = users.first
following = users[4..50]
followers = users[2..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

