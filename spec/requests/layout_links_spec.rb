require 'spec_helper'

describe "LayoutLinks" do
  it "should have a homepage at '/'" do 
    get '/'
    response.should have_selector('title', text: "Home")
  end
  
  it "should have a contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', text: "Contact")
  end
  
  it "should have an about page at '/about'" do 
    get '/about'
    response.should have_selector('title', text: "About Us")
  end
  
  it "should have a help page at '/help'" do
    get '/help'
    response.should have_selector('title', text: "Help")
  end
  
end
