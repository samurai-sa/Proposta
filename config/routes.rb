Rails.application.routes.draw do
  
 
      devise_for :users, controllers: {
        registrations: "users/registrations",
      }
      
  get 'comments/create'
  get 'comments/destroy'
  root 'static_page#home'
  get 'static_page/about'
  resources :mypage, only: [:show]
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
  
  
  

