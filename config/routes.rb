Rails.application.routes.draw do
  get 'later', to: "pages#later" 
  get 'login', to: "pages#log_in" 
  get 'register', to: "pages#sign_in" 
  get 'today', to: "pages#today" 
  root "pages#index"
end
