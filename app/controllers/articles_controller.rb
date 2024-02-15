class ArticlesController < ApplicationController
  def index
end
    def show
  end
  def edit 
    @article = Article.find(params[:id])
  end
  def update 
    @article = Article.find(params[:id])
    post_params = params.require(:article).permit(:title , :content)
    @article.update(post_params)
    redirect_to article_path
 end
 
end