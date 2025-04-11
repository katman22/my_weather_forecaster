# frozen_string_literal: true

require "test_helper"
class GeoLocationTest < ActionView::TestCase
  test "Geo Location is rendered" do
    locations = [ { "formatted"=>"Utah, United States of America",
                  "geometry"=>{ "lat"=>39.4225192, "lng"=>-111.714358 },
                    "components"=> { "postcode"=> "84121" } },
                 { "formatted"=>"Utah, United States of America",
                  "geometry"=>{ "lat"=>39.4225192, "lng"=>-111.714358 },
                   "components"=> { "postcode"=> "84121" } } ]
    render partial: "forecast/geo_location", locals: { locations: locations, location: "New York", total: 2, erred: false }
    assert_includes rendered, "Location Response from: New York, Total Locations: 2"
  end

  test "Geo Location is rendered with errors" do
    render partial: "forecast/geo_location", locals: { locations: "No location found from uth", location: "uth", total: 0, erred: true }
    assert_includes rendered, "No location found from uth"
  end
end
