Rails.application.routes.draw do
  
  get 'search/form'
  root 'static_page#home'
  get 'static_page/about'
  devise_for :users
  resources :posts
  
end
