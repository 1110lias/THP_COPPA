class Product < ApplicationRecord
  has_many :order_product, dependent: :destroy
  has_many :orders, through: :order_product, dependent: :destroy
  has_many :cart_product, dependent: :destroy
  has_many :carts, through: :cart_product, dependent: :destroy
  has_one_attached :photo
  validates :title, presence: true
  validates :category, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
