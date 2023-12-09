Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  namespace :admin do
  resources :users, only: [:index, :show, :edit]
end

scope module: :user do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get "confirm"=>"users#confirm",as: "confirm"
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
  resources :favorites, only: [:show]
  resources :post_comments, only: [:new, :index, :show]
  resources :posts, only: [:index, :new, :update, :create, :destroy]
  resources :users, only: [:show, :edit, :update] do
    collection do
      patch :withdrawal
    end
  end
end
end
