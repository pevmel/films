class Admin::MoviesController < ApplicationController
  before_action :check_if_admin
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /admin/movies
  def index
    @movies = Movie.all
  end

  # GET /admin/movies/1
  def show
  end

  # GET /admin/movies/new
  def new
    @movie = Movie.new
  end

  # GET /admin/movies/1/edit
  def edit
  end

  # POST /admin/movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movie_path(@movie), notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/movies/1
  def update
    if @movie.update(movie_params)
      redirect_to admin_movie_path(@movie), notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/movies/1
  def destroy
    @movie.destroy
    redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :votes, :rating, :category_id)
    end

  def check_if_admin
    redirect_to root_path, alert: 'Only admins have access to Admin section' unless current_user&.is_admin?
  end
end
