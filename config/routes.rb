Rails.application.routes.draw do
  get 'pages/home'

  resources :rooms, only: [:show, :create], param: :slug
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
