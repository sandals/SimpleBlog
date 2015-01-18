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

	def edit
		@article = Article.find(params[:id])		
	end

	def update
		@article = Article.find(params[:id])
		if params[:publish]
			@article.published = true
		else
			@article.published = false
		end
		@article.update(article_params)

		redirect_to dashboard_root_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end
end
