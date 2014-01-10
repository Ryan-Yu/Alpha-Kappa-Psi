require 'spec_helper'

describe PledgeClassEntry do

	before { @pledgeclassentry = PledgeClassEntry.new(classname: "Alpha Epsilon", 
		semester: "Fall", year: 2012, members: "Bob Dylan; Trey Anastasio") }

	subject { @pledgeclassentry }

	it { should respond_to(:classname) }
	it { should respond_to(:semester) }
	it { should respond_to(:year) }
	it { should respond_to(:members) }


	describe "when semester is missing" do
		before { @pledgeclassentry.semester = " " }
		it { should_not be_valid }
	end
	describe "when semester is missing" do
		before { @pledgeclassentry.year = nil }
		it { should_not be_valid }
	end
	describe "when classname is missing" do
		before { @pledgeclassentry.classname = " " }
		it { should_not be_valid }
	end
	describe "when members are missing" do
		before { @pledgeclassentry.members = " " }
		it { should_not be_valid }
	end

	describe "when semester is winter" do
		before { @pledgeclassentry.semester = "Winter 2013" }
		it { should_not be_valid }
	end
	describe "when semester is summer" do
		before { @pledgeclassentry.semester = "Summer 2013" }
		it { should_not be_valid }
	end
	describe "when semester year is Fall" do
		before { @pledgeclassentry.semester = "Fall" }
		it { should be_valid }
	end
	describe "when semester year is Spring" do
		before { @pledgeclassentry.semester = "Spring" }
		it { should be_valid }
	end
	describe "when semester is missing" do
		before { @pledgeclassentry.semester = "2014" }
		it { should_not be_valid }
	end
	describe "when semester is 3 words" do
		before { @pledgeclassentry.semester = "Summer 2012 Fall" }
		it { should_not be_valid }
	end
	describe "when year is 5 numbers" do
		before { @pledgeclassentry.year = 20101 }
		it { should_not be_valid }
	end

end
