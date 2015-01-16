require 'rails_helper'

feature "Administrator deletes a student", %Q{

	User Story:

	As an administrator
	I want to delete a student
 	So that my records are accurate

 	Acceptance Criteria:

 	[X] - I must be authenticated to delete a student
 	[X] - I see a confirmation message upon success
 	[X] - I see error messages if there are failures

} do

		scenario "Admin deletes a student" do

		user = FactoryGirl.create(:user)
		student = FactoryGirl.create(:student)

		visit root_path

		click_on "Sign In"

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Log in"

		expect(page).to have_content "Signed in successfully."

		visit admin_students_path

		fill_in "search", with: student.f_name

		click_on "Search"

		click_on student.f_name

		click_button "Delete this student"

		expect(page).to have_content "Successfully deleted"

		end

		scenario "Unauthenticated user deletes a student" do

		visit admin_students_path

		expect(page).to have_content "You need to sign in or sign up before continuing."

		end

end
