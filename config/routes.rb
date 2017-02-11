Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  post '/log', to: 'log#login'

  get '/signup', to: 'users#new'
  post '/create', to: 'customer#create'

  namespace :admin do
    resources :users
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
