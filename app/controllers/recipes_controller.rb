class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update]
  before_action :get_ingredients, only: [:new, :edit]
  
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.
    @ingredients = Ingredient.all
  end
  
  def create
    Recipe.create(recipe_params)

    redirect_to recipes_path
    # else
    #   render :new
    # end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    
    @all_ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end
  
  def update
    recipe = Recipe.find(params[:id])
    
    recipe.update(recipe_params)
    
      redirect_to recipes_path
  end
  
  private 
  
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def get_ingredients
    @ingredients = Ingredient.all
  end
  
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end  
end
