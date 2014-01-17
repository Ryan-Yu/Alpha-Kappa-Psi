module RusheesHelper
  def cache_key_for_rushees
    count          = Rushee.count
    max_updated_at = Rushee.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "rushee/all-#{count}-#{max_updated_at}"
  end
end
