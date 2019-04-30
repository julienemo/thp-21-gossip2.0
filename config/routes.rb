Rails.application.routes.draw do
  get '/index', to: 'static_pages#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'

  get '/gossip/:id', to: 'gossip#each'
  
  get '/tag/:id', to: 'tags#each'
  get 'user/:id', to: 'user#detail'

  get '/welcome/:id', to: 'welcome#show'
end
