class DarkskyService
  def weather(lat, long)
    conn.get("#{lat},#{long}")
  end

  def weather_at_time(lat, long, time)
    weather = weather(lat, long)
    parsed_weather = JSON.parse(weather.body, symbolize_names: true)[:hourly]
    if time.include?("hour")
      hour =  time.chars.first.to_i
      parsed_weather[:data][hour]
    else
      parsed_weather[:data][0]
    end
  end

  private

    def conn
      @_conn ||= Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY-API-KEY']}/") do |f|
        f.adapter Faraday.default_adapter
      end
    end
end
