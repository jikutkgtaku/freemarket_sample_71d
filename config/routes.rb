Rails.application.routes.draw do
  devise_for :users
  get "users/show"
  get "users/cards"
  get "users/deliver_address"
end
