Rails.application.routes.draw do
  # get 'reviews/create'
  # get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # resources :bookmarks, only: [:destroy]
  
  resources :lists, only: [:index, :show, :new, :create] do
    member do
      resources :bookmarks, only: [:create]
    end 
    member do
      resources :reviews, only: [:create]
    end 
  end 
end


# POST lists/:id/review