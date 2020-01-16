Rails.application.routes.draw do
  resources :permissions
  resources :rols do
    member do
      post 'edit_status_permission'
    end
  end
  resources :businesses
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  post '/profiles/:id', :to => 'profiles#destroy', :as => :user

  get 'home/index'

  resources :profiles

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
