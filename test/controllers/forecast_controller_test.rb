require "test_helper"

class ForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forecast_index_url
    assert_response :success
  end

  test "should get full_forecast" do
    forecasts = [ { "number" => 1,
                   "name" => "This Afternoon",
                   "temperature" => 70,
                   "temperatureUnit" => "F",
                   "temperatureTrend" => "",
                   "probabilityOfPrecipitation" => { "unitCode" => "wmoUnit:percent", "value" => nil },
                   "windSpeed" => "15 to 20 mph",
                   "windDirection" => "NW",
                   "icon" => "https://api.weather.gov/icons/land/day/few?size=medium",
                   "shortForecast" => "Sunny",
                   "detailedForecast" => "Sunny, with a high near 70. Northwest wind 15 to 20 mph, with gusts as high as 30 mph." },
                 { "number" => 2,
                   "temperature" => 70,
                   "temperatureUnit" => "F",
                   "temperatureTrend" => "",
                   "probabilityOfPrecipitation" => { "unitCode" => "wmoUnit:percent", "value" => nil },
                   "windSpeed" => "15 to 20 mph",
                   "windDirection" => "NW",
                   "icon" => "https://api.weather.gov/icons/land/day/few?size=medium",
                   "shortForecast" => "Sunny",
                   "detailedForecast" => "Sunny, with a high near 70. Northwest wind 15 to 20 mph, with gusts as high as 30 mph." } ]
    result = { "forecasts" => forecasts, "latitude" => 90, "longitude" => 18, "from_cache" => false, "high" => 76, "low" => 45 }
    success_response = Minitest::Mock.new
    success_response.expect :success?, true
    success_response.expect :value, result
    Noaa::Forecast::TextOnly.stub :call, success_response do
      get forecast_full_url
      assert_response :success
    end
  end

  test "should get text_only" do
    forecasts = [ { "number" => 1,
                   "name" => "This Afternoon",
                   "detailedForecast" => "Sunny, with a high near 70. Northwest wind 15 to 20 mph, with gusts as high as 30 mph." },
                 { "number" => 2,
                   "detailedForecast" => "Sunny, with a high near 70. Northwest wind 15 to 20 mph, with gusts as high as 30 mph." } ]
    result = { "forecasts" => forecasts, "latitude" => 90, "longitude" => 18, "from_cache" => false, "high" => 76, "low" => 45 }
    success_response = Minitest::Mock.new
    success_response.expect :success?, true
    success_response.expect :value, result
    Noaa::Forecast::TextOnly.stub :call, success_response do
      get forecast_text_only_url
      assert_response :success
    end
  end
end
