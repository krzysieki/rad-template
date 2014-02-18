ControlPanel::Application.routes.draw do
  devise_for :users
  root to: 'main#index'

  resources :users
  resources :customers
  resources :devices
  resources :playlists
  get '/currentuser', to: 'users#currentuser'
end
