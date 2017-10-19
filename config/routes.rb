Rails.application.routes.draw do

  get '/search', to: 'main#search'

  root 'pages#home'
resources :articles
  get '/about', to: 'pages#about'
get '/signup',  to: 'users#new'

get '/login',  to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
resources :users, except: [:new]
resources :categories, except: [:delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
