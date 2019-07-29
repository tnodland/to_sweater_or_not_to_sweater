class DarkskyService
  def weather(lat, long)
    conn.get("#{lat},#{long}")
  end

  private

    def conn
      @_conn ||= Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY-API-KEY']}/") do |f|
        f.adapter Faraday.default_adapter
      end
    end
end
