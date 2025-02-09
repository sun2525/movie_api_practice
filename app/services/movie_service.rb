require 'httparty'

class MovieService
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def initialize
    @api_key = ENV['TMDB_API_KEY']
  end

  def search_movies(query)
    self.class.get("/search/movie", {
      query: {
        api_key: @api_key,
        query: query,
        language: 'ja-JP'
      }
    })
  end

  def movie_details(movie_id)
    self.class.get("/movie/#{movie_id}", {
      query: {
        api_key: @api_key
      }
    })
  end
end
