class Admin::ArticlesController < ApplicationController
	before_filter :require_login
	layout 'admin'

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if params[:publish]
			@article.published = true
		end
		@article.save

		redirect_to admin_root_path
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

		redirect_to admin_root_path
	end

	def destroy
		@article = Article.find(params[:id])

		if params[:article][:title] == @article.title
			@article.destroy
			redirect_to admin_root_path
		else
			flash[:notice] = "You must confirm the article's name in order to remove it."
			redirect_to admin_root_path
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :excerpt, :body)
	end
end
