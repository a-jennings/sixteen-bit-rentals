Rails.application.routes.draw do

  # get 'users/profile'
  # resources :users, only: %i[show new create destroy]

  root to: 'pages#home'
  # root to: 'devise/registrations#new'
  devise_for :users
  # devise_scope :users do
  #   root 'devise/registrations#new'
  # end
  get '/profile', to: 'users#profile'
  get '/users/:id', to: 'users#show'
  resources :consoles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
