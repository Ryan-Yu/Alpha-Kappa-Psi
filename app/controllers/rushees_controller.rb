class RusheesController < ApplicationController

	before_action :authenticate_active!

	def show
		@rushee = Rushee.find(params[:id])
	end

	def index
		@rushees = Rushee.all
	end

end
