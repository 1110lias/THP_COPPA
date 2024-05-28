require "test_helper"

class CartProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_product = cart_products(:one)
  end

  test "should get index" do
    get cart_products_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_product_url
    assert_response :success
  end

  test "should create cart_product" do
    assert_difference("CartProduct.count") do
      post cart_products_url, params: { cart_product: { carts: @cart_product.carts, products: @cart_product.products } }
    end

    assert_redirected_to cart_product_url(CartProduct.last)
  end

  test "should show cart_product" do
    get cart_product_url(@cart_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_product_url(@cart_product)
    assert_response :success
  end

  test "should update cart_product" do
    patch cart_product_url(@cart_product), params: { cart_product: { carts: @cart_product.carts, products: @cart_product.products } }
    assert_redirected_to cart_product_url(@cart_product)
  end

  test "should destroy cart_product" do
    assert_difference("CartProduct.count", -1) do
      delete cart_product_url(@cart_product)
    end

    assert_redirected_to cart_products_url
  end
end
