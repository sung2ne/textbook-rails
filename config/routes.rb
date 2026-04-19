Rails.application.routes.draw do
  resources :posts

  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'
  post '/search',  to: 'search#create'

  # 루트 경로
  root 'posts#index'
end