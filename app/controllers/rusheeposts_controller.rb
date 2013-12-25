class RusheepostsController < ApplicationController

	before_action :authenticate_active!

	def create
		@rushee = Rushee.find(params[:rushee_id])
		@rusheepost = @rushee.rusheeposts.build(rusheepost_params)
		@rusheepost.active = current_active

		if @rusheepost.save
			flash[:success] = "Comment created!"
			redirect_to @rushee

		else
			flash[:error] = "There was an error with your comment; please try again."
			redirect_to @rushee
		end
	end



	def destroy
	end



	private

		def rusheepost_params
			params.require(:rusheepost).permit(:content)
		end

end