Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show
  # インデントが整っていない
  resources :tweets, only: [:show, :destroy] do
  resources :reviews, only: [:new, :create]
 end
  root 'tweets#index'
end
