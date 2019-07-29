class YelpService
  def initialize
    @yelp_key = ENV['YELP-API-KEY']
  end

  def resturaunts_open_at(location, time, limit, food_type)
    conn.get "businesses/search" do |req|
      req.params[:term] = "restaurants"
      req.params[:location] = location
      req.params[:limit] = limit
      req.params[:open_at] = time
      req.params[:categories] = food_type
    end
  end

  private
    def conn
      @_conn ||= Faraday.new("https://api.yelp.com/v3/") do |f|
        f.adapter Faraday.default_adapter
        f.headers['Authorization'] = "Bearer #{@yelp_key}"
      end
    end
end
