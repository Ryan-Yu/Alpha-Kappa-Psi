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

  describe "rusheepost associations" do

    before { @active.save }
    before { @rushee = Rushee.new(name: "Jane Doe", email: "janedoe@gmail.com", major: "Business", grade: "Sophomore") }
    before { @rushee.save }
    let!(:older_rusheepost) do
      FactoryGirl.create(:rusheepost, active: @active, rushee: @rushee, created_at: 1.day.ago)
    end
    let!(:newer_rusheepost) do
      FactoryGirl.create(:rusheepost, active: @active, rushee: @rushee, created_at: 1.hour.ago)
    end
    it "should have the right rusheeposts in the right order" do
      expect(@rushee.rusheeposts.to_a).to eq [newer_rusheepost, older_rusheepost]
    end
    it "should destroy associated microposts" do
      rusheeposts = @rushee.rusheeposts.to_a
      @rushee.destroy
      expect(rusheeposts).not_to be_empty
      rusheeposts.each do |rusheepost|
        expect(Rusheepost.where(id: rusheepost.id)).to be_empty
      end
    end
  end




end
