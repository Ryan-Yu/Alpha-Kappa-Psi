require 'spec_helper'

describe "interview_slots/edit" do
  before(:each) do
    @interview_slot = assign(:interview_slot, stub_model(InterviewSlot))
  end

  it "renders the edit interview_slot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", interview_slot_path(@interview_slot), "post" do
    end
  end
end
