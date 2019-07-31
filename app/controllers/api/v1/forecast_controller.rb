class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.new(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
