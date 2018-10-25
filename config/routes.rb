Rails.application.routes.draw do
  
  devise_for :users,
    :path => '',
    :path_names => {
      sign_in:  'login',
      sign_out: 'logout',
      sign_up:  'signup'
    },
    :controllers => {
      :registrations => "users/registrations",
      :confirmations => "users/confirmations",
    }

  root to: 'pages#home'

end
