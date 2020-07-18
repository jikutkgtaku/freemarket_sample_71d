Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"



  resource :users, only: [:show] do
    get 'logout', to: 'users#logout'
    resources :cards, only: [:new, :index, :show] do
      collection do
      # クレジットカード登録
        # post 'pay', to: 'cards#pay'
      # クレジットカード削除
        # delete 'delete', to: 'cards#delete'
      end
    end
  end

  resources :items do
    collection do
      get "get_shipping_way"
      get "category_children"
      get "category_grandchildren"
      get "get_size", defauts: { format: 'json' }
    end
  end

  resources :brands, only: [:index], defaults: {format: 'json'}

  resource :users, only: [:show] do
    collection do
      get "new_login"
      get "new_session"
      get "new_user"
      get "new_address"
      get "create_address" 
    end
  end

  resources :creditcards, only: [:new, :create, :destroy, :show] do
    collection do
      get "buy"
    end
  end
end
