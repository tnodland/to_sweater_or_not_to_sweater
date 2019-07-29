class ForecastFacade
  def initialize(location)
    @location = location
  end

  def image
    flikr_image(self.coordinates[:lat], self.coordinates[:lng])
  end

  def current_weather
    weather = self.weather
    return weather[:currently]
  end

  def hourly_weather
    weather = self.weather
    return weather[:hourly]
  end

  def daily_weather
    weather = self.weather
    return weather[:daily]
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
      @_coordinates ||= JSON.parse(google_service.coordinates_from_location(@location).body, symbolize_names: true)
    end

    def weather
      @_weather ||= JSON.parse(darksky_service.weather(self.coordinates[:lat], self.coordinates[:lng]).body, symbolize_names: true)
    end

    def flikr_image(lat, long)
      @_image ||= JSON.parse(flikr_serice.image({:lat=>lat, :lng=>long}).body, symbolize_names: true)
      return @_image[:photos][:photo][0][:url_l]
    end
end
