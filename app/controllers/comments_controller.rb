class CommentsController < ApplicationController
	#http_basic_authenticate_with name: current_user.email, password: current_user.password, only: :destroy
	#before_action :require_permission, :only => :destroy
  def create
    	@article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  	end
 
 def destroy

    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  private
  	def comment_params
    	params.require(:comment).permit(:commenter, :body)
    end

=begin
def require_permission
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  if @user.id != @comment.user
    redirect_to article_path(@article)
    #Or do something else here
  end
end
=end

  #def check_user
      #@article = Article.find(params[:article_id])
     #@comment = @article.comments.find(params[:id])
      #if @comment.user == current_user
         #redirect_to article_path(@article)
    #end

    #def is_correct_user
      #@user = User.find(find(current_user))
      #@article = @user.article.find(params[:article_id])
      #@comment = @article.comments.find(params[:id])
      #if current_user.id != @user.id
        #redirect_to article_path(@article)
     #end
    #end
end
