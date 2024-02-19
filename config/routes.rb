Rails.application.routes.draw do
  root "tasks#today"
  get 'later', to: "tasks#later" 
  get 'today', to: "tasks#today" 

  resources :users do
    resources :tasks
  end
  
  resource :session, only: %i[new create destroy]
end
