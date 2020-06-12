Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  
  # マイページトップ（仮）
  get "users/show"
  # マイページ-支払い方法（仮）
  get "users/cards"
  # マイページ-クレジットカード登録（仮）
  get "users/card-create"
  # マイページ-ログアウト（仮）
  get "users/logout"
end
