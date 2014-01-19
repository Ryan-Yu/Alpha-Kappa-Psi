class CareerEntry < ActiveRecord::Base
    CAREER_TYPES = ["Internship", "Full-time"]

	before_save { self.fullintern = fullintern.capitalize }
	before_save { self.job_category = job_category.strip }

	validates :name, presence: true
	validates :company, presence: true
	validates :year, presence: true, length: {is: 4}
	validates :fullintern, presence: true
	validates :location, presence: true
	validates :job_category, presence: true

	# full_or_intern attribute must be "Internship" or "Full-time"
	validates_inclusion_of :fullintern, :in => CAREER_TYPES

    belongs_to :active

end
