Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  resources :articles
  devise_for :admins
  root to: 'high_voltage/pages#show', id: 'construction'
end
