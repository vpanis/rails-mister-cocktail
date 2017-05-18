# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Creating ingredients..."
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "Creating cocktails..."
Cocktail.create(name: "Mojito Classic")
Cocktail.create(name: "Mojito Royal")
Cocktail.create(name: "Caipirinha")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Pina Colada")
Cocktail.create(name: "Americano")

puts 'Finished!'
