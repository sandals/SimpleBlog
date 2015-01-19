class Admin::DashboardController < ApplicationController
	before_filter :require_login
	layout 'admin'

	def index
		@dashboard = Dashboard.new
	end
end
