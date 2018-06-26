When(/^I click to go to activities$/) do
  click_link('Activities')
end

When(/^I click on the (.*) activities tab$/) do |subject|
  find('.tab', text: subject.capitalize).click
end

Then(/^I should be notified that I need a subscription$/) do
  expect(page).to have_text('To use Sumdog Reading, your students need to be covered by a subscription.')
end

When(/^I set up a new (competition|challenge)$/) do |activity_type|
  create_activity(activity_type)
end

Then(/^my (?:competition|challenge) should be a current activity$/) do
  current_activities_table = find('#current_activities')
  expect(current_activities_table).to have_text(TeacherActivitiesWorld::RANDOM_NAME)
  delete_activity(TeacherActivitiesWorld::RANDOM_NAME)
end

Given(/^I have a current activity$/) do
  create_activity('challenge')
end

When(/^I make changes to an activity$/) do
  edit_challenge(TeacherActivitiesWorld::RANDOM_NAME)
end

Then(/^I should see the activity changes I have made$/) do
  table_row = find('table > tbody > tr', text: TeacherActivitiesWorld::RANDOM_NAME)
  expect(table_row).to have_content('Jan 2001')
end

When(/^I delete the activity$/) do
  delete_activity(TeacherActivitiesWorld::RANDOM_NAME)
end

Then(/^I should no longer see the activity$/) do
  current_activities_table = find('#current_activities')
  expect(current_activities_table).to_not have_text(TeacherActivitiesWorld::RANDOM_NAME)
end

Given(/^I have some students who have played some games in an activity$/)do
  visit_page('maths activities')
  create_activity('challenge')
  in_session('student') do
    p current_window
    sign_in('student', 'in a school with a subscription')
    step "Talent Show is selected"
    step "I start the game"
    step "the Talent Show game should start"
    step "I lose the game"
  end
end

When(/^I click to view the activity$/) do
    click_link (TeacherActivitiesWorld::RANDOM_NAME)
end

Then(/^I should see activity information and statistics$/) do
  leaderboard = find('.leaderboard')
  expect(leaderboard).to have_text('Student One')
  visit_page('maths activities')
  delete_activity(TeacherActivitiesWorld::RANDOM_NAME)
end

# ----------------------

# Below I have omitted the skills steps for now as the skill selection will get an overhaul soon
#
# And(/^I restrict a student's skills for the activity$/) do
#   restrict_skills_challenge(TeacherActivitiesWorld::RANDOM_NAME)
# end
#
# Then(/^I should see the changes in the skills table$/) do
# end

# Then(/^the student should be able to see that their skills are restricted in the
#  hangout$/) do
#   pending # express the regexp above with the code you wish you had
# end

Given(/^I have a maths activity which has ended$/) do
  visit_page('maths activities')
  create_activity('challenge')
  make_challenge_past(TeacherActivitiesWorld::RANDOM_NAME)
end

Then(/^I should see it listed under past activities$/) do
  past_activities_section = find('#past_activities')
  expect(past_activities_section).to have_text(TeacherActivitiesWorld::RANDOM_NAME)
end

Then(/^I can view an old activity$/) do
  past_activity_table_row = find('table > tbody > tr', text: TeacherActivitiesWorld::RANDOM_NAME)
  within(past_activity_table_row) do
    find('a', text: 'view').click
  end
  expect(page).to have_text('Good luck in this challenge')
  visit_page('maths activities')
  within(past_activity_table_row) do
    find('a', text: 'delete').click
  end
end

