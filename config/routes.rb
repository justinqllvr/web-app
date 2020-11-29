Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users
  resources :cities, only: [:index, :show]
  resources :reports do
    collection do
      get :my
    end
    resources :likes
  end
  get 'cgu' => 'cgu#cgu'
  root to: 'home#index'
end
