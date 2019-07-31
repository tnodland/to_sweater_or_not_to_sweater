class RoadTripFacade
  attr_reader :destination, :id

  def initialize(params)
    @origin_city = params["origin"]
    @destination = params["destination"]
    @id = User.find_by(api_key: params['api_key']).id
  end

  def time_from_now
    time = google_service.time_between(@origin_city, @destination)
    JSON.parse(time.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text]
  end


  def weather_at_destination
    lat = coordinates[:results][0][:geometry][:location][:lat]
    lng = coordinates[:results][0][:geometry][:location][:lng]
    weather = darksky_service.weather_at_time(lat, lng, time_from_now)
  end

  private
    def google_service
      @_google_service ||= GoogleService.new
    end

    def darksky_service
      @_darksky_service ||= DarkskyService.new
    end

    def coordinates
      @_coordinates ||= JSON.parse(google_service.coordiantes_from_location(@destination).body, symbolize_names: true)
    end
end
