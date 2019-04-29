Rails.application.routes.draw do

  get 'welcome/show'
  get 'static_pages/contact'
  root 'static_page_controller#home'

  get '/static_pages/contact', to: 'static_pages#contact'

  get '/static_pages/team', to: 'static_pages#team'

end
