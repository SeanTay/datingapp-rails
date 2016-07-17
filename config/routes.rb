Rails.application.routes.draw do
  
  resources :profiles do
    resources :stories
  end
end
