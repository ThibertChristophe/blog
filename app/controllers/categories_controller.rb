class CategoriesController < ApplicationController
  before_action :set_categorie, only: %i[edit update destroy]

  def index
    @categories = Categorie.all
  end

  def new
    @categorie = Categorie.new
  end

  def create
    @categorie = Categorie.new categorie_params

    if @categorie.save
      flash[:success] = 'Categorie créé avec succès'
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @categorie.update categorie_params
      flash[:success] = 'Categorie mis à jour avec succès'
      redirect_to categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @categorie.destroy
    flash[:success] = 'Categorie supprimée avec succès'
    redirect_to categories_path, status: :see_other
  end

  private

  def categorie_params
    params.require(:categorie).permit(:name)
  end

  def set_categorie
    @categorie = Categorie.find params[:id]
  end
end
