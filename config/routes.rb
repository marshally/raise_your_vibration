Rails.application.routes.draw do
  resources :entries

  root 'home#index'
end
