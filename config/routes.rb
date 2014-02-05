ControlPanel::Application.routes.draw do
  devise_for :users
  root to: 'main#index'

  resources :users
end
