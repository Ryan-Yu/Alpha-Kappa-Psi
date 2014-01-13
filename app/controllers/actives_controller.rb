class ActivesController < ApplicationController

	skip_before_filter :verify_authenticity_token

	# Devise is combined with a RESTful user resource, so only some of the 
	# RESTful routes need to be implemented here

	def show
		@active = Active.find(params[:id])
	end

	def index
		@actives = Active.all
    end

end
