Rails.application.routes.draw do
  # get 'users/profile'
  # resources :users, only: %i[show new create destroy]
  root to: 'pages#home'
  devise_for :users
  get '/profile', to: 'users#profile', as: 'profile'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :consoles do
    resources :rentals
    get '/rentals/:id/confirm', to: 'rentals#confirm', as: 'confirm_rental'
    get '/rentals/:id/approve', to: 'rentals#approve', as: 'approve_rental'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
