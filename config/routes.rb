Rails.application.routes.draw do
  get 'workflows/new'
  get 'workflows/index'
  post 'workflows/create'

  get 'workflows/show'
  get 'home/index'
  get 'home/about'
  get 'home/impressum'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

  mount Rapidfire::Engine => "/rapidfire"
end

