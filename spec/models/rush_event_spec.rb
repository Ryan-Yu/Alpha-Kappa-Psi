require 'spec_helper'

describe RushEvent do
  
	before { @rushevent = RushEvent.new(event_name: "Meet the Chapter", event_description: "Meet the brothers.", 
		location: "Bancroft Hotel", semester: "Spring 2014", event_time: DateTime.now ) }

	subject { @rushevent }

	it { should respond_to(:event_name) }
	it { should respond_to(:event_description) }
	it { should respond_to(:event_time) }
	it { should respond_to(:semester) }
	it { should respond_to(:location) }

	describe "when event name is not present" do
		before { @rushevent.event_name = " " }
		it { should_not be_valid }
	end
	describe "when event description is not present" do
		before { @rushevent.event_description = " " }
		it { should_not be_valid }
	end
	describe "when event location is not present" do
		before { @rushevent.location = " " }
		it { should_not be_valid }
	end
	describe "when event semester is not present" do
		before { @rushevent.semester = " " }
		it { should_not be_valid }
	end
	describe "when event time is not present" do
		before { @rushevent.event_time = nil }
		it { should_not be_valid }
	end



end