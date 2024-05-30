class Cart < ApplicationRecord
  belongs_to :user

  # Validate that each user has at most one cart
  validates :user_id, uniqueness: true
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

end
