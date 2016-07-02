Rails.application.routes.draw do
  resources :articles
  devise_for :admins
  root to: 'articles#index'
  # root to: 'high_voltage/pages#show', id: 'construction'
end
