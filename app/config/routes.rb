Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Authentication
  devise_for :users
  post 'password/forgot', action: :forgot, controller: 'passwords'
  post 'password/reset', action: :reset, controller: 'passwords'
  get 'password/reset', action: :reset_new_password, controller: 'passwords'

  # Customer
  # homepage
  get '/', action: :index, controller: 'homepage', as: 'home'

  # recipes
  resources :recipes, only: [:index, :show]

  # comments
  resources :comments
  post 'comments/reply', action: :create_reply, controller: 'comments'

  # premium
  get 'premium/info', to: 'premium#info', as: 'premium_info'
  get 'premium/purchase', action: :get_purchase, controller: 'premium', as: 'get_purchase_premium'
  post 'premium/purchase', action: :post_purchase, controller: 'premium', as: 'post_purchase_premium'
  get 'premium/thankyou', to: 'premium#thank_you'
  
  # Admin
  get 'admin', action: :index, controller: 'admins'
  
#   Templates
#   get 'admins/index'
#   get 'single', action: :single, controller: 'homepage'
#   get 'category-post', action: :category_post, controller: 'homepage'
#   get 'category', action: :category, controller: 'homepage'
#   get 'contact', action: :contact, controller: 'homepage'
#   get 'recipe', action: :recipe, controller: 'homepage'
end
