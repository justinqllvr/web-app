class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@reports = Report.all
	end	
end
