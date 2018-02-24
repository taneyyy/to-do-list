Rails.application.routes.draw do
  get 'list/index'
  
  resources :items
  
  get 'items/new'
  
  get 'items/:id/mark', to: 'items#mark', as: 'mark_item'

  root 'list#index'
end
