require 'spec_helper'

describe "InterviewSlots" do
  describe "GET /interview_slots" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get interview_slots_path
      response.status.should be(200)
    end
  end
end
