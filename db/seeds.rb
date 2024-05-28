# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

Cart.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

#Create users
users =[]
10.times do
    user = User.create(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        password_digest: Faker::Name.last_name, 
        email: Faker::Internet.email, 
        phone_number: Faker::PhoneNumber.phone_number, 
        billing_address: Faker::Address.full_address, 
        delivery_address: Faker::Address.full_address)
end

#Create fake carts
carts = []
10.times do
    cart = Cart.create!(
        total_price: random(1..1000), 
        user_id: random(1..100), 
        created_at: Time.now - rand(1..30).days,
        updated_at: Time.now - rand(1..30).days)
end

#Create fake products
products = []
10.times do 
    product = Product.create(
        title: 
    )