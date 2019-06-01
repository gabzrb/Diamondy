# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
puts "Destroying Products"
Annonce.destroy_all
puts "Destroying Annonces"
User.destroy_all
puts "Destroying Users"

User.create(email: "admin@admin.com", password:"123456", admin:true)
puts "Create Admin User..."
