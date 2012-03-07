IdeaMarshal::Application.routes.draw do
  get 'pages/:id' => 'pages#show', :as => :page
  
  namespace :admin do
    resources :users, :except => [:show]
    resources :pages
    resources :preferences
  end
  get 'admin' => 'admin#index', :as => :admin
  
  get 'login' => 'sessions#new', :as => :login
  post 'sessions/create' => 'sessions#create', :as => :create_session
  get 'logout' => 'sessions#destroy', :as => :logout
  
  get 'home' => 'home#index', :as => :home
  
  root :to => 'home#index'
end
