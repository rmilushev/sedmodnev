Rails.application.routes.draw do
  resources :images, only: [:create, :destroy]
  resources :articles
  devise_for :admins
  devise_scope :admin do
    match 'admin' => 'devise/sessions#new', via: :get
  end
  post 'twitter/tweet', to: 'twitter#tweet_post'
  root to: 'articles#index'
  # root to: 'high_voltage/pages#show', id: 'construction'
end
