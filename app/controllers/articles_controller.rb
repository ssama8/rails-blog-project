class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destoy]
  def show
  end
  def index
    @all_articles = Article.all
  end
  def new
    @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
 
  end

  def update
  respond_to do |format|
      if  @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :updated, location: @article }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
 
    
  end

  def destroy
    @article.destroy 
    redirect_to articles_path
  end

  private 
  def find_article
    @article = Article.find(params[:id])
  end  

  def article_params
    params.require(:article).permit(:title, :description)
  end

end