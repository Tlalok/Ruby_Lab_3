Rails.application.routes.draw do

  get 'airports/most-visitable', to: 'airports#most_visitable'

  resources :countries, only: [:index, :show, :create] do
    resources :comments, only:[:index, :show, :create, :update, :destroy], shallow: true
  end

  resources :towns, only: [:index, :show, :create] do
    resources :comments, only:[:index, :show, :create, :update, :destroy], shallow: true
  end

  resources :airports, only: [:index, :show, :create]  
  resources :planes, only: [:index, :show, :create]  
  resources :users, only: [:index, :show, :create]  
  
  get 'users/favourite_destination/:id', to: 'users#favourite_destination'
  get 'users/:id/trips', to: 'users#get_trips'
end
