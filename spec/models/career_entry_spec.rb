require 'spec_helper'

describe CareerEntry do
  
	before { @careerentry = CareerEntry.new(name: "Ryan Yu", company: "Amazon.com", 
		group: "Outbound Fulfillment Planning", year: 2013, fullintern: "Internship",
		location: "San Francisco, CA", job_category: "Technology" ) }

	subject { @careerentry }

	it { should respond_to(:name) }
	it { should respond_to(:company) }
	it { should respond_to(:group) }
	it { should respond_to(:year) }
	it { should respond_to(:fullintern) }
	it { should respond_to(:location) }
	it { should respond_to(:job_category) }

	it { should be_valid }

	describe "when name is not present" do
	    before { @careerentry.name = " " }
	    it { should_not be_valid }
	end
	describe "when company is not present" do
	    before { @careerentry.company = " " }
	    it { should_not be_valid }
	end
	describe "when year is not present" do
	    before { @careerentry.year = nil }
	    it { should_not be_valid }
	end
	describe "when full or intern is not present" do
	    before { @careerentry.fullintern = " " }
	    it { should_not be_valid }
	end
	describe "when location is not present" do
	    before { @careerentry.location = " " }
	    it { should_not be_valid }
	end
	describe "when job category is not present" do
	    before { @careerentry.job_category = " " }
	    it { should_not be_valid }
	end

	describe "when year is only 3 numbers" do
	    before { @careerentry.year = 900 }
	    it { should_not be_valid }
	end
	describe "when year is 5 numbers" do
	    before { @careerentry.year = 20130 }
	    it { should_not be_valid }
	end
	describe "when full_or_intern is not valid" do
	    before { @careerentry.fullintern = "Internships" }
	    it { should_not be_valid }
	end
	describe "when full_or_intern is not valid (2)" do
	    before { @careerentry.fullintern = "Internshi" }
	    it { should_not be_valid }
	end
	describe "when full_or_intern is not valid (3)" do
	    before { @careerentry.fullintern = "Full-times" }
	    it { should_not be_valid }
	end
	describe "when full_or_intern is not valid (4)" do
	    before { @careerentry.fullintern = "Full-tim" }
	    it { should_not be_valid }
	end
	describe "when full_or_intern is not valid (5)" do
	    before { @careerentry.fullintern = "Part-time" }
	    it { should_not be_valid }
	end


end
