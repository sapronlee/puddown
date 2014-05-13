Rails.application.routes.draw do
  use_doorkeeper
  
  devise_for :users
  
  mount RootAPI => '/'
  
  root 'assets#index'
  # get '*ember', to: 'assets#index'
end
