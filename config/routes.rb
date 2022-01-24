Rails.application.routes.draw do
 get 'records/index'
 devise_for :users
 root to: 'items#index'
 resources :items do
   resources :records, only: [:new, :create]
 end
end
