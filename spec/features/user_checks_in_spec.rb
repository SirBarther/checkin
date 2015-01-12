require 'rails_helper'

feature 'user checks in', %Q{

	User Story:

	As a signed up user
	I want to check in to a location
 	So that I can track my attendance

 	Acceptance Criteria:

 	[] - The location account must be signed in
 	[] - I must see a confirmation message
 	[] - The page is refreshed and reflects my checkin
 	[] - I can see other recent checkins
 	[] - If there is an error I am asked to try again

} do

		scenario "User checks in" do 

		user = FactoryGirl.create(:user)
		location = FactoryGirl.create(:location, name: "Boston")

		visit root_path

	  click_on "Sign In"

	  fill_in "user_email", with: user.email
	  fill_in "user_password", with: user.password
	  click_on "Log in"

	  expect(page).to have_content "Boston"

	  click_on "Boston"

	  fill_in "Tag ID", with: "12345678"

	  click_on "Check In"

	  expect(page).to have_content "You have checked in"
			
		end

end
