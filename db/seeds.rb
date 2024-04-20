# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "admin@admin", password: "123456")
Genre.create(name: "chocolate")

5.times do |n|
    Item.create!(
      genre_id: "1",
      name: "Item#{n + 1}",
      introduction: "Item created by seed",
      price: 500
    )
  end
