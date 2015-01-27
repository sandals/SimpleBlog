class PagesController < ApplicationController
	def index
		@articles = Article.where('published = true').order("ID DESC")
		@about = UserSettings.first
	end
end
