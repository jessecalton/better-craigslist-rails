# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# categories = []
# 10.times {Category.create(name: Faker::GameOfThrones.city, description: Faker::GameOfThrones.character)}
10.times {Category.create(name: Faker::GameOfThrones.city, description: Faker::Hipster.sentences(1, true))}
categories = Category.all
categories.each do |category|
  post = Post.new(title: Faker::Commerce.department, body: Faker::ChuckNorris.fact, author: Faker::Cat.name)
  category.posts << post
end
