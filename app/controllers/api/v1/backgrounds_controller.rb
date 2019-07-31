class Api::V1::BackgroundsController < ActionController::API
  def show
    facade = ForecastFacade.new(params[:location])
    render json: ImageSerializer.new(facade)
  end
end
