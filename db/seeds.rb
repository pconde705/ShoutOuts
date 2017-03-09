# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# wisc = School.create(name: "University of Wisconsin-Madison", email_domain_name: "wisc.edu")
# ccc = School.create(name: "Columbia College Chicago", email_domain_name: "colum.edu")

# The bottom is only for the Heroku seed, inflating likes

# wisc = School.find_by(name: "University of Wisconsin-Madison")

# 100.times do
#   wisc.users.create(email: "#{Faker::Internet.user_name}@wisc.edu", password: Faker::Internet.password(8))
# end

# def create_likes(post, number)
#   number.times do
#     post.likes.create(user: User.all.to_a.sample)
#   end
# end

# wisc.posts.each do |post|
#   likes_count = rand(100)
#   create_likes(post, likes_count)
# end
