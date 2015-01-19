require 'rails_helper'

feature "Administrator edits a Student", %Q{

	User Story:

	As an Administrator
	I want to edit a student
	So that my records are up to date

 	Acceptance Criteria:

 	[] - I can view and search for students
 	[] - I can edit the record
 	[] - I am presented with a confirmation message upon success
 	[] - I am presented with errors if there are failures

} do

    scenario "Admin edits a student" do

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

    fill_in "First Name", with: "FirstChange"

    fill_in "Last Name", with: "LastChange"

    click_button "Submit"

    expect(page).to have_content "FirstChange"
    expect(page).to have_content "Student updated"

    end

    scenario "Non-Admin tries to edit a user" do

    visit admin_students_path

    expect(page).to have_content "You need to sign in or sign up before continuing"

    end

end
