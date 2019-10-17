class RecipesController < ApplicationController
  def index

  end

  def single
    render "recipes/single-post"
  end

  def category_post
    render "recipes/catagory-post"
  end

  def category
    render "recipes/catagory"
  end

  def contact
    render "recipes/contact"
  end

  def recipe
    render "recipes/receipe"
  end
end
