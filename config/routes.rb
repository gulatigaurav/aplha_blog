Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'pages#home'
  resources :articles
  get '/about', to: 'pages#about'
  get '/signup',  to: 'users#new'

  get '/login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  resources :categories, except: [:delete]
end
