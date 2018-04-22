Rails.application.routes.draw do

  resources :countries, except: [:new, :edit] do
    resources :comments, except: [:new, :edit], shallow: true
  end

  resources :towns, except: [:new, :edit] do
    resources :comments, except: [:new, :edit], shallow: true
  end

  get 'airports/most-visitable',         to: 'airports#most_visitable'
  get 'airports/:airport_id/trips_from', to: 'trips#trips_from'
  get 'airports/:airport_id/trips_to',   to: 'trips#trips_to'
  resources :airports, except: [:new, :edit]

  resources :planes, except: [:new, :edit] do
    resources :trips, only: :index
  end 

  get 'users/:id/favourite_destination', to: 'users#favourite_destination'
  resources :users, except: [:new, :edit] do
    resources :trips, only: :index
  end

  resources :trips, except: [:new, :edit]
  
end
