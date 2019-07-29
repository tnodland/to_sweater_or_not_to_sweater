class YelpService
  def initialize
    @yelp_key = ENV['YELP-API-KEY']
  end

  def resturaunts_open_at(location, time, limit, food_type)
    conn = Faraday.new("https://api.yelp.com/v3/businesses/search?term=restaurants&location=#{location}&limit=#{limit}&open_at=#{time}&categories=#{food_type}") do |f|
      f.adapter Faraday.default_adapter
      f.headers['Authorization'] = "Bearer #{@yelp_key}"
    end
    conn.get
  end
end
