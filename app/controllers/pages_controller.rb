class PagesController < ApplicationController
	def index
		@articles = Article.where('published = true')
	end
end
