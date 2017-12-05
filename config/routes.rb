Rails.application.routes.draw do
  get 'people/index'

  devise_for :users, path: 'auth',
                     path_names: {
                        sign_in: 'login',
                        sign_out: 'logout',
                        edit: 'profile'
                     }

  root 'pages#home'

  resources :sets do
  resources :reservations, only: [:create]
  end

end
