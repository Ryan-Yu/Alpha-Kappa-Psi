require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do

  	it "should have the content 'Alpha Kappa Psi'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Alpha Kappa Psi')
  	end
  	it "should have the title 'Home'" do
  		visit '/static_pages/home'
  		expect(page).to have_title("UC Berkeley Alpha Kappa Psi")
  	end
  	it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end



  describe "About page" do

  	it "should have the content 'About'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About')
  	end
  	it "should have the title 'About Us'" do
  		visit '/static_pages/about'
  		expect(page).to have_title("UC Berkeley Alpha Kappa Psi | About Us")
  	end

  end

end
