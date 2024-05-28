class Order < ApplicationRecord
  has_many :order_products_join
  has_many :products, through: :order_products_join

  belongs_to :user
end
