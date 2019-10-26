class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  # GET /recipes
  # GET /recipes.json
  def index
    page = params[:page] ? params[:page] : 1

    categories = category_search
    ingredients = ingredient_search
    recipes = recipe_search

    @search_query = search_query
    @recipe_hash = {
      category: categories.nil? ? 
                nil :
                Recipe.where(category_id: categories.pluck(:id)).order(created_at: :desc).page(page).per(4),
      ingredient: ingredients.nil? ? 
                  nil :
                  Recipe.joins(:ingredients).where(ingredients: {id: ingredients.pluck(:id)}).order(created_at: :desc).page(page).per(4),
      recipe: recipes.nil? ? nil : recipes.page(page).per(4)
    }
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

private
  def search_query
    params[:query]
  end

  def search_type
    params[:type]
  end

  def category_search
    return nil if search_type.present? && search_type != 'category'
    
    if search_query.present?
      return Category.where('name LIKE ?', "%#{search_query}%")
    else
      return nil
    end
  end

  def ingredient_search
    return nil if search_type.present? && search_type != 'ingredient'
    
    if search_query.present?
      return Ingredient.where('name LIKE ?', "%#{search_query}%")
    else
      return nil
    end
  end

  def recipe_search
    return nil if search_type.present? && search_type != 'recipe'
    if search_query.present?
      return Recipe.where('name LIKE ?', "%#{search_query}%")
    else
      return Recipe.all
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.fetch(:recipe, {})
  end
end
