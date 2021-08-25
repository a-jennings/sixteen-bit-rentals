Rails.application.routes.draw do
  # get 'users/profile'
  # resources :users, only: %i[show new create destroy]
  root to: 'pages#home'
  devise_for :users
  get '/profile', to: 'users#profile'
  get '/users/:id', to: 'users#show'
  resources :consoles do
    resources :rentals, only: %i[new create edit update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
