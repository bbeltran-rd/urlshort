Rails.application.routes.draw do
  root to: "web_addresses#index"
  resources :web_addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
