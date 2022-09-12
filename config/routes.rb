Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:id/rides/new', to: 'mechanic_tickets#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
