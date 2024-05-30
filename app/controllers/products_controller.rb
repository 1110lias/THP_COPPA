class ProductsController < ApplicationController
  before_action :require_admin, only: [:edit, :update, :destroy]
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:add_to_cart] # Ensure user is authenticated before accessing add_to_cart action

  # GET /products or /products.json
  def index
    if params[:category_ids].present?
      @products = Product.where(category: params[:category_ids])
    else
      @products = Product.all
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product) }
        format.json { render :show, status: :created, location: @product }
        flash[:success] = "Le produit a été créé avec succès !"
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        flash[:error] = "Il y a eu un problème lors de la création du produit."
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "" }
        format.json { render :show, status: :ok, location: @product }
        flash[:success] = "Le produit a été modifié avec succès !"
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Le produit a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  # POST /products/:id/add_to_cart
  def add_to_cart
    product = Product.find(params[:id])
    user_cart = current_user.cart

    # If the user doesn't have a cart, create one
    unless user_cart
      user_cart = Cart.create(user: current_user)
    end

    # Check if the product already exists in the cart
    cart_product = user_cart.cart_products.find_by(product_id: product.id)

    if cart_product.nil?
      # If the product does not exist in the cart, create a new CartProduct
      cart_product = CartProduct.create(cart: user_cart, product: product, quantity: 1)
    else
      # If the product already exists in the cart, increase its quantity by 1
      cart_product.quantity += 1
    end

    if cart_product.save
      redirect_to cart_path(current_user), notice: "#{product.title} added to cart successfully."
    else
      redirect_to product_path(product), alert: "Failed to add #{product.title} to cart."
    end
  end

  private

  def require_admin
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user.isadmin?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :category, :subtitle, :description, :price, :photo)
  end
end
