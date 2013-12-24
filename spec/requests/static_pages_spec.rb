require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    it { should have_content('Alpha Kappa Psi') }
    it { should have_title("UC Berkeley Alpha Kappa Psi") }
    it { should_not have_title('| Home') }
  end


  describe "About page" do
    before { visit about_path }
    it { should have_content('About') }
    it { should have_title("UC Berkeley Alpha Kappa Psi | About Us") }
  end

end
