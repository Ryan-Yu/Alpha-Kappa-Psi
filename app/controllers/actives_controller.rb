class ActivesController < ApplicationController

	skip_before_filter :verify_authenticity_token

	# Devise is combined with a RESTful user resource, so only some of the 
	# RESTful routes need to be implemented here

	def show
		@active = Active.find(params[:id])
	end

	def index
    in_cache_actives = get_cached_actives
    if in_cache_actives
      @actives = in_cache_actives
    else
      @actives = Active.all
      set_cache_actives(@actives)
    end
  end

end
