class MoviesController < ApplicationController
  def index
    if params[:category]
      @movies = Movie.where(category_id: params[:category])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
