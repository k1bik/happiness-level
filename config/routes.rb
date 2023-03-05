Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get 'edit_first_name'
      get 'edit_last_name'
      get 'edit_username'
    end
  end

  resources :friendships, only: %i[create destroy]
  resources :friend_requests, only: %i[create]

  root "users#index"
end
