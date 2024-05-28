class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /cart
  def cart
    @cart_items = current_user.cart_items # ou votre logique pour récupérer les éléments du panier
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  private
    # Utilisez ce callback pour partager la configuration ou les contraintes communes entre les actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Seuls les paramètres de confiance sont autorisés.
    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
