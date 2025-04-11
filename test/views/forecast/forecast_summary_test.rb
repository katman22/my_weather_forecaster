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
                "zip"=> 89076,
               "high"=>70,
               "low"=>38 }
    render partial: "forecast/forecast_summary", locals: { summary: summary, location: @location, zip: 78954, location_name: "This is the name" }
    assert_includes rendered, "15 to 20 mph"
  end
end
