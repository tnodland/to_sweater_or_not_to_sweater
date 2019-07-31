Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/munchies', to: 'munchies#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/road_trip', to: 'road_trip#create'
      get '/backgrounds', to: 'backgrounds#show'
    end
  end
end
