class Admin::ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if params[:publish]
			@article.published = true
		end
		@article.save

		redirect_to dashboard_root_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end
end
