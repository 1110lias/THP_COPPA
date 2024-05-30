class CartProductsController < ApplicationController
  before_action :set_cart_product, only: %i[ show edit update destroy ]

  # GET /cart_products or /cart_products.json
  def index
    @cart_products = CartProduct.all
    @cart = current_user.cart
  end

  # GET /cart_products/1 or /cart_products/1.json
  def show
  end

  # GET /cart_products/new
  def new
    @cart_product = CartProduct.new
  end

  # GET /cart_products/1/edit
  def edit
  end

  # POST /cart_products or /cart_products.json
  def create
    @cart_product = CartProduct.new(cart_product_params)

    respond_to do |format|
      if @cart_product.save
        format.html { redirect_to cart_product_url(@cart_product), notice: "Cart product was successfully created." }
        format.json { render :show, status: :created, location: @cart_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_products/1 or /cart_products/1.json
  def update
    respond_to do |format|
      if @cart_product.update(cart_product_params)
        format.html { redirect_to cart_product_url(@cart_product), notice: "Cart product was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_products/1 or /cart_products/1.json
  def destroy
    @cart_product.destroy!

    respond_to do |format|
      format.html { redirect_to cart_products_url, notice: "Cart product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_product
      @cart_product = CartProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_product_params
      params.require(:cart_product).permit(:carts, :products)
    end
end


#Cart controller test
before_action :authenticate_user!

def create
  @cart = current_user.cart
  @cart_product = @cart.cart_products.find_or_initialize_by(product_id: cart_product_params[:product_id])
  @cart_product.quantity += cart_product_params[:quantity].to_i
  if @cart_product.save
    redirect_to cart_path, notice: 'Product added to cart.'
  else
    redirect_to product_path(cart_product_params[:product_id]), alert: 'Failed to add product to cart.'
  end
end

def destroy
  @cart_product = CartProduct.find(params[:id])
  @cart_product.destroy
  redirect_to cart_path, notice: 'Product removed from cart.'
end

private

def cart_product_params
  params.require(:cart_product).permit(:product_id, :quantity)
end
end