Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'bloggers/index'
  devise_for :admins
  get 'users/index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'users/search', to: 'users#search'
  get 'users/searchuser', to: 'users#searchuser'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users do
    match 'allfeed', via: [:get]
    match 'personalfeed', via: [:get]
    match 'filterby', via: [:get]
    match 'sortbylike', via: [:get]
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
    resources :likes, only: [:create, :destroy]
  end
  root 'bloggers#index'
  # get '*unmatched_route', to: 'bloggers#index', constraints(Subdomain) do
    # get '/',  to: "custom#home", as: 'custom_root'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
