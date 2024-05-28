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

# Destroy existing records to start fresh
Cart.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all
CartsProduct.destroy_all
OrderItem.destroy_all

# Create users
users = []
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    password_digest: Faker::Internet.password, 
    email: Faker::Internet.email, 
    phone_number: Faker::PhoneNumber.phone_number, 
    billing_address: Faker::Address.full_address, 
    delivery_address: Faker::Address.full_address
  )
  users << user
end

# Create fake carts
carts = []
10.times do
  cart = Cart.create!(
    total_price: rand(1.0..1000.0), 
    user_id: users.sample.id, 
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days
  )
  carts << cart
end

# Create fake products
products = []
10.times do 
  product = Product.create!(
    title: Faker::Beer.name,
    category: Faker::Beer.style,
    subtitle: Faker::Beer.alcohol,
    description: Faker::Beer.malts, #=> "Rye malt"
    price: rand(1.0...7.0),
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days
  )
  products << product
end

# Create fake cart-product associations
carts_products = []
10.times do
  cart_product = CartsProduct.create!(
    cart_id: carts.sample.id,
    product_id: products.sample.id,
    quantity: rand(5..15),
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days
  )
  carts_products << cart_product
end

# Create orders
orders = []
10.times do 
  order = Order.create!(
    bundle_order_id: rand(1..10),
    bundle_order_time: Time.now + rand(1..30).days,
    status: "test", 
    startedate: Time.now,
    total_price: rand(1.0..25.0), 
    user_id: users.sample.id,
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days
  )
  orders << order
end

# Create order items
order_items = []
10.times do
  order_item = OrderItem.create!(
    order_id: orders.sample.id,
    product_id: products.sample.id,
    quantity: rand(1..5),
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days
  )
  order_items << order_item
end

puts "Seed data created successfully!"
