Rails.application.routes.draw do
  root 'assets#index'
  get '*ember', to: 'assets#index'
end
