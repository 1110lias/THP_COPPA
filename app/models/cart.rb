class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products_joins
  has_many :products, through: :cart_products_joins
  # Validate that each user has at most one cart
  validates :user_id, uniqueness: true
end
