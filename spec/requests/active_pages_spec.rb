require 'spec_helper'

describe "Active pages" do

  subject { page }

  describe "profile page" do
    let(:active) { FactoryGirl.create(:active) }
    before { visit active_path(active) }

    it { should have_content(active.name) }
    it { should have_title(active.name) }
  end

end