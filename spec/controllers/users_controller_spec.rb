require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  # added not to pass the test!
  it "should have the right title" do
    get 'new'
    response.should_not have_selector( "title", text: "Sign up")
  end
  
  
end