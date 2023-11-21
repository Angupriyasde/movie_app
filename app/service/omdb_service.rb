class OmdbService
    include HTTParty
    base_uri 'http://www.omdbapi.com'
  
    def initialize(api_key)
      @api_key = api_key
    end
  
    def search_movies(query)
      response = self.class.get("/?apikey=#{@api_key}&s=#{query}")
      response.parsed_response['Search']
    end
  
    def get_movie_details(id)
      response = self.class.get("/?apikey=#{@api_key}&i=#{id}")
      response.parsed_response
    end
end