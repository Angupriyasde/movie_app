class Movie < ApplicationRecord

    def self.thumbnail(poster)
        if poster.present? && poster != 'N/A' 
            return poster
        else
            "https://m.media-amazon.com/images/M/MV5BYTYxMzg2ZGUtY2VhMS00YWFmLWE3MjItOTZhYTQ1MGU3YjEyXkEyXkFqcGdeQXVyMTEzNzg0Mjkx._V1_SX300.jpg"
        end
    end


    def self.create_entry(params)
        Movie.create(imdbID: params["imdbID"],
                    title: params["Title"],
                    poster: params["Poster"],
                    movie_type: params["Type"],
                    year: params["Year"],
                    favorite: true)
    end

end
