Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/antipode', to: 'antipode#show'
      get '/backgrounds', to: 'background#show'

      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/road_trips', to: 'trips#create'
    end
  end
end
