module RushApplicationHelper

  def cache_key_for_rush_application(rush_app)
    "rush-application-#{rush_app.id}-updated-#{rush_app.updated_at}"
  end
end
