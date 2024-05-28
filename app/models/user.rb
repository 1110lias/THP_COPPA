class User < ApplicationRecord
  has_many :orders
  has_one :cart
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true\

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
