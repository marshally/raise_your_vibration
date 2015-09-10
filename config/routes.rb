Rails.application.routes.draw do
  resources :entries

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/facebook', as: :login
  get '/logout', to: "sessions#destroy", as: :logout

  root 'entries#index'
end
