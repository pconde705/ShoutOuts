Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :posts, only: [ :index, :new, :create ]
  resources :likes, only: [ :create ]
  resources :flags, only: [ :create ]

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: {registrations: "users/registrations"}
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
