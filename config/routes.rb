Whereis::Application.routes.draw do
  root to: 'top#index'

  resources :authorization
  match "oauth2callback", :controller => :authorization, :action => :oauth2callback
end
