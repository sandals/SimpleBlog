class Admin::DashboardController < ApplicationController
	def index
		@dashboard = Dashboard.new
	end
end
