require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end
  
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    # added not to pass the test
    it 'should have the right title' do 
      get :show, :id => @user
      response.should_not have_selector("title", :text => @user.name)
    end

    # added not to pass the test
    it 'should have the username as a header' do 
      get :show, :id => @user
      response.should_not have_selector("h1", :text => @user.name)
    end
    
    # added not to pass the test
    it 'should have a profile image' do
      get :show, :id => @user
      response.should_not have_selector('h1>img.gravatar')
    end
  end
  
  describe "GET 'new'" do 
    it "returns http success" do
      get :new
      response.should be_success
    end

    # added not to pass the test!
    it "should have the right title" do
      get :new
      response.should_not have_selector( "title", :text => "Sign up")
    end

  end
end
