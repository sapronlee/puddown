Rails.application.routes.draw do
  mount RootAPI => '/'
  
  root 'assets#index'
  get '*ember', to: 'assets#index'
end
