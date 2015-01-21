require 'rails_helper'

feature "Administrator creates a Student", %Q{

  User Story:

  As an administrator
  I want to create a new location
  So that students can check in

  Acceptance Criteria:

  [X] - I must be authenticated
  [X] - I receive a confirmation message upon success
  [X] - I receive error messages if there are any blank fields
  [X] - Upon success I am redirected to the root index

} do

    scenario "Admin successfully edits a location" do
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

      click_link location.name

      click_link "Edit"

      fill_in "Name", with: "Test Name"
      fill_in "City", with: "Test City"
      fill_in "State", with: "Test State"
      fill_in "Country", with: "Test Country"

      click_on "Submit"

      expect(page).to have_content "Location updated"

      click_link "Test Name"

      expect(page).to have_content "Test City"
      expect(page).to have_content "Test State"
      expect(page).to have_content "Test Country"
    end

    scenario "Unauthenticated user edits a location" do

    visit admin_locations_path

    expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
