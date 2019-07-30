class GoogleService
  def coordiantes_from_location(location)
    conn.get("geocode/json") do |req|
      req.params[:address] = location
    end
  end

  def time_between(origin, destination)
    conn.get("directions/json") do |req|
      req.params[:origin] = origin
      req.params[:destination] = destination
      req.params[:key] = ENV['GOOGLE-DIRECTIONS-API-KEY']
    end
  end


  private
    def conn
      @_conn ||= Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
                  f.adapter Faraday.default_adapter
                  f.params[:key] = ENV['GOOGLE-API-KEY']
                end
    end
end
