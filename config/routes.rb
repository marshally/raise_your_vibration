Rails.application.routes.draw do
  resources :posts do
    collection do
      get :newest
    end
    member do
      post :body
      patch :publish
    end
    resources :entries, only: [:create, :update, :destroy]
  end

  resources :users

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/facebook', as: :login
  get '/logout', to: "sessions#destroy", as: :logout

  post '/sms/receive', to: 'sms#receive'

  root 'home#index'
end
