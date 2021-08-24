Rails.application.routes.draw do
  get 'users/profile'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
