require "test_helper"

class VariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variant = variants(:one)
  end

  test "should get index" do
    get variants_url, as: :json
    assert_response :success
  end

  test "should create variant" do
    assert_difference("Variant.count") do
      post variants_url, params: { variant: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show variant" do
    get variant_url(@variant), as: :json
    assert_response :success
  end

  test "should update variant" do
    patch variant_url(@variant), params: { variant: {  } }, as: :json
    assert_response :success
  end

  test "should destroy variant" do
    assert_difference("Variant.count", -1) do
      delete variant_url(@variant), as: :json
    end

    assert_response :no_content
  end
end
