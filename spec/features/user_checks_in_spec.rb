require "rails_helper"

feature "user checks in", %{

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

	context "authenticated user" do
    before(:each) do
    	
			visit root_path

		  click_on "Sign In"

		  fill_in "Login", with: "boston@boston.com"
		  fill_in "Password", with: "Test1234"
		  click_on "Log in"

		end
		
		visit root_path

	  expect(page).to have_content "Boston"

	  fill_in "Check In", with: "12345678"

	  expect(page).to have_content "signed in successfully"
	end
end
