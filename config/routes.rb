Rails.application.routes.draw do
  get 'later', to: "tasks#later" 
  get 'login', to: "pages#log_in" 
  get 'register', to: "pages#sign_in" 
  get 'today', to: "tasks#today" 
  post 'today', to: "tasks#create"
  post 'later', to: "tasks#create"
  root "tasks#today"

  get '/destroy', to: "tasks#destroy"
  get '/edit', to: "tasks#edit"
end
