Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about'=> 'homes#about'
  devise_for :users
  get '/search', to: 'searchs#search'
 resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

 resources :users, only: [:show, :index, :create, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'following_user' => 'relationships#following_user', as: 'following_user'
    get 'follower_user' => 'relationships#follower_user', as: 'follower_user'
  end
    post 'create/:id' => 'relationships#create', as: 'follow' # フォローする
    post 'destroy/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
end

