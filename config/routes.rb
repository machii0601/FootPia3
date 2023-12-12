Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  namespace :admin do
  resources :users, only: [:index, :show, :edit, :update]
  put "/admin/users/:id/hide" => "users#hide", as: 'users_hide'
end

scope module: :user do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get "confirm"=>"users#confirm",as: "confirm"
  get "search" => "searches#search"
  resources :events, only: [:index, :show, :edit] do
    collection do
      get :events
    end
  end

  resources :follows, only: [:index] do
    member do
      get :followers
      get :following
    end
  end

  resources :genres, only: [:index, :edit]
  resources :groups, only: [:new, :show, :edit]
  resources :favorite, only: [:show, :create, :destroy]
  resources :post_comments, only: [:new, :index, :show, :create, :destroy]
  resources :posts, only: [:index, :new, :update, :create, :destroy, :show, :edit] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :tags, only: [:index, :show, :destroy]
  resources :users, only: [:show, :edit, :update] do
    member do
      get :favorites
    end
    collection do
      patch :withdrawal
    end
  end
end
end
