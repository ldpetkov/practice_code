# Sign in as a guest through the log in screen
When(/^I sign in as a guest$/) do
  # Go to the Sign in page
  visit_page("sign in")
  click_on_target("button", "Play as guest")
end

When(/^I check for the city top load$/) do
  # Progression takes time to load occasionally
  wait_for_progression()
  page.should have_css("span", :text => "WELCOME TO SUMDOG")
end