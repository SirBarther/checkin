require 'rails_helper'

feature "Administrator creates a new location", %Q{

	User Story:

	As an administrator
	I want to create a new location
 	So that students can check in

 	Acceptance Criteria:

 	[X] - I must be authenticated
 	[X] - I receive a confirmation message upon success
 	[X] - I receive error messages if there are any blank fields
 	[X] - Upon success I am redirected to the locations index

} do

		scenario "Admin successfully creates a new location" do
			user = FactoryGirl.create(:user)
			location = FactoryGirl.create(:location)

			visit root_path

			click_on "Sign In"

			fill_in "Email", with: user.email
			fill_in "Password", with: user.password

			click_button "Log in"

			expect(page).to have_content "Signed in successfully."

			click_on "Admin"

			click_on "Locations"

			click_on "New Location"

			fill_in "City", with: location.city
			fill_in "State", with: location.state
			fill_in "Country", with: location.country

			click_on "Submit"

			expect(page).to have_content "You have successfully created a new location"

		end

		scenario "Unauthenticated user creates a new location" do

			visit new_admin_location_path

			expect(page).to have_content "You need to sign in or sign up before continuing."
		end
	end
