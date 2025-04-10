class ForecastController < ApplicationController
  def index
  end

  def geo_location
    @location = params[:location]
    location_service_result = OpenCage::GeoLocation::LocationFromInput.(@location)
    if location_service_result.failure?
      @summary = location_service_result.value
    end

    results = location_service_result.value[:results]

    render partial: "geo_location", locals: { summary: @summary, location: @location }
  end

  def summary
    location = params[:location]

    # TODO add call to NOAA
    @summary = "Summary Forecast for #{location}"

    render partial: "forecast_summary", locals: { summary: @summary, location: @location }
  end

  def full
  end

  def text_only
  end
end
