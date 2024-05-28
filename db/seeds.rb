# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed file to populate the database with dummy data

require "faker"

# Destroy existing records to start fresh
CartProduct.destroy_all
Order.destroy_all
Product.destroy_all
Cart.destroy_all
User.destroy_all
OrderProduct.destroy_all

# Create users
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    billing_address: Faker::Address.full_address,
    delivery_address: Faker::Address.full_address,
    password_digest: Faker::Internet.password,
    isadmin: Faker::Boolean.boolean # Add admin status
  )
end

# Create orders
10.times do
  order = Order.create!(
    status: Faker::Lorem.word,
    startedate: Faker::Date.backward(days: 30),
    total_price: Faker::Number.decimal(l_digits: 2),
    user: User.all.sample
  )
end

# Create carts
10.times do
  cart = Cart.create!(
    startedate: Faker::Date.backward(days: 30),
    total_price: Faker::Number.decimal(l_digits: 2),
    user: User.all.sample
  )
end

# Create products
10.times do
  product = Product.create!(
    title: Faker::Commerce.product_name,
    category: Faker::Commerce.department(max: 1, fixed_amount: true),
    subtitle: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 0..100.0, as_string: false)
  )
end

# Create cart products
10.times do
  CartProduct.create!(
    cart: Cart.all.sample,
    product: Product.all.sample,
    quantity: Faker::Number.between(from: 1, to: 10)
  )
end
    
# Create order products
10.times do
  OrderProduct.create!(
    order: Order.all.sample,
    product: Product.all.sample,
    quantity: Faker::Number.between(from: 1, to: 10)
  )
end
 

puts "Seed data created successfully!"
