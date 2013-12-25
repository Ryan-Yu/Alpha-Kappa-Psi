require 'spec_helper'

describe Rusheepost do
  
	let(:active) { FactoryGirl.create(:active) }
	let(:rushee) { FactoryGirl.create(:rushee) }

	before { @rusheepost = rushee.rusheeposts.build(content: "Lorem ipsum", active_id: active.id) }

	subject { @rusheepost }

	it { should respond_to(:content) }
	it { should respond_to(:active_id) }
	it { should respond_to(:rushee_id) }

	# Referring to the rusheepost's (foreign key) active and rushee
	its(:active) { should eq active }
	its(:rushee) { should eq rushee }

	it { should be_valid }

	describe "when active_id is not present" do
		before { @rusheepost.active_id = nil }
		it { should_not be_valid }
	end
	describe "when rushee_id is not present" do
		before { @rusheepost.rushee_id = nil }
		it { should_not be_valid }
	end
	describe "with blank content" do
		before { @rusheepost.content = " " }
		it { should_not be_valid }
	end
	describe "with content that is too long" do
		before { @rusheepost.content = "a" * 301 }
		it { should_not be_valid }
	end


end
