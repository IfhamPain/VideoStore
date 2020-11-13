
Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/create'
  get 'movies/edit'
  get 'users/index'
  devise_for :superusers,path:'superuser', controllers: { registrations: "superusers/registrations", sessions: "superusers/sessions"}
  #devise_for :users,path:'admin'
  # devise_for :users, path:'admin', controllers: { registrations: "registrations", }, skip: [:sessions]
  devise_for :users, path:'admin', controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  scope "/admin" do
    resources :users
  end

  resources :superusers
  resources :movies

  get '/admin/users',   to: 'users#index'
  get '/admin/sign_up', to: 'users/registrations#new'
  get 'admin/users/:id',     to: 'users#show'
  root 'pages#home'

end