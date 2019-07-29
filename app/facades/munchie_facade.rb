class MunchieFacade
  def initialize(starting_location, ending_location, food_type)
    @starting_location = starting_location
    @ending_location = ending_location
    @food_type = food_type
  end

  def time_at_arrival
    time = google_service.time_between(@starting_location, @ending_location)
    time_to_arrive = JSON.parse(time.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:value]
    Time.now.to_i + time_to_arrive
  end

  def restaurants
    restaurants_full = yelp_service.resturaunts_open_at(@ending_location, time_at_arrival, 3, @food_type)
    restaurants = JSON.parse(restaurants_full.body, symbolize_names: true)[:businesses]
    restaurants.map do |r_data|
      binding.pry
      Resturaunt.new(r_data)
    end
  end

  private

    def google_service
      @_google_service ||= GoogleService.new
    end

    def yelp_service
      @_yelp_service ||= YelpService.new
    end
end
