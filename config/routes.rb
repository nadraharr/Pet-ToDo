Rails.application.routes.draw do
  get 'later', to: "tasks#later" 
  get 'login', to: "users#log_in" 
  get 'register', to: "users#new" 
  get 'today', to: "tasks#today" 
  post 'today', to: "tasks#create"
  post 'later', to: "tasks#create"
  root "tasks#today"

  get '/destroy', to: "tasks#destroy"
  get '/edit', to: "tasks#edit"

  resources :users
  resource :session, only: %i[new create destroy]
end
