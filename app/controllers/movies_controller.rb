class MoviesController < ApplicationController
  def index
    if params[:query].present?
      service = MovieService.new
      @movies = service.search_movies(params[:query])["results"]
    else
      @movies = []
    end
  end

  def show
    service = MovieService.new
    @movie = service.movie_details(params[:id])
  end
end
