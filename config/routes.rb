Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  root "items#index"
  # resources :items

  # resources :users, only: :show do
  #   collection do
  #     get "new_login"
  #     get "new_session"
  #     get "new_user"
  #     get "new_address"
  #     get "create_address"
      
  #   end
  # end
  resources :users, only: :show
end

