Rails.application.routes.draw do
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create,:edit,:destroy,:show]
  resources :events, only: [:show,:index]
  resources :users, only: [:show,:new,] do
    resources :events,only: [:new,:create,:edit,:update,:destroy]
  end
  resources :events,only: [:show] do
    resources :rsvps, only: [:create,:destroy]
  end
  resources :rsvps, only: [:index]

  post '/index' => 'events#index_scope'
  #SIGNUP/LOG IN 
  delete '/logout' => 'sessions#destroy', as: "logout"
  get '/search' => 'sessions#search'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/users' => 'users#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/events' => 'events#index_scope', as: "events_scope"
  #RSVP
  # get '/rsvps/index' => 'rsvps#index', as: "rsvps"
  # post '/events/:id/rsvp' => 'rsvps#create'
  # delete '/events/:event_id/rsvps/:id' => 'rsvps#destroy', as: "rsvp_destroy"
  # post 'events/:id' => 'rsvps#create'
  get '/' => 'statics#home', as: 'root'
  # post '/order_by' => 'events#order_by'
end
