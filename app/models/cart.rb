class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products_joins
  has_many :products, through: :cart_products_joins
end
