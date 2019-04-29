Rails.application.routes.draw do
  get '/contact', to: 'static_pages#contact'

  get '/team', to: 'static_pages#team'

  get '/index', to: 'static_pages#index'
end
