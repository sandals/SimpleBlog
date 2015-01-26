class ArticlesController < ApplicationController
	def index
		@articles = Article.all.order("ID DESC")
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
	end
end
