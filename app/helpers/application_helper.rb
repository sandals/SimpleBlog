module ApplicationHelper
	# Code originally by @yannis_
	# Taken from: http://goo.gl/2AnujD
	def controller?(*controller)
		controller.include?(params[:controller])
	end

	def action?(*action)
		action.include?(params[:action])
	end
end
