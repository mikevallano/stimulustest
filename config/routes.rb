Rails.application.routes.draw do
  resources :critters
  devise_for :users
  root 'pages#home'
  get 'pages/about', :about
  resources :lists, only: %i[index show]
  resources :movies, only: %i[index show]
  resources :listings, only: %i[create destroy]
end
