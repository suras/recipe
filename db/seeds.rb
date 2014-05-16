# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@admin.com", password: "12345678")
Ingredient.create(name: "tomato", ext_image_url: "http://www.clker.com/cliparts/P/X/o/J/P/A/tomatoes-md.png")
Ingredient.create(name: "onion", ext_image_url: "http://www.onionsaustralia.org.au/images/website/content/about-onions/brown-onion.jpg")
Ingredient.create(name: "capsicum", ext_image_url: "http://www.perfection.com.au/pfimages/1816-main.jpg")
Ingredient.create(name: "mozeralla", ext_image_url: "http://www.menshealth.com/mhlists/cms/uploads/1/mozzarella-cheese-edited.jpg
")
Ingredient.create(name: "floor", ext_image_url: "http://www.hasmert.com/urun_resimleri/un.jpg")
Ingredient.create(name: "dry yeast", ext_image_url: "http://whatscookingamerica.net/Bread/RedStarActiveDryYeast.jpg")
Ingredient.create(name: "sauce", ext_image_url: "http://slice.seriouseats.com/images/20101007-pizza-lab-sauce.jpg")
Workflow.create(name: "bake", ext_image_url:"http://www.clker.com/cliparts/T/f/Q/z/Q/c/bun-in-the-oven-hi.png")
Workflow.create(name: "chop", ext_image_url:"http://www.chow.com/assets/2008/08/4.PeelChopOnionGarlic.jpg")
Workflow.create(name: "mix ingredients", ext_image_url:"http://www.moocowfanclub.com/files/china/Mix.jpg")


