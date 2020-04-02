Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show
  resources :tweets, only: :show do
  resources :reviews, only: [:new, :create]
 end
  root 'tweets#index'
end
