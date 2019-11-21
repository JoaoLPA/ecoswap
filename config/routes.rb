Rails.application.routes.draw do
  devise_for :users
  root to: 'offer#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :offer, only: [:index, :show, :create, :new] do

  end

end

