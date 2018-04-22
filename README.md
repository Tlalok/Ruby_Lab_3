                 Prefix     Verb   URI Pattern                                Controller#Action
       country_comments     GET    /countries/:country_id/comments(.:format)  comments#index
                            POST   /countries/:country_id/comments(.:format)  comments#create
                comment     GET    /comments/:id(.:format)                    comments#show
                            PATCH  /comments/:id(.:format)                    comments#update
                            PUT    /comments/:id(.:format)                    comments#update
                            DELETE /comments/:id(.:format)                    comments#destroy
              countries     GET    /countries(.:format)                       countries#index
                            POST   /countries(.:format)                       countries#create
                country     GET    /countries/:id(.:format)                   countries#show
                            PATCH  /countries/:id(.:format)                   countries#update
                            PUT    /countries/:id(.:format)                   countries#update
                            DELETE /countries/:id(.:format)                   countries#destroy
          town_comments     GET    /towns/:town_id/comments(.:format)         comments#index
                            POST   /towns/:town_id/comments(.:format)         comments#create
                            GET    /comments/:id(.:format)                    comments#show
                            PATCH  /comments/:id(.:format)                    comments#update
                            PUT    /comments/:id(.:format)                    comments#update
                            DELETE /comments/:id(.:format)                    comments#destroy
                  towns     GET    /towns(.:format)                           towns#index
                            POST   /towns(.:format)                           towns#create
                   town     GET    /towns/:id(.:format)                       towns#show
                            PATCH  /towns/:id(.:format)                       towns#update
                            PUT    /towns/:id(.:format)                       towns#update
                            DELETE /towns/:id(.:format)                       towns#destroy
    airports_most_visitable GET    /airports/most-visitable(.:format)         airports#most_visitable
                            GET    /airports/:airport_id/trips_from(.:format) trips#trips_from
                            GET    /airports/:airport_id/trips_to(.:format)   trips#trips_to
               airports     GET    /airports(.:format)                        airports#index
                            POST   /airports(.:format)                        airports#create
                airport     GET    /airports/:id(.:format)                    airports#show
                            PATCH  /airports/:id(.:format)                    airports#update
                            PUT    /airports/:id(.:format)                    airports#update
                            DELETE /airports/:id(.:format)                    airports#destroy
            plane_trips     GET    /planes/:plane_id/trips(.:format)          trips#index
                 planes     GET    /planes(.:format)                          planes#index
                            POST   /planes(.:format)                          planes#create
                  plane     GET    /planes/:id(.:format)                      planes#show
                            PATCH  /planes/:id(.:format)                      planes#update
                            PUT    /planes/:id(.:format)                      planes#update
                            DELETE /planes/:id(.:format)                      planes#destroy
                            GET    /users/:id/favourite_destination(.:format) users#favourite_destination
             user_trips     GET    /users/:user_id/trips(.:format)            trips#index
                  users     GET    /users(.:format)                           users#index
                            POST   /users(.:format)                           users#create
                   user     GET    /users/:id(.:format)                       users#show
                            PATCH  /users/:id(.:format)                       users#update
                            PUT    /users/:id(.:format)                       users#update
                            DELETE /users/:id(.:format)                       users#destroy
                  trips     GET    /trips(.:format)                           trips#index
                            POST   /trips(.:format)                           trips#create
                   trip     GET    /trips/:id(.:format)                       trips#show
                            PATCH  /trips/:id(.:format)                       trips#update
                            PUT    /trips/:id(.:format)                       trips#update
                            DELETE /trips/:id(.:format)                       trips#destroy
