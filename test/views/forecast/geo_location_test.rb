# frozen_string_literal: true

require "test_helper"
class GeoLocationTest < ActionView::TestCase
  test "Geo Location is rendered" do
    render partial: "forecast/geo_location", locals: { locations: "Location found", location: "New York", total: 2, erred: false }
    assert_includes rendered, "Location found from: New York, Total Locations: 2"
  end

  test "Geo Location is rendered with errors" do
    render partial: "forecast/geo_location", locals: { locations: "No location found from uth", location: "uth", total: 2, erred: true }
    assert_includes rendered, "No location found from uth"
  end
end
