class ForecastController < ApplicationController
  def index
  end

  def geo_location
    @location = params[:location]
    location_service_result = OpenCage::GeoLocation::LocationFromInput.(@location)
    erred = location_service_result.failure?
    if erred
      locations = location_service_result.value
      total = 0
    else
      locations = location_service_result.value[:locations]
      total = location_service_result.value[:total]
    end

    render turbo_stream: [
      turbo_stream.replace("summary_response", partial: "clear"),
      turbo_stream.replace("location_response", partial: "geo_location", locals: { location: @location, locations: locations, total: total, erred: erred })
    ]
  end

  def summary
    latitude = params[:lat]
    longitude = params[:long]
    location = params[:location]
    service_result = Noaa::Forecast::Summary.(latitude, longitude)
    @summary = service_result.value

    render partial: "forecast_summary", locals: { summary: @summary, location: location }
  end

  def full
  end

  def text_only
  end
end
