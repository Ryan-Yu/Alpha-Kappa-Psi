require 'spec_helper'

describe "interview_slots/new" do
  before(:each) do
    assign(:interview_slot, stub_model(InterviewSlot).as_new_record)
  end

  it "renders new interview_slot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interview_slots_path, "post" do
    end
  end
end
