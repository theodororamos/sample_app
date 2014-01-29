require 'spec_helper'

	RSpec.configure do |config|
	  config.include Rails.application.routes.url_helpers
	end

	describe "User Pages > " do

		subject { page } 

		describe "Signup Page > " do
			before { visit signup_path}

			it { should have_content("Sign Up")}
			it { should have_title(full_title("Sign Up"))}
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

