class Cart < ApplicationRecord
  has_many :cart_products_join
  has_many :products, through: :cart_products_join
  
  belongs_to :users
end
