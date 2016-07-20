Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
root :to => redirect('/profiles.json')

  resources :profiles do
    resources :stories
  end
end
