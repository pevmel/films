Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :movies
    resources :categories, except: :show
  end

  resources :movies, only: %i[index show]
  post '/ratings/set_mark', to: 'ratings#set_mark'

  root to: 'movies#index'
end
