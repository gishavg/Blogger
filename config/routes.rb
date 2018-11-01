Rails.application.routes.draw do
  get 'bloggers/index'
  devise_for :admins
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  resources :articles
  root 'bloggers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
