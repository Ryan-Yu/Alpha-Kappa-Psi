require "spec_helper"

describe InterviewSlotsController do
  describe "routing" do

    it "routes to #index" do
      get("/interview_slots").should route_to("interview_slots#index")
    end

    it "routes to #new" do
      get("/interview_slots/new").should route_to("interview_slots#new")
    end

    it "routes to #show" do
      get("/interview_slots/1").should route_to("interview_slots#show", :id => "1")
    end

    it "routes to #edit" do
      get("/interview_slots/1/edit").should route_to("interview_slots#edit", :id => "1")
    end

    it "routes to #create" do
      post("/interview_slots").should route_to("interview_slots#create")
    end

    it "routes to #update" do
      put("/interview_slots/1").should route_to("interview_slots#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/interview_slots/1").should route_to("interview_slots#destroy", :id => "1")
    end

  end
end
