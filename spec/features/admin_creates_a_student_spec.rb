require 'rails_helper'

feature "Administrator creates a Student", %Q{

	User Story:

	As an administrator
	I want to create a new student
 	So that the student can have attendance recorded

 	Acceptance Criteria:

 	[X] - I must be able to create a new student
 	[X] - I must provide a valid tag number
 	[X] - If the tag number is invalid I am presented with errors
 	[X] - Upon success I am redirected to the locations index

} do
	context "Authenticated User" do
		before(:each) do
			user = FactoryGirl.create(:user)

			visit root_path

			click_on "Sign In"

			fill_in "Email", with: user.email
			fill_in "Password", with: user.password

			click_button "Log in"

			expect(page).to have_content "Signed in successfully."

		end

		scenario "Admin successfully creates a new student" do
			student = FactoryGirl.build(:student)

			visit root_path

			click_on "Admin"

			click_on "Create a new student"

			expect(page).to have_content "First Name"
			expect(page).to have_content "Last Name"
			expect(page).to have_content "Tag Number"

			fill_in "First Name", with: student.f_name
			fill_in "Last Name", with: student.l_name
			fill_in "Tag Number", with: student.tag

			click_button "Submit"

			expect(page).to have_content "A new student has been created"
		end


		scenario "Admin unsuccessfully creates a new user" do 
			student = FactoryGirl.build(:student)

			visit root_path

			click_on "Admin"

			click_on "Create a new student"

			expect(page).to have_content "First Name"
			expect(page).to have_content "Last Name"
			expect(page).to have_content "Tag Number"

			fill_in "First Name", with: "B"
			fill_in "Last Name", with: ""
			fill_in "Tag Number", with: "111111119"

			click_button "Submit"

			expect(page).to have_content "There was an error with your request"
		end
	end
end
