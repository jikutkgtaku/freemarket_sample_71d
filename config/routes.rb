Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  
  # # マイページトップ（仮）
  # get "users/show"
  # # マイページ-支払い方法（仮）
  # get "users/cards"
  # # マイページ-クレジットカード登録（仮）
  # get "users/card-create"
  # # マイページ-ログアウト（仮）
  # get "users/logout"

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
end