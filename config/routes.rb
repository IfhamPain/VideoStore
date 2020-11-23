
Rails.application.routes.draw do
  get 'orders/show'
  get 'movies/index'
  get 'movies/create'
  get 'movies/edit'
  get 'users/index'

  devise_for :superusers,path:'superuser', controllers: { registrations: "superusers/registrations", sessions: "superusers/sessions"}
  devise_for :users, path:'admin', controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  devise_scope :admin do
    get '/admin/users',   to: 'users#index'
    get '/admin/sign_up', to: 'users/registrations#new'
    get '/admin/users/:id',     to: 'users#show', as: 'admin_user'
  end

  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new', as: 'new_user_sign_in'
    get '/user/edit/:id',     to: 'users#edit', as: 'edit_user'
  end

  root 'pages#home'

  resources :superusers
  resources :users
  resources :movies
  resources :orders
  resources :actors
  resources :genres

end