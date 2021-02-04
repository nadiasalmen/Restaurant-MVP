Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Read all
  get 'restaurants', to: 'restaurants#index', as: :restaurants

  # Create one
  get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant
  post 'restaurants', to: 'restaurants#create'

  # Read one - show must go after the "new" routes
end
