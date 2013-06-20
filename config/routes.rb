Whereis::Application.routes.draw do
  root to: 'top#index'

  resources :watchers, only: [:new, :create]
end
