Rails.application.routes.draw do
  resources :places
  devise_for :users, path: 'auth',
                     path_names: {
                        sign_in: 'login',
                        sign_out: 'logout',
                        edit: 'profile'
                     }

  root 'pages#home'

end
