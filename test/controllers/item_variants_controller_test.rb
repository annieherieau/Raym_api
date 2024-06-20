require "test_helper"

class ItemVariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_variant = item_variants(:one)
  end

  test "should get index" do
    get item_variants_url, as: :json
    assert_response :success
  end

  test "should create item_variant" do
    assert_difference("ItemVariant.count") do
      post item_variants_url, params: { item_variant: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show item_variant" do
    get item_variant_url(@item_variant), as: :json
    assert_response :success
  end

  test "should update item_variant" do
    patch item_variant_url(@item_variant), params: { item_variant: {  } }, as: :json
    assert_response :success
  end

  test "should destroy item_variant" do
    assert_difference("ItemVariant.count", -1) do
      delete item_variant_url(@item_variant), as: :json
    end

    assert_response :no_content
  end
end
