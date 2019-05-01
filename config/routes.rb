Rails.application.routes.draw do

  resources :cities, only:[:show]
  resources :gossips do
    resources :comments
  end
  resources :users, only:[:show]
  resources :tags, only:[:show]

  get '/index', to: 'static_pages#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:id', to: 'welcome#show'
end
