class RusheesController < ApplicationController

	before_action :authenticate_active!, only: [:show, :index, :create, :new]

	def new
		@newrushee = Rushee.new
	end

	def create
		@newrushee = Rushee.new(rushee_params)
		if @newrushee.save
			flash[:success] = @newrushee.name + " sucessfully saved as a new rushee!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@rushee = Rushee.find(params[:id])
		@rusheeposts = @rushee.rusheeposts.all
		@rusheepost = @rushee.rusheeposts.build if active_signed_in?
	end


	def index
		@rushees = Rushee.all
		@rushsemester = RushEvent.first.semester unless RushEvent.first.nil?
	end


	private

		def rushee_params
			params.require(:rushee).permit(:name, :email, :grade, :major, :photograph)
		end

end
