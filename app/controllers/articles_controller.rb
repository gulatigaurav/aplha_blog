class ArticlesController < ApplicationController
def new
@article = Article.new
end

def create
  @article = Article.new(article_params)
   if @article.save
          flash[:notice]= "Article was successfully created"
          redirect_to article_path(@article)
   else
    #  flash[:alert] = @article.errors.full_messages
     render 'new'
   end
# we need to white list the articles params
end

def show
@article = Article.find(params[:id])
end

private

def article_params
  params.require(:article).permit(:title,:description)
end

end
