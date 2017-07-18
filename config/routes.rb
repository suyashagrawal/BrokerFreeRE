Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/search', to: 'home#search', as: 'search'
  root "home#index"
  get '/rent', to: 'home#rent', as: 'rent'
  get '/sale', to: 'home#sale', as: 'sale'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end