Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :quotes
  root to: "pages#home"
end
