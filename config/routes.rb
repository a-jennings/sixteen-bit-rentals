Rails.application.routes.draw do
  # get 'users/profile'
  resources :users, only: %i[show new create destroy]
  devise_for :users
  root to: 'pages#home'
  resources :consoles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
