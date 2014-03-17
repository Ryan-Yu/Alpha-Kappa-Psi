class Award < ActiveRecord::Base

	validates :year, presence: true
	validates :members, presence: true
	validates :desc, presence: true

end