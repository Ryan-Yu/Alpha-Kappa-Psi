require 'spec_helper'

describe Active do
  
  before { @active = Active.new(name: "Ryan Yu", email: "ryan.cao.you@gmail.com", password: "foobar") }

  subject { @active }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }

  describe "when name is not present" do
    before { @active.name = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @active.email = " " }
    it { should_not be_valid }
  end
  describe "when password is too short" do
    before { @active.password = "fooba" }
    it { should_not be_valid }
  end
  describe "when password and confirmation do not match" do
    before { @active.password_confirmation = "foobar1" }
    it { should_not be_valid }
  end
  describe "when password and confirmation do match" do
    before { @active.password_confirmation = "foobar" }
    it { should be_valid }
  end
  describe "when name is too long" do
    before { @active.name = "a" * 51 }
    it { should_not be_valid }
  end




end
