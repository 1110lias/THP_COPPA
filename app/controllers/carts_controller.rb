class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show]

  # GET /cart
  def show
    @cart_products = @cart.cart_products.includes(:product)
  end

  private

  def set_cart
    @cart = current_user.cart
  end
end
