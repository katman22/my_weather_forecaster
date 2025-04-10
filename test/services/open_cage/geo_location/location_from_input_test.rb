# frozen_string_literal: true

require "test_helper"
require "minitest/mock"
module OpenCage
  module GeoLocation
    class LocationFromInputTest < ActiveSupport::TestCase
      test "Receive valid response" do
        locations = [ { "formatted"=>"Utah, United States of America",
                        "geometry"=>{ "lat"=>39.4225192, "lng"=>-111.714358 } },
                      { "formatted"=>"Utah, United States of America",
                        "geometry"=>{ "lat"=>39.4225192, "lng"=>-111.714358 } } ]
        result = { locations: locations, total: 2 }
        success_response = Minitest::Mock.new
        success_response.expect :success?, true
        success_response.expect :value, result
        OpenCage::GeoLocation::LocationFromInput.stub :call, success_response do
          result = OpenCage::GeoLocation::LocationFromInput.call("UT")
          assert result.success?
        end
      end

      test "Receive in-valid response from input" do
        success_response = Minitest::Mock.new
        success_response.expect :failure?, true
        success_response.expect :value, "No locations found"
        OpenCage::GeoLocation::LocationFromInput.stub :call, success_response do
          result = OpenCage::GeoLocation::LocationFromInput.call("UT")
          assert result.failure?
        end
      end
    end

  end
end

