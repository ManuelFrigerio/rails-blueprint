require 'sidekiq/web'

Rails.application.routes.draw do
  
  root to: 'pages#home'
  
  devise_for :users,
    :path => '',
    :path_names => {
      sign_in:  'login',
      sign_out: 'logout',
      sign_up:  'signup'
    },
    :controllers => {
      sessions: "users/sessions",
      registrations: "users/registrations",
      confirmations: "users/confirmations",
      passwords: "users/passwords",
    }


  get "admin" => redirect("/admin/users"), as: :admin
  namespace :admin do
    resources :users, only: [:index, :show] do
      get :become, on: :member
    end
    mount Sidekiq::Web, at: "/sidekiq"
  end

end
