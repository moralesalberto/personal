Personal::Application.routes.draw do
  devise_for :users
  root 'keychains#index'

  resources :keychains do
  end


  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

end
