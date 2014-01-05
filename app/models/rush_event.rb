class RushEvent < ActiveRecord::Base

	validates :event_name, presence: true
	validates :event_description, presence: true
	validates :event_time, presence: true
	validates :semester, format: {with: /\A(Spring|Fall) \d{4}\z/}
	validates :location, presence: true

end
