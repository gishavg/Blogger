Rails.application.routes.draw do
  get 'bloggers/index'
  devise_for :admins
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users do
    member do
      match 'admin_access', via: [:post]
      match 'admin_ban_user', via: [:get]
      match 'ban_user', via: [:post]
      get :following, :followers
    end
    resources :post, only: [:new, :create, :destroy] do
      resources :comments do
        resources :replies
      end
    end
    resources :relationships, only: [:create, :destroy]
  end
  root 'bloggers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
