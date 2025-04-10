# frozen_string_literal: true

require "test_helper"
class GeoLocationTest < ActionView::TestCase
  test "Geo Location is rendered" do
    render partial: "forecast/geo_location", locals: { summary: "Location found", location: "New York", total: 2 }
    assert_includes rendered, "Location found from: New York, Total Locations: 2"
  end
end
