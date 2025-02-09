class MoviesController < ApplicationController
  def index
    if params[:query].present?
      service = MovieService.new
      response = service.search_movies(params[:query])
      Rails.logger.debug("API Response: #{response.inspect}") # レスポンスをログに出力
      @movies = response["results"]
    else
      @movies = []
    end
  end
  

  def show
    service = MovieService.new
    @movie = service.movie_details(params[:id])
  end
end
