Rails.application.routes.draw do
  # le GET articles va executer l action de index dans le ArticlesController
  # get '/articles', to: 'articles#index'
  # get '/articles/:id', to: 'articles#show'
  # La ressource permet de creer les routes pour le CRUD sur ce controller
  # Chose qu'on a fait manuellement au dessus avec le index(get) et show
  resources :articles do
    resources :comments
  end
  resources :categories
  # Defines the root path route ("/")
  root 'pages#index'
end
