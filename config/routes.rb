Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about'=> 'homes#about'
  devise_for :users
 resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
 resources :users, only: [:show, :index, :create, :edit, :update]
end

