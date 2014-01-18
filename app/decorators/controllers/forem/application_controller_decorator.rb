Forem::ApplicationController.class_eval do

  # Limits accessibilty of forums to signed in actives
  before_filter :authenticate_active!
end