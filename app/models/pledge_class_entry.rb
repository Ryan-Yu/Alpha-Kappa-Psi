class PledgeClassEntry < ActiveRecord::Base

	before_save { self.classname = classname.titleize }

	SEMESTER_TYPES = ["Fall", "Spring"]

	validates :classname, presence: true
	validates :semester, presence: true
	validates :year, presence: true, length: {is: 4}
	validates :members, presence: true

	validates_inclusion_of :semester, :in => SEMESTER_TYPES

end
