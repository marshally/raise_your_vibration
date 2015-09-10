Rails.application.routes.draw do
  resources :entries

  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/facebook', as: :login
  get '/logout', to: "sessions#destroy", as: :logout

end
