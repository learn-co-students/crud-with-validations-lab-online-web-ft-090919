Rails.application.routes.draw do
  resources :songs
  root 'songs#index'
  # For details on theDSL available within this file, see http://guides.rubyonrails.org/routing.html
end
