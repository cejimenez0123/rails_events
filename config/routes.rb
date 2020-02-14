Rails.application.routes.draw do
  
  resources :rsvps, only: [:create,:destroy,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create,:edit,:destroy,:show]
  resources :events, only: [:new,:edit,:destroy,:show,:index,:create]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/users' => 'users#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/' => 'statics#home', as: 'root'

end
