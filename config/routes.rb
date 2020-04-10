Rails.application.routes.draw do
  get 'players/new'
  get 'players/create'
  get 'pages/home'

  resources :rooms, only: [:show, :create], param: :slug do
    resources :players, only: :create
    member do
      get "join", to: "players#new"
      get "start"
    end
  end
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
