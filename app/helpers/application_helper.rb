module ApplicationHelper
  ACTIVES_CACHE_KEY = 'Actives'

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "UC Berkeley Alpha Kappa Psi"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def get_cached_actives
    Rails.cache.read(ACTIVES_CACHE_KEY)
  end

  def set_cache_actives(actives)
    Rails.cache.write(ACTIVES_CACHE_KEY, actives)
  end

  def clear_cached_actives
    Rails.cache.delete(ACTIVES_CACHE_KEY)
  end

  def update_cached_actives(active)
    if Rails.cache.exists?(ACTIVES_CACHE_KEY)
      #Get Active ID and Actives Cache
      active_id = active.id
      actives = Rails.cache.read(ACTIVES_CACHE_KEY)
      found = false

      #Loop through all actives
      for index in 0..(actives.length - 1)

        # If a cached active is found to match the id, update the active
        cached_active_id = actives[index].id
        if cached_active_id == active_id
          actives[index] = active
          found = true
          break
        end
      end

      #If no active was found to match
      unless found
        actives.append(active)
      end

      #Re-insert updated actives into the cache
      Rails.cache.write(ACTIVES_CACHE_KEY, actives)
    else
      Rails.cache.write(ACTIVES_CACHE_KEY, Active.all)
    end
  end

end
