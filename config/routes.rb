Rails.application.routes.draw do

  get 'biscomments/new'
  get 'biscomments/create'
  get 'biscomments/index'
  get 'biscomments/show'
  get 'biscomments/destroy'
  get 'biscomments/update'
  get 'comments/new'
  get 'comments/create'
  get 'comments/index'
  get 'comments/show'
  get 'comments/destroy'
  get 'comments/update'
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
