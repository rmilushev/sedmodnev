Rails.application.routes.draw do
  resources :articles
  devise_for :admins
  devise_scope :admin do
    match 'admin' => 'devise/sessions#new', via: :get
  end
  root to: 'articles#index'
  # root to: 'high_voltage/pages#show', id: 'construction'
end
