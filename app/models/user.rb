class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one :cart
  validates :email, presence: true, uniqueness: true
  after_create :create_cart

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  def last_admin?
    User.where(isadmin: true).count == 1 && self.isadmin?
  end
  def create_cart
    Cart.create(user: self)
  end
end
