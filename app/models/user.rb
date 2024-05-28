class User < ApplicationRecord
  has_many :orders
  belongs_to :carts
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
end
