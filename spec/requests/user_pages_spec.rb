require 'spec_helper'

describe "User Pages > " do

	subject { page } 

  describe "Signup > " do
    before { visit signup_path }
 	  let(:submit) { "Create my account" }

    describe "with invalid information > " do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      it "should display error messages" do
      	   click_button submit
      		 should have_content("Name can't be blank")
      		 should have_content("Email can't be blank")
      		 should have_content("Email is invalid") 
      		 should have_content("Password can't be blank")
      		 should have_content("Password is too short (minimum is 6 characters)")
      end
    end

    describe "with valid information > " do
      before { @email = valid_signup  }
        
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      it "should go to profile page" do
        click_button submit
        user = User.find_by(email: @email)

        display_profile_page(user)
        should have_success_message 'Welcome'
        should have_link 'Sign out'
      end
    end

  end

	describe "Profile > " do
    before { visit user_path(user) }
		let(:user) { FactoryGirl.create(:user) }
  	
    it "should display the correct page" do display_profile_page(user) end
	end


end


