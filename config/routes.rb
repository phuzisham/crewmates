Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root :to => 'home#index'
  get '/user/:id' => 'home#user'
  resources :conversations do
    resources :messages
  end

  resources :forums do
    resources :forum_messages
  end
end
