Rails.application.routes.draw do
  resources :audit_logs, except: %i[new edit destroy] do
    member do
      get :confirm
    end
  end

  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users
    resources :employees

    root to: "users#index"
  end

  resources :posts do
    member do
      get :approve
    end
  end

  devise_for :users, skip: %i[registrations]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'static#homepage'
end
