class Api::V1::MunchiesController < ActionController::API
  def index
    google_service = GoogleService.new
    yelp_service = YelpService.new
    time = google_service.time_between(params[:start], params[:end])
    time_to_arrive = JSON.parse(time.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:value]
    time_at_arrival = Time.now.to_i + time_to_arrive
    resturaunts = yelp_service.resturaunts_open_at(params[:end], time_at_arrival, 3, params[:food])
    binding.pry
  end
end
