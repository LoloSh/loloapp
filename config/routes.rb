Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  post '/log', to: 'log#login'

  get '/signup', to: 'users#new'
  post 'users/logout', to: 'users#logout'
  resources :users

  namespace :admin do
    resources :users
    post 'users/logout', to: 'users#logout'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
