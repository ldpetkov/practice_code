When(/^I click on the contests link$/) do
  click_on("teacher header: contests")
end

Then(/^I should be asked to choose my neighbourhood$/) do
  page.should have_content 'please complete the location details'
end

When(/^I click on the entries link for a contest$/) do 
  click_on("contests: entries")
end

When(/^I try to enter a contest$/) do
  click_on("contests: enter")
end

When(/^I choose to enter class A$/) do
  #find(:xpath, "(//*[@id="team_ids_"])").click
  check('team_ids[]')
  find(:xpath, '//*[@id="teacher_contest_entry"]/div/form/div[2]/div[2]/input').click
end

Then(/^class A should be entered into the contest$/) do
  page.should have_content '1 entered'
end

When(/^I begin to leave the contest but cancel$/) do
  click_on("contests: enter")
  #find(:xpath, "(//*[@id="team_ids_"])").click
  uncheck('team_ids[]')
  find(:xpath, '//*[@id="teacher_contest_entry"]/div/form/div[2]/div[2]/a').click
end


Then(/^class A should still be participating in the contest$/) do
  page.should have_content '1 entered'
end

When(/^I leave the contest$/) do
  click_on("contests: enter")
  uncheck('team_ids[]')
  find(:xpath, '//*[@id="teacher_contest_entry"]/div/form/div[2]/div[2]/input').click
end

Then (/^I should no longer be in the contest$/) do
  page.should_not have_content '1 entered'
end

Then (/^I should be able to reenter the contest on the contests page$/) do
  find(:xpath, '//*[@id="content"]/div[3]/div/table/tbody/tr[2]/td[3]/a').text.should eq "Enter"
end 



  
  


  