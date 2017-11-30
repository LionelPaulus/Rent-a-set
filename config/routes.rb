Rails.application.routes.draw do
  devise_for :users, path: 'auth',
                     path_names: {
                        sign_in: 'login',
                        sign_out: 'logout',
                        edit: 'profile'
                     }

  root 'pages#home'

  resources :set do
  end

end
