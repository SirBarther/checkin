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

		user = FactoryGirl.create(:student)
		location = FactoryGirl.create(:location, name: "Boston")

		visit root_path

	  expect(page).to have_content "Boston"

	  click_on "Boston"

	  fill_in "Tag Number", with: user.tag

	  click_on "Check In"

	  expect(page).to have_content "You have checked in"
			
		end

		scenario "User enters invalid Tag ID" do

		location = FactoryGirl.create(:location, name: "Boston")
		student = FactoryGirl.create(:student)

		visit root_path

		click_on "Boston"

		fill_in "Tag Number", with: "99999999"

		click_on "Check In"

		expect(page).to have_content "The provided ID doesn't exist or is blank. Please register"

		expect(page).to have_content "Please sign in"

		end
	end
