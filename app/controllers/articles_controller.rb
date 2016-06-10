class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_book

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = @book.articles.build(article_params)

    if @article.save
      redirect_to book_articles_url, notice: 'Article was successfully created.' 
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to book_articles_url, notice: 'Article was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to book_articles_url, notice: 'Article was successfully destroyed.'
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end
    
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, :book_id)
    end
end
