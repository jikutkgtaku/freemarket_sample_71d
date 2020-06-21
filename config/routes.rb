Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"  
  resources :items, only: [:show, :index, :new]
  resources :users, only: :show do
    collection do
      get "new_login"
      get "new_session"
      get "new_user"
      get "new_address"
      get "create_address"
    end
end


