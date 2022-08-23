Rails.application.routes.draw do
  get 'bikes/index'
  get 'bikes/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/account', to: 'pages#account'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bikes, only: [:index, :new, :create, :show]
  # resources :pages
end
