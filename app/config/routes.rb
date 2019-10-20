Rails.application.routes.draw do
  resources :recipes, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', action: :index, controller: 'homepage'
  get 'single', action: :single, controller: 'homepage'
  get 'category-post', action: :category_post, controller: 'homepage'
  get 'category', action: :category, controller: 'homepage'
  get 'contact', action: :contact, controller: 'homepage'
  get 'recipe', action: :recipe, controller: 'homepage'
end
