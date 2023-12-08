Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :user do
    get 'events/index'
    get 'events/events'
    get 'events/show'
    get 'events/edit'
  end
  namespace :user do
    get 'follows/index'
    get 'follows/followers'
    get 'follows/following'
  end
  namespace :user do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :user do
    get 'groups/new'
    get 'groups/show'
    get 'groups/edit'
  end
  namespace :user do
    get 'favorites/show'
  end
  namespace :user do
    get 'post_comments/new'
    get 'post_comments/index'
    get 'post_comments/show'
  end
  namespace :user do
    get 'posts/index'
    get 'posts/new'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
  end
  namespace :user do
    get 'homes/about'
    get 'homes/top'
  end
  devise_for :admins,skip: [:registrations,:passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,skip: [:passwords] , controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
end
