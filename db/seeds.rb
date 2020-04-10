# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

card_data = JSON.parse(File.read(Rails.root + "db/cards.json"))

puts "creating cards..."

if Rails.env.development?
  10.times do |i|
    Card.create!(name: "test card #{i}", content: "This is test card #{i}. I should only exist in development!")
  end
end

puts "done!"
