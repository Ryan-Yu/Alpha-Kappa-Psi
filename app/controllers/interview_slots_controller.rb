class InterviewSlotsController < ApplicationController
  before_action :authenticate_active!
  before_action :eboard_active, only: [:new, :create, :destroy]
  before_action :set_interview_slot, only: [:show, :edit, :update, :destroy]

  # GET /interview_slots
  def index
    @interview_slots = InterviewSlot.order(:start_time => :asc)
  end

  # GET /interview_slots/1
  def show
  end

  # GET /interview_slots/new
  def new
    @interview_slot_gen = InterviewSlotGenerator.new
  end

  # POST /interview_slots/new
  def generate
    start_time = parse_time(interview_slot_gen_params, true)
    end_time = parse_time(interview_slot_gen_params, false)
    interval = interview_slot_gen_params[:interval]
    @interview_slot_gen = InterviewSlotGenerator.new(date: start_time, start_time: start_time, end_time: end_time, interval: interval)

    if @interview_slot_gen.valid?
      InterviewSlotGenerator.generate_slots(@interview_slot_gen)
      flash['Interview Slots successfully generated']
      redirect_to interview_slots_path
    else
      render 'new'
    end
  end

  # Associate an interview slot with a rushee
  def associate
    matchingSlots = InterviewSlot.where(start_time: DateTime.parse(params[:selected_slot]))

    # Iterate through all of the interview slots that have the same start_time as the one the rushee specified
    for index in 0 ... matchingSlots.size

      # We've found an InterviewSlot that we can place our rushee in
      if matchingSlots[index].rushee_id.nil?
        # Set our interview slot's rushee_id attribute to the rushee that was passed through
        matchingSlots[index].rushee_id = params[:rusheeid]

        # We've found a slot, and are saving it
        if matchingSlots[index].save
          flash[:success] = "Successfully scheduled professional interview. Please log in again to create/edit your rush application."
          redirect_to rush_application_index_path
          return
        end
      end

      if index == matchingSlots.size - 1
        # There should be an empty interview slot but there isn't (error)
        flash[:error] = "There was a problem processing your interview request. Please contact VP Membership at rush@calakpsi.com."
        redirect_to rush_application_index_path
        return
      end

    end

  end



  # GET /interview_slots/1/edit
  def edit
  end

  # POST /interview_slots
  def create
    @interview_slot = InterviewSlot.new(interview_slot_params)

    if @interview_slot.save
      redirect_to @interview_slot, notice: 'Interview slot was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /interview_slots/1
  def update
    if @interview_slot.update(interview_slot_params)
      redirect_to @interview_slot, notice: 'Interview slot was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /interview_slots/1
  def destroy
    @interview_slot.destroy
    redirect_to interview_slots_url, notice: 'Interview slot was successfully destroyed.'
  end


  def rushee_id=(selected_id)
    @rushee_id = selected_id
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_slot
      @interview_slot = InterviewSlot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interview_slot_params
      params.require(:interview_slot).permit(:start_time, :end_time, :interview_type)

    end

    def interview_slot_gen_params
      params[:interview_slot_generator]
    end

    # Checks whether current active is a member of e-board
    def eboard_active
      if current_active.eboard.nil? || current_active.eboard.empty?
        flash[:error] = "Only actives that are on the executive board may create and delete interview slots."
        redirect_to(root_url)
      end
    end





  def parse_time(interview_time, start_time)
    if start_time
      DateTime.new(interview_time["date(1i)"].to_i,
                   interview_time["date(2i)"].to_i,
                   interview_time["date(3i)"].to_i,
                   interview_time["start_time(4i)"].to_i,
                   interview_time["start_time(5i)"].to_i)
    else
      DateTime.new(interview_time["date(1i)"].to_i,
                   interview_time["date(2i)"].to_i,
                   interview_time["date(3i)"].to_i,
                   interview_time["end_time(4i)"].to_i,
                   interview_time["end_time(5i)"].to_i)
    end
  rescue
    nil
  end
end
