Given(/^I am on the (.*)$/) do |page_name|
  #visit_page(page_name)
  ensure_on?(page_name)
end

Then(/^I should(?: still)? be(?: back)? (?:on|taken to) the (.+)$/) do |page_name|
  should_be_on?(page_name)
end

When (/^I (should be able to )?select a single skill$/) do | i |
  click_on("city: skills browser")
  click_on("city: select a skill")
  click_on("city: close skill browser")
end

When (/^I navigate to the (.+)$/) do |page_name|
  navigate_to(page_name)
end

When (/^I enter the 'Try me' section$/) do
  click_on("try me")
end

When(/^I click on the (.*) (?:tab|panel)$/) do | name | 
  click_on_panel (name)
end

Then(/^I should see a (w+) panel$/) do |name|
   page.should have_content name
end
