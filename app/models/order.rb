class Order < ApplicationRecord
  has_many :order_products_join
  has_many :products, through: :order_products_join

  belongs_to :user

  after_create :user_confirmation_send
  after_create :admin_confirmation_send

  def user_confirmation_send
    OrderMailer.order_user_email(self).deliver_now
  end

  def admin_confirmation_send
    OrderMailer.order_admin_email(self).deliver_now
  end
end
