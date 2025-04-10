# frozen_string_literal: true

require "test_helper"
class ForecastSummaryTest < ActionView::TestCase
  test "Summary is rendered" do
    summary = { "number"=>1,
               "name"=>"This Afternoon",
               "isDaytime"=>true,
               "temperature"=>70,
               "temperatureUnit"=>"F",
               "windSpeed"=>"15 to 20 mph",
               "windDirection"=>"NW",
               "icon"=>"https://api.weather.gov/icons/land/day/few?size=medium",
               "shortForecast"=>"Sunny",
               "high"=>70,
               "low"=>38 }
    render partial: "forecast/forecast_summary", locals: { summary: summary, location: @location }
    assert_includes rendered, "15 to 20 mph"
  end
end
