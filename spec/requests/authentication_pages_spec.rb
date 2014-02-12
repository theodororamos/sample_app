require 'spec_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe "AuthenticationPages" do
  
  subject { page }

  describe "signin" do

  	before { visit signin_path }

  	describe "with invalid information" do
  		before { click_button "Sign In" }
	
	    it { should have_title("Sign In")} 
	    it { should have_error_message('Invalid')}

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_error_message('Invalid') }
      end
	 end

	 describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        valid_signin(user)
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }

      describe "fallowed by signou" do
        before { click_link 'Sign out' }
        it { should have_link 'Sign in' }
      end
    end

  end

end
