class Api::V1::RoadTripController < ActionController::API
  def create
    if User.find_by(api_key: params['api_key'])
      road_trip = RoadTripFacade.new(params)
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: {status: "error", message: "Invalid API Key"}
    end
  end
end
