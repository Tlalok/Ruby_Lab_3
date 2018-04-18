Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new]  
  resources :airports, only: [:index, :show]  

  get 'airports/most-visitable', to: 'airports#most_visitable'
  get 'users/favourite_destination/:id', to: 'users#favourite_destination'
end
