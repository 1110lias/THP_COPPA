class OrderProduct < ApplicationRecord
  belongs_to :Products
  belongs_to :Orders
end
