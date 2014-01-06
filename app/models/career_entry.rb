class CareerEntry < ActiveRecord::Base

	before_save { self.fullintern = fullintern.capitalize }

	validates :name, presence: true
	validates :company, presence: true
	validates :year, presence: true, length: {is: 4}
	validates :fullintern, presence: true
	validates :location, presence: true
	validates :job_category, presence: true

	# full_or_intern attribute must be "Internship" or "Full-time"
	validates_inclusion_of :fullintern, :in => ["Internship", "Full-time"]

end
