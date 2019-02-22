Rails.application.routes.draw do
  devise_for :users
  resources :reports
  root to: 'home#index'
 
  get 'reports'=>'reports#index'
  get 'cgu' => 'cgu#cgu' 
  get 'home' => 'home#index'
end
