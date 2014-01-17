module ActivesHelper
  def cache_key_for_actives
    count          = Active.count
    max_updated_at = Active.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "active/all-#{count}-#{max_updated_at}"
  end
end
