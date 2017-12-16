Rails.application.routes.draw do
  resources :places do
    resources :bookings
    # resources :bookings, only: [:new, :create, :show, :index]
  end
  devise_for :users, path: 'auth',
                     path_names: {
                        sign_in: 'login',
                        sign_out: 'logout',
                        edit: 'profile'
                     }

  root 'pages#home'

end
