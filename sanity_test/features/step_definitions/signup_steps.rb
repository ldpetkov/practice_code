When(/^I manually navigate to the (parent|teacher) sign up page$/) do |user_type|
  sign_out
  visit_page 'homepage'
  find("a", :text => "Sign up").click()
  find("h2", :text => "#{user_type}s".capitalize).click()
end

Given(/^I have successfully signed up as a (parent|teacher)$/) do |user_type|
  sign_out
  sign_up_and_confirm_email user_type
end

When(/^I try to sign up to be a (parent|teacher) with (\w+) (\w+)$/) do |user, first_name, surname|
  complete_sign_up_form_with_names(user, Time.now.to_i, first_name,surname)
end

When(/^I try to sign up as a (parent|teacher) with (valid|invalid) details$/) do |user, validity|
  complete_sign_up_form(user, Time.now.to_i, validity,nil)
end

When(/^I try to sign up as a (parent|teacher) with (valid|invalid) details (\w+)$/) do |user, validity, name|
  complete_sign_up_form(user, Time.now.to_i, validity,name)
end


When(/^I try to sign up as a (parent|teacher) without accepting terms of use$/) do |user_type|
  fill_in_sign_up_form(user_type, :valid, Time.now.to_i)
  find("a", :text => "Sign up").click()
end

When(/^I should see the appropriate sign up validation errors$/) do
  page.should have_content("Passwords don't match")
  page.should have_content('Please enter a valid email')
end

When(/^I should not be able to click sign up$/) do
  find("a", :text => "Sign up").click
  page.should have_content("Sign up") ## Clicking on the sign up button should do nothing.
end

When(/^I click the Sumdog icon$/) do
  click_on "dashboard: sumdog logo"
end

Then(/^I should see confirm your email in the heading$/) do
  page.should have_content('Confirm your email')
end
