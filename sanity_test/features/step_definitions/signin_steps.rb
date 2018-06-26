Given(/^I am signed in as a ([^\s]+)$/) do |account_type|
  sign_out
  sign_in(account_type, 'global username')
end

Given(/^(?!.*subscription)I am signed in as a teacher with a (.+)$/) do |condition|
  sign_out
  sign_in("teacher", "with a #{condition}")
end

Given(/^I am logged in as the sanity teacher$/) do
  sign_out
  sign_in("teacher", "sanity")
end

Given(/^I am signed in as a teacher without a school$/) do
  sign_up_and_confirm_email 'teacher'
end

Given(/^I am signed in as a teacher who is not in a contest$/) do
  sign_out
  sign_in('teacher', 'without a subscription')
end

Given(/^I am signed in as a teacher without a subscription$/) do
  sign_out
  sign_in('teacher', 'without a subscription')
end

Given(/^I am signed in as a teacher with(?: a school with)? a(?: current)? subscription$/) do
  sign_out
  sign_in('teacher', 'with a subscription')
end

Given(/^I am not signed in$/) do
  sign_out
end

When(/^I sign in on the (.*) as a (.*) using an? (.+)$/) do |page, user_type, user_login_type|
  sign_out
  visit_page(page)
  sign_in(user_type, user_login_type)
end

Then(/^I should be signed in$/) do
  # Necessary for synchronisation purposes if not clicking
  #sleep 0.25
  # Hardcoded for now, can be made to accept arguments if needed
  click_on "dashboard: sumdog logo"
  visit_page('homepage')
  shouldnt_be_on?('homepage')
end

Then(/^I should not be signed in$/) do
  sleep 0.25
  visit_page('homepage')
  should_be_on?('homepage')
end

# slightly worried about the vagueness of this step name
# look into storing and reusing user details if this becomes an issue
When(/^I ?(?:sign|am signed) in as a student who is in the class$/) do
  in_session('student') do
    sign_out
    sign_in('student', 'global username')
  end
end

When(/^I (?:sign|am signed) in as a student in (?:a school with a subscription|the subscribed school)$/) do
  in_session('student') do
    sign_out
    sign_in('student', 'in a school with a subscription')
  end
end

When(/^I sign in as a student who is in the reading class$/) do
  in_session('student') do
    sign_out
    sign_in('student', 'with a subscription')
  end
end

When(/^I sign in as a teacher using a global username$/) do
  sign_out
  sign_in('teacher', 'scoped username')
end
