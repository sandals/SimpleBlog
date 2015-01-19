class Admin::DashboardController < ApplicationController
	before_filter :require_login

	def index
		@dashboard = Dashboard.new
	end
end
