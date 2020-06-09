Rails.application.routes.draw do
  devise_for :users
  # マイページトップ
  get "users/show"
  # マイページ-プロフィール
  get "users/profile"
  # マイページ-やることリスト
  get "users/todo"
  # マイページ-いいね！一覧
  get "users/like"
  # マイページ-クレジットカード一覧
  get "users/cards"
  # マイページ-クレジットカード登録
  get "users/create"
  # マイページ-住所変更
  get "users/deliver-address"
  # マイページ-ログアウト
  get "users/logout"
  
end
