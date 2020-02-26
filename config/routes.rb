Rails.application.routes.draw do
  resources :cities, only: [:index, :show]
  devise_for :admins
  devise_for :users
  resources :reports do
    collection do
      get :my
    end
    resources :likes
  end
  get 'cgu' => 'cgu#cgu'
  get 'home' => 'home#index'
  root to: 'home#index'
end
