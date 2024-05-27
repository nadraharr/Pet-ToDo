Rails.application.routes.draw do
  root "pages#today"
  get 'later', to: "pages#later" 
  get 'today', to: "pages#today" 
  get 'everyday', to: "pages#everyday" 
  post 'new_day', to: "tasks#new_day" 

  resources :users, only: %i[new create] do
    resources :tasks, only: %i[new create update destroy]
  end
  
  resource :session, only: %i[new create destroy]
end
