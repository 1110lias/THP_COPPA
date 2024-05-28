class User < ApplicationRecord
  has_many :orders
  has_one :cart
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
end
