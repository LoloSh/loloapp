Rails.application.routes.draw do

  root 'welcome#index'
  get '/login', to: 'welcome#index'
  post '/login', to: 'welcome#login'
  get '/user', to: 'users#index', as: 'user'
  get '/signup', to: 'users#new'
  post '/user', to: 'users#create'

  put '/user', to: 'users#update', as: 'update_user'

  get '/user/edit', to: 'users#edit', as: 'edit_user'


  get '/user/clients', to: 'clients#index', as: 'user_clients'
  post 'user/clients', to: 'clients#create'
  get 'user/client/new', to: 'clients#new', as: 'new_user_client'
  delete '/user/client/:client_id', to: 'clients#destroy', as: 'delete_user_client'

  get 'user/pets', to: 'pets#index', as: 'user_pets'
  post 'user/pets', to: 'pets#create'
  put '/user/pets/:pet_id/', to: 'pets#update', as: 'update_user_pet'
  get 'user/pet/new', to: 'pets#new', as: 'new_user_pet'
  get '/user/pets/:pet_id/edit', to: 'pets#edit', as: 'edit_user_pet'
  get '/users/pets/:pet_id/edit', to: 'pets#edit', as: 'edit_users_pet'
  delete '/user/pet/:pet_id', to: 'pets#destroy', as: 'delete_user_pet'
  post 'client/create', to: 'users#create_client'
  get 'user/logout', to: 'users#logout', as: 'welcome'



  namespace :admin do
    get '/user', to: 'users#index', as: 'user'
    get '/user/edit', to: 'users#edit', as: 'edit_user'
    get '/user/users', to:'users#users', as: 'user_users'
    get '/user/user/:user_id/edit', to: 'users#edit', as: 'edit_user_user'
  end

  namespace :oauth do
    post '/token', to: 'token#index', defaults: {format: :json}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
