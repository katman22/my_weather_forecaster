require "test_helper"

class ForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forecast_index_url
    assert_response :success
  end

  test "should get full_forecast" do
    get forecast_full_forecast_url
    assert_response :success
  end

  test "should get text_only" do
    get forecast_text_only_url
    assert_response :success
  end
end
