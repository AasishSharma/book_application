class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_section
  before_action :set_article
  before_action :set_book

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @section.comments.create(comment_params)
    
    if @comment.save
      redirect_to book_article_section_path(@book,@article,@section), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to book_article_section_path(@book,@article,@section), notice: 'Comment was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to book_article_section_path(@book,@article,@section), notice: 'Comment was successfully destroyed.'
  end

  private
    
    def set_book
      @book = Book.find(params[:book_id])
    end
    
    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_section
      @section = Section.find(params[:section_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :section_id)
    end
end
