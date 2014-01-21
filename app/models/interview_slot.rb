class InterviewSlot < ActiveRecord::Base

  validates :start_time, :end_time, presence: true

  belongs_to :rushee

end
