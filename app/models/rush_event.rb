class RushEvent < ActiveRecord::Base

	validates :event_name, presence: true
	validates :event_description, presence: true
	validates :event_time, presence: true
	validates :semester, presence: true
	validates :location, presence: true

end
