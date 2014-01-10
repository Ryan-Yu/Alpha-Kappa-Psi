class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def careers
    @careerentries = CareerEntry.order(:year => :desc, :fullintern => :asc, :job_category => :asc)
  end

  def contact
  end

  def consulting
  end

  def corporate
  end

  def rush
    @rushevents = RushEvent.order(:event_time => :asc)
  end

  def classes
    @pledgeclasses = PledgeClassEntry.order(:year => :desc, :semester => :asc)
  end
  
end
