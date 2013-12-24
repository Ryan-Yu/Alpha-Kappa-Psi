require 'spec_helper'

describe Rushee do
  
  before { @rushee = Rushee.new(name: "John Doe", email: "johndoe@gmail.com", major: "Business", grade: "Sophomore") }

  subject { @rushee }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:major) }
  it { should respond_to(:grade) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @rushee.name = " " }
  	it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @rushee.email = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @rushee.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @rushee.email = invalid_address
        expect(@rushee).not_to be_valid
      end
    end
  end
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @rushee.email = valid_address
        expect(@rushee).to be_valid
      end
    end
  end
  describe "when email address is already taken" do
    before do
      rushee_with_same_email = @rushee.dup
      rushee_with_same_email.email = @rushee.email.upcase
      rushee_with_same_email.save
    end
    it { should_not be_valid }
  end


end
