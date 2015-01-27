class Dashboard
	def articles
		Article.all.order("ID DESC")
	end
end
