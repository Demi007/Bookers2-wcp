Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  get 'search' => 'searches#search'
  resources :users, only: [:show,:edit,:update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do
    resources :book_comments
    resource :favorites, only: [:create, :destroy]
  end

end