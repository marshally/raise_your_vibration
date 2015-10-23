Rails.application.routes.draw do
  resources :posts do
    collection do
      get :newest
    end
    resources :entries
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/facebook', as: :login
  get '/logout', to: "sessions#destroy", as: :logout

  root 'home#index'
end
