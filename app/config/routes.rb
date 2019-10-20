Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', action: :index, controller: 'recipes'
  get 'single', action: :single, controller: 'recipes'
  get 'category-post', action: :category_post, controller: 'recipes'
  get 'category', action: :category, controller: 'recipes'
  get 'contact', action: :contact, controller: 'recipes'
  get 'recipe', action: :recipe, controller: 'recipes'
end
