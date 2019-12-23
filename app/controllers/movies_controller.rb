class MoviesController < ApplicationController
  def index
    if params[:category]
      category = Category.friendly.find(params[:category])
      @movies = category.movies
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.friendly.find(params[:id])
  end
end
