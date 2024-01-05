class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    # utilisation avec un scope de Article
    @articles = Article.published.all
    # exemple avec un parametre
    # @articles = Article.online(true).all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Article créé avec succès'
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article mis à jour avec succès'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  # Permet de valider les parametres
  def article_params
    params.require(:article).permit(:title, :body, :online)
  end

  # Permet d eviter de repeter cette ligne, on va l utiliser dans le before_action
  def set_article
    @article = Article.find(params[:id])
  end
end
