class InterviewSlotGenerator
  # To change this template use File | Settings | File Templates.
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :date, :start_time, :end_time, :interval
  validates :date, :interval, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def self.generate_slots(interview_slot_gen)
    #Define Interval and start time
    interval = interview_slot_gen.interval.to_i.minutes
    inter_start = interview_slot_gen.start_time
    end_time = interview_slot_gen.end_time

    inter_end = inter_start + interval
    #Loop until the start time is the end time
    while inter_start < end_time
      #Create first Interview Slot
      InterviewSlot.create(start_time: inter_start, end_time: inter_end)
      inter_start += interval
      inter_end += interval
    end
  end

end