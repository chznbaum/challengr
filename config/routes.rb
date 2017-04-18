Rails.application.routes.draw do
  devise_for :users
  get 'about', to: 'pages#about'
  get 'dev', to: 'pages#dev'
  get 'help', to: 'pages#help'
  get 'support', to: 'pages#support'
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  resources :challenges
  resources :projects

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
