# frozen_string_literal: true

module Noaa
  module Forecast
    class Summary < ApplicationService
      attr_reader :latitude, :longitude, :zipcode

      BASE_NOAA_URL = "https://api.weather.gov/points/"

      def initialize(latitude, longitude, zipcode)
        @latitude = latitude
        @longitude = longitude
        @zipcode = zipcode
      end

      def call
        response = parse_response(noaa_response)
        forecast_response = HTTParty.get(forecast_url(response), headers: noaa_agent_header)
        forecast = parse_response(forecast_response)
        current = current_forecast(forecast)
        high, low = high_low(forecast, current)
        successful(current.merge("high" => high, "low" => low, "latitude" => latitude, "longitude" => longitude))
      end

      def current_forecast(forecast)
        forecast["properties"]["periods"].select { |rows| rows["number"] == 1 }.first
      end

      def high_low(forecast, current)
        next_forecast = forecast["properties"]["periods"].select { |rows| rows["number"] == 2 }.first
        current["isDaytime"] ? [ current["temperature"], next_forecast["temperature"] ] : [ next_forecast["temperature"], current["temperature"] ]
      end

      def forecast_url(response)
        response["properties"]["forecast"]
      end

      def parse_response(response)
        JSON.parse(response)
      end

      def noaa_response
        cache_key = "noaa_#{zipcode}"
        cached_response = Rails.cache.read(cache_key)
        return cached_response if cached_response

        response = HTTParty.get(noaa_url, headers: noaa_agent_header)
        Rails.cache.write(cache_key, response, expires_in: 30.minutes)
        response
      end

      def noaa_agent_header
        { "User-Agent" => "my_weather_forecaster (#{ENV['APPLICATION_EMAIL']})" }
      end

      def noaa_url
        "#{BASE_NOAA_URL}#{latitude},#{longitude}"
      end
    end
  end
end
