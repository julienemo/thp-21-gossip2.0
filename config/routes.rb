Rails.application.routes.draw do

  get 'profiles/show'
  resources :cities, only:[:show]
  resources :gossips do
    resources :comments do
      resources :biscomments
    end
  end

  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only:[:show, :new, :create]
  resources :tags, only:[:show]

  get '/index', to: 'static_pages#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:id', to: 'welcome#show'
  get '/profile', to: 'static_pages#profile'
end
