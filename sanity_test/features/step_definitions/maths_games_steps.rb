# move to sign in steps
Given(/^I am signed in as a student who does not have a maths subscription$/) do
  sign_in('student', 'global username')
end

Given(/^(.*) is selected$/) do |expected_game|
  choose_game(expected_game) # navigate so the expected game is on the hangout
  assert_game_is_chosen(expected_game) # check I can see the game image for the expected game
end

When(/^I start the game$/) do
  # ensure that the window you are currently working in is brought to the front
  click_on("hangout: start game")
  sleep(5)
end

Then(/^the ?(.*?) game should start$/) do |expect_game|
  game_is_playing?(expect_game)
end

When(/^I lose the game$/) do
  play_game('talentshow_question_box')
end

When(/^the game finishes$/) do
  sleep(65)
end

Then(/^the endgame screen should display correctly$/) do
  page.should have_content('your score')
  page.should have_content('your best')
  page.should have_content('coins earned')
  page.should have_content('StudentO')
end

When(/^I advance to the hangout$/) do
  leave_endscreen
end

Then(/^(.+) should be selected$/) do |game|
  assert_game_is_chosen(game)
end

Given(/^I am playing against robots$/) do
  choose_opponent("Robot")
end

Then(/^I should be able to select one of the AI robots$/) do
  click_image('destroyer_bot')
end

Then(/^the AI should have finished$/) do
  page.should_not have_content('DNF')
end

When(/^I click on the arrows on the top right corner$/) do
  hover_image('game_menu')
  # sleep(1)
end

Then(/^the in\-game menu should come up$/) do
  image_exists?('drop-down')
end

Then(/^I should be able to quit the game$/) do
  click_image('game_exit')
  should_be_on?('hangout')
end
