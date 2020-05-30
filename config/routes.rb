Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  $date = Time.now.in_time_zone('Tokyo').to_s
  root "items#index"
  resources :products, only: :index
end
