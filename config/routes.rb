Rails.application.routes.draw do
  resources :countries
  resources :cities

  root 'countries#index'
end
