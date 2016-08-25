Rails.application.routes.draw do
  resources :images, only: [:create, :destroy]
  resources :articles, only: [:index, :show]
  devise_for :admins
  devise_scope :admin do
    match 'admin' => 'devise/sessions#new', via: :get
  end
  namespace :admin do
    resources :articles
  end
  post 'twitter/tweet', to: 'twitter#tweet_post'
  root to: 'articles#index'
end
