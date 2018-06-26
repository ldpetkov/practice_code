When(/^I create a new class$/) do
  while page.has_selector?(:xpath, '//*[text()="First Class"]')
    delete_class('First Class')
  end
  
  while page.has_selector?(:xpath, '//*[text()="Second Class"]')
    delete_class('Second Class')
  end

  click_on("classes: new class")
  fill_in 'student_group[name]', with: 'First Class'
  find(:xpath, '//*[@id="student_group_grade"]/option[2]').select_option
  click_on("classes: add new class")
end

Then(/^there should be a new class in my school$/) do
  page.should have_content('First Class')
end

Then(/^I should be assigned to the newly created class$/) do
  expect(find(:xpath, '//tr/td/a[text()="First Class"]/../../td/span[text()="Sanity Teacher"]')).not_to eq nil
end

When(/^I click on the edit classes button$/) do
  click_on("classes: edit classes")
end

When(/^I edit the details of one of my classes$/) do
  find(:xpath, '//*[@value="First Class"]').set("Second Class")
  click_on("edit classes: save changes")
end

Then(/^the details of that class should be changed$/) do
  page.should have_content("Second Class")
end

When(/^I delete a class$/) do
  delete_class('Second Class')
end

Then(/^the class should be removed from my school$/) do
  page.should_not have_content('Second Class')
end

When(/^I click on the new class button$/) do
  click_on("classes: new class")
end

Then(/^I should see the new class pop up$/) do
  page.should have_content('If you would like to add a new class to your school, please choose a name and year below then click "Add New Class".')
end

When(/^I click cancel$/) do
  fill_in 'student_group[name]', with: 'First Class'
  find(:xpath, '//*[@id="student_group_grade"]/option[2]').select_option
  click_on("classes: cancel new class")
end

Then(/^I should no longer see the new class pop up$/) do
  page.should_not have_content('If you would like to add a new class to your school, please choose a name and year below then click "Add New Class".')
end

Then(/^no school should be created$/) do
  page.should_not have_content("First Class")
end
