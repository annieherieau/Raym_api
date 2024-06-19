require "test_helper"

class OptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option = options(:one)
  end

  test "should get index" do
    get options_url, as: :json
    assert_response :success
  end

  test "should create option" do
    assert_difference("Option.count") do
      post options_url, params: { option: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show option" do
    get option_url(@option), as: :json
    assert_response :success
  end

  test "should update option" do
    patch option_url(@option), params: { option: {  } }, as: :json
    assert_response :success
  end

  test "should destroy option" do
    assert_difference("Option.count", -1) do
      delete option_url(@option), as: :json
    end

    assert_response :no_content
  end
end
