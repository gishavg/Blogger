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
      match 'admin_ban', via: [:post]
    end
  end
  resources :articles
  root 'bloggers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
