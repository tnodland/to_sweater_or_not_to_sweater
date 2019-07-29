class FlikrService
  def image(location)
    response = conn.get('/services/rest/') do |req|
      req.params[:method] = 'flickr.photos.search'
      req.params[:api_key] = ENV['FLIKR-API-KEY']
      req.params[:tags] = 'snow,clouds,sun,lake,nature,winter,trees'
      req.params[:format] = 'json'
      req.params[:media] = 'photos'
      req.params[:extras] = 'url_l'
      req.params[:lat] = location[:lat]
      req.params[:lon] = location[:lng]
      req.params[:accuracy] = 11
      req.params[:safe_search] = 1
      req.params[:page] = 1
      req.params[:per_page] = 1
      req.params[:content_type] = 1
      req.params[:nojsoncallback] = 1
    end
  end

  private

    def conn
      @_conn ||= Faraday.new('https://api.flickr.com') do |f|
        f.adapter Faraday.default_adapter
      end
    end
end
