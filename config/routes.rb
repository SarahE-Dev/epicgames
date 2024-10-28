Rails.application.routes.draw do
  resources :projects
  devise_for :users
  
  authenticated :user, ->(user) { user.admin? } do
    root 'admin/dashboard#index', as: :admin_root

    get 'admin/dashboard', to: 'admin/dashboard#index'
    resources :users
    resources :projects
  end
  
  authenticated :user, ->(user) { user.user? } do
    root 'users/dashboard#index', as: :user_root
    get 'users/dashboard', to: 'users/dashboard#index'
    resources :projects
    resources :users
  end
  
  root 'home#index'
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users
  end
  
  namespace :users do
    get 'dashboard', to: 'dashboard#index'
  end
end
