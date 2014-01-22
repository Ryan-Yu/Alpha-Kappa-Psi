require 'spec_helper'

describe "interview_slots/index" do
  before(:each) do
    assign(:interview_slots, [
      stub_model(InterviewSlot),
      stub_model(InterviewSlot)
    ])
  end

  it "renders a list of interview_slots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
