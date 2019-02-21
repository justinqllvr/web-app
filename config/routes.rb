Rails.application.routes.draw do
  devise_for :users
  resources :reports
  root to: 'home#index'
  get 'cgu' => 'cgu#cgu' 
end
