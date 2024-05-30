class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /cart
  def cart
    @cart_products = current_user.cart_products # Logic to retrieve cart items for the current user
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/1/edit
  def edit
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

 
   def destroy
   end

  private
    # Use this callback to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_product_params
      params.require(:cart_product).permit(:cart_id, :product_id, :quantity)
    end
    
end
