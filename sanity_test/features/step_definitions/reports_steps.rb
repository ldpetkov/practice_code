When (/^I create a teacher in a school without a subscription$/) do
  sign_up_and_confirm_email('teacher')
  join_sanity
  click_on("dashboard: sumdog logo")
  sleep(2)
  click_on("teacher header: reports")
  sleep(2)
  waste_reports ##workaround -- need to have 8 reports remaining to use the popup
end

When (/^I try to generate a report for a class but cancel on the free reports pop-up$/) do
  click_on("reports: update")
  click_button('Cancel')
end

Then (/^I should not see the report$/) do
  page.should have_content('Choose report and press')
end

When (/^I generate a report for a class and choose to use a free report$/) do
  click_on("reports: update")
  click_button('Show report')
end

Then (/^I should see the report$/) do
  sleep(5)
  page.should have_content("Student One")
end

When (/^I generate a report for the class$/) do
  click_on("reports: update")
end

Then (/^I should not see the free reports pop up$/) do
  page.should_not have_content("Show report")
end

When (/^I click on the bar chart button$/) do
  click_on("reports: bar chart")
end

Then (/^I should see the bar chart report$/) do
  sleep(5)
  page.should have_content("Student One")
end

When (/^I choose to view a bar chart for some specific skills or topics$/) do
  click_on("reports: choose skills")
  click_on("skills selector: topics")
  click_on("skills selector: toggle all")
  click_on("skills selector: number")
  click_button('OK')
  click_on("reports: update")
end

Then (/^I should be able to view a bar chart for the selected skills and topics$/) do
  sleep(5)
  page.should have_content("Student One")
  page.should have_content("1 selected skill")
end
