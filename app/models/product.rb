class Product < ApplicationRecord
  has_many :order_product_joins, dependent: :destroy
  has_many :orders, through: :order_product_joins, dependent: :destroy
  has_many :cart_product_joins, dependent: :destroy
  has_many :carts, through: :cart_product_joins, dependent: :destroy
end
