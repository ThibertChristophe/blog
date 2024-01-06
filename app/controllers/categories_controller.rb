class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = 'Categorie créé avec succès'
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update category_params
      flash[:success] = 'Categorie mis à jour avec succès'
      redirect_to categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Categorie supprimée avec succès'
    redirect_to categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find params[:id]
  end
end
