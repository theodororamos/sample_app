require 'spec_helper'

describe "Static pages" do

  let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  let(:base_directory) {"/static_pages/"}


  describe "Home page" do
    let(:path) {"#{base_directory}home"}
    it "should have the content Sample App" do
      visit path
      expect(page).to have_content('Sample App')
    end
    it "shoul have the base title" do
      visit path
      expect(page).to have_title("#{base_title}")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do
    let(:path) {"#{base_directory}help"}
    it "should have the content 'Help'" do
      visit path
      expect(page).to have_content('Help')
    end
    it "shoul have the right title" do
      visit path
      expect(page).to have_title("#{base_title} | Help")
    end 
  end

  describe "About page" do
    let(:path) {"#{base_directory}about"}
  	it "should have the content 'About Us'" do 
  		visit path
  		expect(page).to have_content('About Us')
  	end
    it "shoul have the right title" do
      visit path
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact Page" do
    let(:path) {"#{base_directory}contact"}
    it "should have the content 'Contact Us'" do
      visit path
      expect(page).to have_content('Contact Us')
    end
    it "should have the title" do
      visit path
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end



# require 'spec_helper'

# describe "StaticPages" do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end
