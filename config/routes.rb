Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get "sessions/user", "sessions#user"
  resources :medical_histories
  resources :dependants
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "medical_histories/:user_id/users_with_deps", to: "medical_histories#get_self_and_dependants"
  get "medical_histories/:user_id/users", to: "medical_histories#get_for_self"
  get "medical_histories/:user_id/deps", to: "medical_histories#get_for_dependants"

  get "dependants/:user_id/deps", to: "dependants#user_deps"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new',  as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  delete 'logout', to: 'sessions#destroy', as: 'logout_delete'
end
