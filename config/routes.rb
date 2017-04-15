Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/dev'

  get 'pages/help'

  get 'pages/support'

  get 'pages/terms'

  get 'pages/privacy'

  resources :blogs
  resources :challenges
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
