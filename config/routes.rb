Rails.application.routes.draw do
  devise_for :users
  root "items#index"  
  resources :items, only: [:show, :index, :new, :create] do
    collection do
      get "get_shipping_way"
    end
  end

  resources :users, only: :show do
    collection do
      get "new_login"
      get "new_session"
      get "new_user"
      get "new_address"
      get "create_address"
    end
  end

  resources :brands, only: :index, defaults: { format: 'json' }
end
