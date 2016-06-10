class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :set_article
  before_action :set_book

  def index
    @sections = Section.all
  end

  def show
  end

  def new
    @section = Section.new
  end

  def edit
  end

  def create
    @section = @article.sections.build(section_params)
    if @section.save
      redirect_to book_article_sections_url, notice: 'Section was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @section.update(section_params)
      redirect_to book_article_sections_url, notice: 'Section was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @section.destroy
    redirect_to book_article_sections_url, notice: 'Section was successfully destroyed.'
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end
    
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:title, :description, :article_id)
    end
end
