class ArticlesController < ApplicationController
	before_action :require_permission, :only => [:destroy, :edit]
	def index
   	@articles = Article.all
  	end

  def edit
  	@article = Article.find(params[:id])

	end

	def show
		@article = Article.find(params[:id])
	end

	def new
    @article = Article.new
 	end

 	def create
  		@article = Article.new(article_params)
       @article.user_id = current_user.id
  		if @article.save
  			redirect_to @article  
  		else
  			render 'new'
  		end	
  	end

  def update
  	@article = Article.find(params[:id])
    if @article.update(article_params)
  		redirect_to @article
 		else
    		render 'edit'
  		end
	end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end


def upvote 
  @article = Article.find(params[:id])
  @article.upvote_by current_user
  #AJAX: entire page wont reload on an upvote
  respond_to do |format|
    format.html { redirect_to :back }
    #format.json { render json: { count: @debat.liked_count } }
    format.js { render layout: false }
  end
 
end  

def downvote
  @article = Article.find(params[:id])
  @article.downvote_by current_user
  #AJAX: entire page wont reload on an upvote
  respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
end
  	private
  		def article_params
    		params.require(:article).permit(:title, :text,:remove_image,:image)
  		end

def require_permission
    @article = Article.find(params[:id])
  if current_user.id != @article.user_id
    redirect_to article_path(@article)
    #Or do something else here
  end
end
      
end
