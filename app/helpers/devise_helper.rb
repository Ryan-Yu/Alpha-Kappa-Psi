module DeviseHelper

  # Hacky way to translate devise error messages into devise flash error messages
  def devise_error_messages!
  	if resource.errors.full_messages.any?
    	flash.now[:error] = resource.errors.full_messages.join(' & ')
    end
    return ''
  end

  #Checks if the compared active is the same one as the current active
  def current_active?(active)
    active == current_active
  end

end