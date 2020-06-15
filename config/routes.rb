Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resource :users, only: [:show] do
    get 'logout', to: 'users#logout'
    resources :cards, only: [:new, :index] do
      collection do
      # クレジットカード登録
        # post 'pay', to: 'cards#pay'
      # クレジットカード削除
        # delete 'delete', to: 'cards#delete'
      end
    end
  end

  resources :items, only: [:show, :index, :new]
  resource :users, only: [:show] do
    collection do
      get "new_login"
      get "new_session"
      get "new_user"
      get "new_address"
      get "create_address" 
    end
  end
end
