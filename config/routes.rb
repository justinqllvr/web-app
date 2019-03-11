Rails.application.routes.draw do
  devise_for :users
  resources :reports do
	  resources :likes
  end
	get 'reports'=>'reports#index'
	get 'cgu' => 'cgu#cgu' 
	get 'home' => 'home#index'
  root to: 'home#index'
end
