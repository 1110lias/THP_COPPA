require "test_helper"

class OrderProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_product = order_products(:one)
  end

  test "should get index" do
    get order_products_url
    assert_response :success
  end

  test "should get new" do
    get new_order_product_url
    assert_response :success
  end

  test "should create order_product" do
    assert_difference("OrderProduct.count") do
      post order_products_url, params: { order_product: { orders: @order_product.orders, products: @order_product.products } }
    end

    assert_redirected_to order_product_url(OrderProduct.last)
  end

  test "should show order_product" do
    get order_product_url(@order_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_product_url(@order_product)
    assert_response :success
  end

  test "should update order_product" do
    patch order_product_url(@order_product), params: { order_product: { orders: @order_product.orders, products: @order_product.products } }
    assert_redirected_to order_product_url(@order_product)
  end

  test "should destroy order_product" do
    assert_difference("OrderProduct.count", -1) do
      delete order_product_url(@order_product)
    end

    assert_redirected_to order_products_url
  end
end
