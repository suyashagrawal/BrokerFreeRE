Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/search', to: 'home#search', as: 'search'
  get '/states', to: 'states#index', as: 'states'
  root "home#index"
  get '/rent', to: 'home#rent', as: 'rent'
  get '/sale', to: 'home#sale', as: 'sale'

  resources :properties, only: :show
  resources :seller_steps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end