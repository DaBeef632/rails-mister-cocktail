# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "JSON"

url= "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
cocktail_list = open(url).read
drinks = JSON.parse(cocktail_list)

drinks["drinks"].each do |element|
 x = Ingredient.new(name: element["strIngredient1"])
 x.save
end

