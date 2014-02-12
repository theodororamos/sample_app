# require 'spec_helper'

# describe "Static Pages > " do
# 	subject { page }

# 	describe "Pages > " do
# 		before { 	params = { home: { content: "Sample App", page_title: "", path: '/static_pages/home'},
# 		  					   help: { content: "Help", page_title: "Help", path: '/static_pages/help'}
# 						     }
# 					@pages = Hash.new ( params.keys )
# 			   }
# 		for current_page in 0...@pages.length
# 			it { visit params[pages[current_page]][:path] }
# 			it { should have_selector('h3', text: params[pages[current_page]][:content]) }
# 		end

# 	end
# end

	# describe "Page Content => " do
	# 		{ home:    "Sample App", 
	# 		  help:    "Help", 
	# 		  about:   "About Us", 
	# 		  contact: "Contact Us"
	# 		}.each do |my_page,content|
	# 	  it "#{my_page} should have the content #{content}" do
	# 	  	visit "/static_pages/#{my_page}"
	# 	  	expect(page).to have_content(content)
	# 	  end
	# 	end
	# end

	# describe "Page Title => " do
	# 		{ :home => "Home", 
	# 		  :help => "Help", 
	# 		  :about => "About", 
	# 		  :contact => "Contact"
	# 		}.each do |my_page,my_title|
	# 			let(:title) {"Ruby on Rails Tutorial Sample App | #{my_title}"}
	# 	  it "#{my_page} should have the title #{my_title}" do
	# 	  	visit "/static_pages/#{my_page}"
	# 	  	expect(page).to have_tilte(title)
	# 	  end
	# 	end
	# end