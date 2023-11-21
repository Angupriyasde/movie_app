class MoviesController < ApplicationController
    before_action :set_omdb_service, only: [:index, :search, :show, :add_to_favorites]
  
    def index
      @movies = @omdb_service.search_movies('latest')
    end
  
    def search
      @movies = @omdb_service.search_movies(params[:query])
      render :index
    end
  
    def show
      @movie = @omdb_service.get_movie_details(params[:imdbID])
    end
  
    def add_to_favorites
      @movie = Movie.find_by_imdbID(params["imdbID"])
      if @movie
        @movie.favorite = true
        @movie.save
        flash.now[:success] = "Movie added to favorites"
      else 
        @movie = Movie.create_entry(params)
        flash.now[:success] = "Movie added to favorites"
      end
    end

    def view_favorites
      @movies = Movie.where(favorite: true)
    end

    private
  
    def set_omdb_service
      @omdb_service = OmdbService.new(ENV['OMDB_API_KEY'])
    end
end