class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products_joins, dependent: :destroy
  has_many :products, through: :cart_products_joins, dependent: :destroy
  # Validate that each user has at most one cart
  validates :user_id, uniqueness: true

  def add_product(product_id, quantity = 1)
    item = add_product.find_by(product_id: product_id)
    if item
      item.increment(:quantity, quantity)
    else
      item = add_product.build(product_id: product_id, quantity: quantity)
    end
    item.save
  end
  
  def remove_product(product_id)
    item = add_product.find_by(product_id: product_id)
    item.destroy if item
  end
  
  def total_price
    add_product.to_a.sum { |item| item.total_price }
  end
end
