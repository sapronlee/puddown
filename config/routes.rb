Rails.application.routes.draw do
  mount RootAPI => '/api'
  
  use_doorkeeper
  
  devise_for :users
  
  root 'assets#index'
  # get '*ember', to: 'assets#index'
end
