Rails.application.routes.draw do
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
<<<<<<< HEAD

  post 'comments/reply', action: :create_reply, controller: 'comments'
=======
>>>>>>> 69ca9d308a567597f01d8c01fcc91edab9198c85
end
