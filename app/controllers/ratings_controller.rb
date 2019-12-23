class RatingsController < ApplicationController
  before_action :check_user_login

  def set_mark
    if params[:mark].to_i > 0
      @user_rating = current_user.ratings.find_or_create_by(movie_id: params[:movie_id].to_i)
      @user_rating.update(mark: params[:mark])
    else
      current_user.ratings.find_by(movie_id: params[:movie_id])&.destroy
      @user_rating = nil
    end

    ratings = Rating.where(movie_id: params[:movie_id])
    @votes = ratings.count
    sum = ratings.pluck(:mark).inject(:+) if @votes
    @rating = @votes > 0 ? (sum.to_f / @votes * 10).round / 10.0 : 0.0
    Movie.find(params[:movie_id]).update(votes: @votes, rating: @rating)

    render json: { data: { movie_id: params[:movie_id],
                           votes: @votes,
                           rating: @rating,
                           user_rating: @user_rating&.mark } }
  end

  private

  def check_user_login
    redirect_to new_user_session_path if current_user.blank?
  end
end
