module StaticPagesHelper
  def cache_key_for_rush_flyer(flyer)
    if flyer
      "rush-flyer-#{flyer.id}-#{flyer.updated_at.try(:utc).try(:to_s, :number)}"
    end
  end

  def cache_key_for_rush_events
    count          = RushEvent.count
    max_updated_at = RushEvent.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "rush-events/all-#{count}-#{max_updated_at}"
  end
end
