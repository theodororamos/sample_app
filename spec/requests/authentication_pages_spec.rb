require 'spec_helper'

describe "AuthenticationPages > " do
  
  subject { page }

  describe "Signin > " do

  	before { visit signin_path }

  	describe "with invalid information > " do
  		before { click_button "Sign In" }
	
	    it "should stay at same page with invalid message" do 
        should have_title("Sign In")
        should have_error_message('Invalid')
      end

      it "should not carry error message to other pages" do
        click_link "Home"
        should_not have_error_message('Invalid')
      end
	 end

	 describe "with valid information > " do
      before { valid_signin(user) }

      let(:user) { FactoryGirl.create(:user) }

      it { display_profile_page(user) }
      it { should_not have_link('Sign In', href: signin_path) }

      describe "fallowed by signout" do
        before { click_link 'Sign out' }
        it { should have_link 'Sign in' }
      end
    end

  end

end
