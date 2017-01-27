Rails.application.routes.draw do

  root "site#index"

  resources :owners do
  resources :pets, only: [:index, :new, :create]
  resources :owners, except: [:new]
   end
  resources :pets, only: :show

   get "/signup" => "owners#new"

   get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'




end
