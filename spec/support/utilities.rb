include ApplicationHelper
require 'spec_helper'

def valid_signup
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        "user@example.com"
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

def display_profile_page(user)
	should have_link('Profile',     href: user_path(user))
	should have_content(user.name)
  	should have_title(user.name)
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
     expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
	expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end


