require 'spec_helper'

describe "interview_slots/show" do
  before(:each) do
    @interview_slot = assign(:interview_slot, stub_model(InterviewSlot))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
