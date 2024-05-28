class Ordrer < ApplicationRecord
  has_many :order_products_join
has_many :products through: :order_products_join
(belongs_to :Global_Orders) #Future migration
belongs_to :users
end
