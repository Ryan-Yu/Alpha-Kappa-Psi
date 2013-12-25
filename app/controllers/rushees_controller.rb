class RusheesController < ApplicationController

	before_action :authenticate_active!

	def show
		@rushee = Rushee.find(params[:id])
		@rusheeposts = @rushee.rusheeposts
		@rusheepost = @rushee.rusheeposts.build if active_signed_in?
	end


	def index
		@rushees = Rushee.all
	end

end
