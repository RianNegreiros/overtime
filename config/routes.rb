Rails.application.routes.draw do
  root to: 'static#homepage'

  resources :posts
  devise_for :users
end
