Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :event do
    resources :guest
    resources :message
  end

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :users, only: [:show]

  get '/users/:id/my_events' => 'users#my_events', :as => :user_events

  root to: "static_pages#index"
end
