When(/^I click to add a student to the current class$/) do
  click_on "students: add student"
end

Then(/^I can see the add student menu$/) do
  # check several expected lines of text from the pop-up
  page.should have_content 'Add student'
  page.should have_content 'Class membership'
  page.should have_content 'Cancel'
end

Then(/^I should be able to close the add student menu$/) do
  click_on "students: add student pop-up close"
  # these aren't ideal tests, but they work for now
  page.should_not have_content 'Add student'
  page.should_not have_content 'Class membership'
end

When(/^I try to add a student with a blank first name$/) do
  fill_in 'user_last_name', with: 'Davis'
  # click the class name to add the new student to Class A
  find('label', text: 'Class A').click
  click_on "students: submit student"
end

Then(/^the add student menu should still be there$/) do
  # simply calls the step above to confirm menu is there
  step "I can see the add student menu"
end

Then(/^the invalid first name error message should show$/) do
  page.should have_content("First name must be at least two characters")
end

Then(/^a student should not be added$/) do
  visit_page('student list')
  page.should_not have_content('Davis')
end

When(/^I try to add a student with valid details but I do not choose a class$/) do
  fill_in 'user_first_name', with: 'Jane'
  fill_in 'user_last_name', with: 'Davis'
  click_on "students: submit student"
end

Then(/^the created student should not belong to any class$/) do
  select("no class", from: 'class_selector')
  page.should have_content('Jane')
  # Remove the created student
  remove_all_students_from_class("no class")
end
