class ForecastController < ApplicationController
  def index
  end

  def geo_location
    @location = params[:location]
    location_service_result = OpenCage::GeoLocation::LocationFromInput.(@location)
    erred = location_service_result.failure?
    if erred
      results = location_service_result.value
      total = 0
    else
      results = location_service_result.value[:results]
      total = location_service_result.value[:total]
    end
    render partial: "geo_location", locals: { location: @location, locations: results, total: total, erred: erred }
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
