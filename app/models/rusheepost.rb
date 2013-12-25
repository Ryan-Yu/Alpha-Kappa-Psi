class Rusheepost < ActiveRecord::Base

	belongs_to :active
	belongs_to :rushee
	
	# Orders the microposts
	default_scope -> { order('created_at DESC') }

	# Posts must come from an active and be directed towards a rushee
	validates :active_id, presence: true
	validates :rushee_id, presence: true

	validates :content, presence: true, length: { maximum: 300 }

end
