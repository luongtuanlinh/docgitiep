class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  # GET /recipes
  # GET /recipes.json
  def index
    page = params[:page] ? params[:page] : 1
    @recipes = Recipe.order(created_at: :desc).page page
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.fetch(:recipe, {})
    end
end
