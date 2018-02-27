Rails.application.routes.draw do
  
  get 'items/show_completed', to: 'items#show_completed', as: 'show_completed'
  
  get 'list/index'
  
  delete 'items', to: 'items#delete_all', as: 'delete_all'
  
  resources :items
  
  post 'items/new'
  
  get 'items/:id/mark', to: 'items#mark', as: 'mark_item'
  

  root 'list#index'
end
