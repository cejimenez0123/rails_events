Rails.application.routes.draw do
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create,:edit,:destroy,:show]
  resources :events, only: [:new,:edit,:destroy,:show,:index,:create]
  resources :users, only: [:show] do
    resources :events,only: [:edit,:update]
  end
  #SIGNUP/LOG IN
  get '/search' => 'sessions#search'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/users' => 'users#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'


  get '/' => 'statics#home', as: 'root'
  post '/rsvps' => 'events#new_rsvp'
  delete '/rsvps' => 'events#rsvp_delete'
  post '/order_by' => 'events#order_by'
end
