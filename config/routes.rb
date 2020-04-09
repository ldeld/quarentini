Rails.application.routes.draw do
  get 'rooms/create'
  get 'rooms/show'
  get 'pages/home'

  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
