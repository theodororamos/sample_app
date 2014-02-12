require 'spec_helper'


RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe "User Pages > " do

	subject { page } 

 	let(:submit) { "Create my account" }

    describe "with invalid information => " do
      before { visit signup_path }
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "should display error messages => " do
      	it { click_button submit
      		 should have_content("Name can't be blank")
      		 should have_content("Email can't be blank")
      		 should have_content("Email is invalid") 
      		 should have_content("Password can't be blank")
      		 should have_content("Password is too short (minimum is 6 characters)") }
      end
    end

    describe "with valid information" do
      before do
      	visit signup_path
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      it "should go to profile page" do
      	click_button submit
      	should have_title("Example User")
  	  end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com')}

        it{ should have_link 'Sign out' }
        it{ should have_title user.name}
        it{ should have_selector('div.alert.alert-success', text: 'Welcome')}

      end


    end

	describe "Profile Page" do
		let(:user) { FactoryGirl.create(:user) }
  		before { visit user_path(user)}

  		it {should have_content(user.name)}
  		it {should have_title(user.name)}
	end


end

# describe "UserPages" do
#   describe "GET /user_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get user_pages_index_path
#       response.status.should be(200)
#     end
#   end

