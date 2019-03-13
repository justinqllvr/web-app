Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :reports do
    collection do
      get :my
    end
    resources :likes
  end
  get 'reports'=>'reports#index'
  get 'cgu' => 'cgu#cgu' 
  get 'home' => 'home#index'
  root to: 'home#index'
end
