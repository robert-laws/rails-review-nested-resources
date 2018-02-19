Rails.application.routes.draw do
  
  resources :countries, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :cities, only: [:index, :show, :new]
  end


  resources :cities, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root 'countries#index'
end
