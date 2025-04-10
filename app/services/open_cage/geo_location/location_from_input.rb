# frozen_string_literal: true

module OpenCage
  module GeoLocation

    ## Class returns
    # from valid input
    # { results: parsed["results"], total: parsed["total_results"] }
    # results[:total] will indicate if more than one location was found
    class LocationFromInput < ApplicationService
      attr_reader :location

      COUNTRY_CODE = 'US'

      def initialize(location)
        @location = location
      end

      def call
        response_geo = open_cage_api_response
        return failed("Unable to find location from #{location}") if response_geo.nil?

        result = parse_response(response_geo)
        return failed("no results for location from #{location}") if result.nil? || result[:total].to_i.zero?

        successful(result)
      end

      private

      def parse_response(response)
        parsed = response.parsed_response
        { results: parsed["results"], total: parsed["total_results"] }
      end

      def failed(message)
        ServiceResult.new(success: false, value: message)
      end

      def successful(value)
        ServiceResult.new(success: true, value: value)
      end

      def open_cage_api_response
        HTTParty.get("https://api.opencagedata.com/geocode/v1/json", {
          query: {
            q: location,
            key: ENV["OPEN_CAGE_API_KEY"],
            countrycode: COUNTRY_CODE
          }
        })
      end
    end
  end
end
