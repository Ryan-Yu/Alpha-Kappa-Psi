class RusheesController < ApplicationController
	
	skip_before_filter :verify_authenticity_token  
	before_action :authenticate_active!, only: [:show, :index]

	def new
		@newrushee = Rushee.new
	end

	def create
		@newrushee = Rushee.new(rushee_params)
		if @newrushee.save
      		ActiveMailer.rushee_signup_email(@newrushee).deliver
			flash[:success] = @newrushee.name.titleize + " was successfully saved as a new rushee."
			redirect_to new_rushee_path
		else
			render 'new'
		end
	end

	def show
		@rushee = Rushee.find(params[:id])
		@rushee_app = @rushee.rush_application #### might fail
		@rusheeposts = @rushee.rusheeposts.all
		@rusheepost = @rushee.rusheeposts.build if active_signed_in?
	end


	def index
		@rushees = Rushee.all
		@rushsemester = RushEvent.first.semester unless RushEvent.first.nil?
	end


	private

		def rushee_params
			params.require(:rushee).permit(:name, :email, :grade, :major, :photograph, :password, :password_confirmation)
		end

end
