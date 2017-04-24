Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  get 'about', to: 'pages#about'
  get 'dev', to: 'pages#dev'
  get 'help', to: 'pages#help'
  get 'support', to: 'pages#support'
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'

  resources :users, path: '', except: :index do
    member do
      get :following, :followers
    end
    resources :projects
    resources :blogs, path: '', except: :index do
      member do
        get :toggle_status
      end
    end
  end

  resources :challenges
  resources :relationships, only: [:create, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
