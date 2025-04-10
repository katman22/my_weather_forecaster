# frozen_string_literal: true

require "test_helper"
class ForecastSummaryTest < ActionView::TestCase
  test "Summary is rendered" do
    render partial: "forecast/forecast_summary", locals: { summary: "Its hot", location: @location }
    assert_includes rendered, "Its hot"
  end
end
