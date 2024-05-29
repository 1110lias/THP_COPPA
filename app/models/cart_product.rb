class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end

def total_price
  product.price*quantity
end

end