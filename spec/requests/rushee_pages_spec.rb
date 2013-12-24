require 'spec_helper'

describe "RusheePages" do
  
  subject { page }

  describe "profile page" do
  	let(:rushee) { FactoryGirl.create(:rushee) }
  	before { visit rushee_path(rushee) }
  	it { should have_content(rushee.name) }
  end

  

end
