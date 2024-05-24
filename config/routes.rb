Rails.application.routes.draw do
  root "tasks#today"
  get 'later', to: "tasks#later" 
  get 'today', to: "tasks#today" 
  get 'everyday', to: "tasks#everyday" 
  post 'new_day', to: "tasks#new_day" 

  resources :users, only: %i[new create] do
    resources :tasks, only: %i[new create update destroy]
  end
  
  resource :session, only: %i[new create destroy]
end
