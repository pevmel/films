# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.create(email: 'admin@admin.com', password: 'password', is_admin: true)

10.times do
  category = Category.create(name: Faker::Book.unique.genre)
  10.times do
    category.movies.create(title: Faker::Book.unique.title, description: Faker::Movie.quote)
  end
end
