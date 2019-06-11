Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  resources :movies
  
  resources :seasons, only: [:index], format: "json"
  
  resources :seasons do
    resources :episodes
  end
  
  resources :contents, only: [:index], format: "json" 
end
