Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"

  resources :users, only: [:show] do
    get 'logout', to: 'users#logout'
    get 'items', to: 'users#items'
    resources :cards, only: [:new, :index] do
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

  resources :creditcards, only: [:new, :create] do
    collection do
      get "buy"
    end
  end
end