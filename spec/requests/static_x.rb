require 'spec_helper'

describe "Static Pages > " do
	subject { page }

	describe "Pages > " do
		# before { 	@pages = Hash.new
		# 			@pages = { home: { content: "Sample App", page_title: "", path: '/static_pages/home'},
		#   					   help: { content: "Help", page_title: "Help", path: '/static_pages/help'}
		# 				     } 
		# 	   }
		before { @root_path = root_path }
		{ home: { content: "Sample App", page_title: "", path: @root_path},
		   		  help: { content: "Help", page_title: "Help", path: '/static_pages/help'}
		 }.each do |my_page,params|
		 	puts params[:path]
			it { visit params[:path] }
			it { should have_selector('h3', text: params[:content]) }
		end

	end
end

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