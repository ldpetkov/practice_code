When(/^I choose to create or join a school$/) do
  click_on "school creation: create or join school"
end

When(/^I go to the (.*)$/) do |page|
  visit_page(page)
end

When(/^I search the UK for the Sumdog office postcode$/) do
  select 'United Kingdom', from: 'organisation_country_code'
  fill_in 'organisation_postcode', with: 'EH2 4PF'
  click_on "school creation: submit search"
end

When(/^I search for a UK postcode which returns no results$/) do
  select 'United Kingdom', from: 'organisation_country_code'
  fill_in 'organisation_postcode', with: 'XX0 0QQ'
  click_on "school creation: submit search"
end

When(/^I search for crocodile school with the UK Sumdog office address$/) do
  select 'United Kingdom', from: 'organisation_country_code'
  fill_in 'organisation_postcode', with: 'EH2 4PF'
  fill_in 'organisation_name', with: 'Crocodile'
  fill_in 'organisation_address', with: 'Queensferry Street Lane'
  click_on "school creation: submit search"
end

When(/^I search for a school that does not exist$/) do
  select 'United Kingdom', from: 'organisation_country_code'
  fill_in 'organisation_postcode', with: 'MOO123'
  fill_in 'organisation_name', with: 'Flergghhh'
  fill_in 'organisation_address', with: '101 Dairy Farm Avenue'
  click_on "school creation: submit search"
end

When(/^I search for some terms which provide no results$/) do
  fill_in_unique_timestamped_address
  click_on "school creation: submit search"
end

When(/^I do not enter any additional information on the advanced search page$/) do
  click_on "school creation: submit search"
end

When(/^I submit the form with a zip code containing letters$/) do
  select 'United States', from: 'organisation_country_code'
  fill_in 'organisation_postcode', with: 'l33t'
  click_on "school creation: submit search"
end

When(/^I set up a new school with all of the required information$/) do
  click_on "school creation: create new school"
  select 'Scotland', from: 'organisation_organisation_first_level_region_attributes_region_id'
  click_on "school creation: submit search"
end

When(/^I try to set up a new school without entering a home nation$/) do
  click_on "school creation: create new school"
  click_on "school creation: submit search"
end

Then(/^I should be in a school$/) do
  click_on "account menu"
  page.should_not have_content('Create or join your school')
end

Then(/^I should be asked to fill in required fields$/) do
  page.should have_content('Please fill in all the required fields and try again')
end

Then(/^I should be asked to enter a home nation$/) do
  page.should have_content('Please choose your Home Nation')
end

Then(/^I should be warned to only enter numbers$/) do
  page.should have_content('only enter numbers')
end

Then(/^I should see some results$/) do
  page.should have_content('Is this your school?')
end
