#Then(/^I should be able to play Talent Show$/) do
#  in_session('student') do
#    start_game('Talent Show')
#    play_game('talentshow_question_box') # repeatedly click on an answer box until game ends
    # sleep(80)
#    leave_endscreen
#  end
#  in_session do
#    stop_live_class
#  end
#end

#Then(/^I should be able to play Junk Pile$/) do
#  click_on("play as guest")
  #quit_game
#  sleep(30)
  #leave_endscreen
#  ensure_on?('homepage')
#  end

# worried about vagueness of step name
# change if this causes issues
When(/^I click on the subject panel$/) do
  in_session('student') do
    click_on('hangout: subject chooser')
  end
end

Then(/^I should only be able to choose the reading subject$/) do
  in_session('student') do
    page.should have_content('Reading')
    page.should_not have_content('Math')
  end
  in_session do
    stop_live_class
  end
end

When(/^the teacher changes the subject of the class to (.+)$/) do |subject|
  in_session do
    click_on("live class: change activity")
    page.should have_content('Edit')
    page.should have_content('Math Live class')
    select(subject, from:  'lesson_subject_id')
    click_on("live class: set up")
  end
end

When(/^the student refreshes the page$/) do
  in_session('student') do
    visit_page('hangout')
  end
end

Then(/^the student should be in a writing game lobby$/) do
  in_session('student') do
    page.should have_selector(:xpath, '//div/div/div/span[text()="Writing training"]')
  end
  in_session do
    stop_live_class
  end
end
