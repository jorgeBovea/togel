Rails.application.routes.draw do
  root 'users#index'	
  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as:'sign_out'

  resources :instance_times
  resources :instances
  resources :users
  resources :projects
  post "/create_project/instance", to: "instances#project_create_instance", as: "project_instance" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
