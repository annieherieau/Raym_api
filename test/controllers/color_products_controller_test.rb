require "test_helper"

class ColorProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color_product = color_products(:one)
  end

  test "should get index" do
    get color_products_url, as: :json
    assert_response :success
  end

  test "should create color_product" do
    assert_difference("ColorProduct.count") do
      post color_products_url, params: { color_product: { color_id: @color_product.color_id, product_id: @color_product.product_id } }, as: :json
    end

    assert_response :created
  end

  test "should show color_product" do
    get color_product_url(@color_product), as: :json
    assert_response :success
  end

  test "should update color_product" do
    patch color_product_url(@color_product), params: { color_product: { color_id: @color_product.color_id, product_id: @color_product.product_id } }, as: :json
    assert_response :success
  end

  test "should destroy color_product" do
    assert_difference("ColorProduct.count", -1) do
      delete color_product_url(@color_product), as: :json
    end

    assert_response :no_content
  end
end
