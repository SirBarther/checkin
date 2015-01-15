require 'rails_helper'

feature 'user checks in', %Q{

	User Story:

	As a student
	I want to check in to a location
 	So that my attendance can be tracked

 	Acceptance Criteria:

 	[X] - The location must be selected
 	[X] - I must enter valid credentials
 	[X] - I must see confirmation and error messages respectively
 	[X] - The page is refreshed and I can see my attendance record
 	[X] - I can see other attenance records

} do

		scenario "Student checks in" do 

		user = FactoryGirl.create(:student)
		location = FactoryGirl.create(:location, name: "Boston")

		visit root_path

	  expect(page).to have_content "Boston"

	  click_on "Boston"

	  fill_in "Tag Number", with: user.tag

	  click_on "Check In"

	  expect(page).to have_content "You have checked in"
			
		end

		scenario "Student enters an invalid credential" do

		student = FactoryGirl.create(:student)
		location = FactoryGirl.create(:location, name: "Boston")

		visit root_path

		click_on "Boston"

		fill_in "Tag Number", with: "99999999"

		click_on "Check In"

		expect(page).to have_content "The provided ID doesn't exist or is blank. Please register"

		expect(page).to have_content "Please sign in"

		end
	end
