Rails.application.routes.draw do
  get 'user/detail'
  get 'tags/each'
  get '/contact', to: 'static_pages#contact'

  get '/team', to: 'static_pages#team'

  get '/index', to: 'static_pages#index'

  get '/welcome/:id', to: 'welcome#show'

  get '/gossip/:id', to: 'gossip#each'

  get '/tag/:id', to: 'tags#each'

  get 'user/:id', to: 'user#detail'
end
