class Api::V1::ArticlesController < ApplicationController 

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article
    else
      render json: "Something went terribl wrong"
    end
  end

  def edit
    render json: @article
  end

  def update
    if @article.update(article_params)
      render json: "Successfully updated"
    else
      render json: "Somthing went Wrong"
    end
  end

  def show
    render json: @article
  end

  def destroy
    if @article.destroy
      render json: "Successfully deleted"
    end
  end

  def searched
    @parameter = params[:title.downcase]
    @article = Article.where("lower(title) LIKE :title", title: "%#{@parameter}%")
    if @article != []
      render json: @article
    else
      render json: "record doesn't exist."
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :release_date)
  end

end
