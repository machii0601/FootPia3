Rails.application.routes.draw do
  get 'activities/index'
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  devise_scope :user do
    post "user/guest_sign_in", to: "user/sessions#guest_sign_in"
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    put "/admin/users/:id/hide" => "users#hide", as: 'users_hide'
    resources :posts, except: [:new] do
      resources :comments, only: [:index, :destroy]
    end
  end

scope module: :user do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get "confirm"=>"users#confirm",as: "confirm"
  get "search" => "searches#search"
  # resources :events, only: [:index, :show, :edit] do
  #   collection do
  #     get :events
  #   end
  # end
  resources :activities, only: [:index] do
    patch :read, on: :member
  end

  resources :follows, only: [:index, :show, :create, :destroy]

  get "/calendar", to: "events#index"
  get "/calendar_json", to: "events#calendar_json"

  resources :groups, only: [:new, :show, :edit, :index, :create, :update] do
    post 'join' => 'groups#join'
    delete 'withdrawal' => 'groups#withdrawal'
    resources :group_comments, only: [:create, :destroy]
    resources :events, only: [:create, :destroy]
  end

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :tags, only: [:index, :show, :destroy]
  resources :users, only: [:show, :edit, :update] do
    collection do
      patch :withdrawal
    end
  end
end
end
