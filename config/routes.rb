Rails.application.routes.draw do
  get 'list/index'
  
  resources :items
  
  get 'items/new'

  root 'list#index'
end
