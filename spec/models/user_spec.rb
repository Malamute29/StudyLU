require 'spec_helper'

describe User do
 
  
  before(:each) do
    @attr= { :username => "Example User", :email => "user@example.com"}
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a username" do
    no_name_user =User.new(@attr.merge(:username => "" ))
    no_name_user.should_not be_valid
  end


  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    #might not be working
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
  end
  
end 

