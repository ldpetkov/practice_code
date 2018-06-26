Then(/^I should see a button to reset live data$/) do
  page.should have_content "Reset live data"
end


Then(/^I click on the (news feed|choose subject|data settings) option$/) do | option|
  find(".panel", :text =>option.capitalize).click()
  sleep 2
end


When(/^I click on the live data heading$/) do
  find('[title="Change data settings or reset live data"]').click()
end

Then(/^I should be able to change the subject to (\w+)$/) do |subject|
  find(".subject-name", :text=>subject.capitalize).click
  find("a", :text=>"Done").click
end

Then(/^the table will show the live data for (\w+)$/) do |expected_subject|
  page.should have_content expected_subject
  
end

Then(/^I should be able to restrict the subjects that students can use$/) do
  puts "lets hope we are within school hours...!"
  change_subject("maths", true)
end


Given(/^I have started recording a live session$/) do
  click_on_panel("class controls")
  find(".panel", :text =>"News feed").click()
end

When(/^a student finishes a game$/) do
  in_session "student" do
    sign_in("student", "scoped username")
    start_game('Talent Show')
    play_game('talentshow_question_box') # repeatedly click on an answer box until game ends
    # sleep(80)
    leave_endscreen

    find(".scene-input").click()
   
  end
end

Then(/^their progress will be shown on the news feed$/) do
  in_session do
    click_on_panel("sumdog")
    click_on_panel("class controls")
    find(".panel", :text =>"News feed").click()
    page.should_not have_content "Nothing has happened yet. Ask your students to play!"
  end
end
