class ForecastFacade
  attr_reader :id

  def initialize(location)
    @location = location
    @id = SecureRandom.urlsafe_base64
    @lat = coordinates[:results][0][:geometry][:location][:lat]
    @lng = coordinates[:results][0][:geometry][:location][:lng]
  end

  def image
    lat = coordinates[:results][0][:geometry][:location][:lat]
    lng = coordinates[:results][0][:geometry][:location][:lng]
    flikr_image(lat, lng)
  end

  def current_weather
    weather[:currently]
  end

  def hourly_weather
    weather[:hourly]
  end

  def daily_weather
    weather[:daily]
  end

  private
    def google_service(location = @location)
      @_google_service ||= GoogleService.new
    end

    def darksky_service
      @_darksky_service ||= DarkskyService.new
    end

    def flikr_serice
      @_flikr_service ||= FlikrService.new
    end

    def coordinates
      @_coordinates ||= JSON.parse(google_service.coordiantes_from_location(@location).body, symbolize_names: true)
    end

    def weather
      @_weather ||= JSON.parse(darksky_service.weather(@lat, @lng).body, symbolize_names: true)
    end

    def flikr_image(lat, long)
      @_image ||= JSON.parse(flikr_serice.image({:lat=>lat, :lng=>long}).body, symbolize_names: true)
      return @_image[:photos][:photo][0][:url_l]
    end
end
