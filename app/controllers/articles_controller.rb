class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
   
  end
  def index
    @all_articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    puts "Processing"
    
    @article = Article.new(params.require(:article).permit(:title, :description))
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
    # if @article.save
    #   redirect_to article_path(@article)
    # else
    #    format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    # end

  end


end