Rails.application.routes.draw do
  resources :shoes
  resources :comments
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  # get 'profile/:id', to: 'users#profile', as: 'user_profile'

  # Mount ActionCable
  mount ActionCable.server => '/cable'
end
