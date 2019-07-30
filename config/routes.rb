Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/munchies', to: 'munchies#index'
      post '/users', to: 'users#create'
    end
  end
end
