When(/^I click on the more information link under standards$/) do
  click_on("skills: more information")
end

Then(/^I should see more information about standards$/) do
  page.should have_content 'users will no longer be able to choose skills'
end

When(/^I click on the hide details link$/) do
  click_on("skills: hide details")
end

Then(/^I should not see the extra information about standards$/) do
  page.should_not have_content 'users will no longer be able to choose skills'
end

When(/^I select common core$/) do
  select "Common Core", from: 'standards_select'
end

Then(/^I should see the confirm or cancel standards change pop up$/) do
  page.should have_content 'When you confirm, an email will be sent'
end

When(/^I click to cancel the standards change$/) do
  click_on('skills: cancel choose standards')
end

Then(/^I should not see the confirm or cancel standards change pop up$/) do
  page.should_not have_content 'When you confirm, an email will be sent'
end

When(/^I click on the (.+) skills tab$/) do |subject|
  click_on('skills: ' + subject + ' tab')
end

Then(/^my current (.+) standards should be (.*)$/) do |subject, expected_standards|
  expect(current_standards(subject).upcase).to eq expected_standards.upcase
end

When(/^I change the (.+) standards for my school to (.*)$/) do |subject, standards|
  change_standards(subject, format_standards_string[standards])
end

Given(/^I have (.*) standards set to (.*)$/) do |subject, standards|
  change_standards(subject, format_standards_string[standards])
end

Given(/^I am using common core maths standards$/) do
  change_standards('maths', 'Common Core') unless current_standards('maths') == 'Common Core'
end
