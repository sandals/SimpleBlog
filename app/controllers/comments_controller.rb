class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		comment = @article.comments.build(comment_params)
		if comment.author.blank?
			comment.author = "Anonymous"
		end
		
		if comment.save
			redirect_to @article
		else
			redirect_to @article, notice: "Comment body is required" 
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:author, :body)
	end
end
