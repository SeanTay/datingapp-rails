Rails.application.routes.draw do
root :to => redirect('/profiles.json')

  resources :profiles do
    resources :stories
  end
end
