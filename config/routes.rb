Rails.application.routes.draw do
  
  get 'cart/index'

  resources :categories
  get 'pages/index'

      devise_for :users
  root to: "items#index"

  resources :items
  resources :recordings
  root "items#index"
  
  get '/help', to: 'static_pages#help'

  get 'static_pages/profile'

  get '/catalog', to: 'items#index'

  get '/search', to: 'static_pages#search'

  get '/cart', to: 'cart#index'
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart/:id', to: 'cart#add'
  
  get '/cart/remove/:id' => 'cart#remove'
  
  get 'static_pages/checkout'

  get 'static_pages/confirmation'

   post '/search' => 'static_pages#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
