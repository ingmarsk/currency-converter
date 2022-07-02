require "test_helper"

class CurrencyConverterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get currency_converter_new_url
    assert_response :success
  end

  test "should get convert" do
    get currency_converter_convert_url
    assert_response :success
  end
end
