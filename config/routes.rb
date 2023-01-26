Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :quotes
  root to: "pages#home"

  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do
      resources :line_items, except: [:index, :show, :edit]
    end
  end
end
