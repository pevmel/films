Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :movies
    resources :categories, except: :show
  end

  resources :movies, only: %i[index show]
  post '/ratings/set_new_rating', to: 'ratings#set_new_rating'

  root to: 'movies#index'
end
