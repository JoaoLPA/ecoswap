Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :material, only: [:create, :new]
  end
  resources :material, only: [:index, :show] do
  end

end

