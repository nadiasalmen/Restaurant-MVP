Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index new create show] do
    # # Read all
    # get 'restaurants', to: 'restaurants#index', as: :restaurants

    # # Create one
    # get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant
    # post 'restaurants', to: 'restaurants#create'

    # # Read one - show must go after the "new" routes
    # get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

    collection do
      get 'italian'
    end
    # es como agregar
    # get 'restaurants/italian', to: "restaurants#italian", as: :italian_restaurants

    member do
      get 'chef'
    end
    # este va a generar la ruta pero con un id
    # get 'restaurants/:id/chef', to: "restaurants#chef", as: :chef_restaurants

    # Nested routes
    resources :reviews, only: %i[new create]

    # collection top
    collection do
      get 'top'
    end
  end
end
