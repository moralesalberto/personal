Personal::Application.routes.draw do
  devise_for :users
  root 'keychains#index'

  resources :keychains

end
