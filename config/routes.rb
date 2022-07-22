Rails.application.routes.draw do
  resources :posts
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'static#homepage'
end
