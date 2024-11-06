class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/:id
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/:id/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
      if @article.update(article_params)
        redirect_to @article, notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy!
    redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed."
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
