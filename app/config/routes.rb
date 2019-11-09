Rails.application.routes.draw do
  get 'user/resource'
  get 'admins/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recipes, only: [:index, :show]
  resources :comments
  get '/', action: :index, controller: 'homepage', as: 'home'
  get 'single', action: :single, controller: 'homepage'
  get 'category-post', action: :category_post, controller: 'homepage'
  get 'category', action: :category, controller: 'homepage'
  get 'contact', action: :contact, controller: 'homepage'
  get 'recipe', action: :recipe, controller: 'homepage'

  post 'password/forgot', action: :forgot, controller: 'passwords'
  post 'password/reset', action: :reset, controller: 'passwords'
  get 'password/reset', action: :reset_new_password, controller: 'passwords'

  post 'comments/reply', action: :create_reply, controller: 'comments'

  get 'profile', action: :profile, controller: 'users'
  post 'profile/update', action: :update_profile, controller: 'users'
  get 'profile/change-password', action: :change_password, controller: 'users'
  post 'profile/update-password', action: :update_password, controller: 'users'

  delete 'destroy-reply/:id', action: :destroy_reply, controller: 'comments', as: 'destroy-reply'

  put 'comments/:id/update-reply', action: :update_reply, controller: 'comments'

  
#   Templates
#   get 'single', action: :single, controller: 'homepage'
#   get 'category-post', action: :category_post, controller: 'homepage'
#   get 'category', action: :category, controller: 'homepage'
#   get 'contact', action: :contact, controller: 'homepage'
#   get 'recipe', action: :recipe, controller: 'homepage'
end
