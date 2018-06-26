# Create a new assessment for automated sanity test
When(/^I should be able to create a new assessment$/) do
  subject                 = 'Math'
  number_of_questions     = 10
  name_of_assessment      = 'AUTOMATED-FAST-SANITY'
  students                = ["Student One"]

  go_to_create_assessment_form()

  select_assessment_subject(subject)
  click_next()

  # Select studets to participate in assessment
  select_students(students)
  click_next()

  # Fill in assessment details
  set_assessment_details(name_of_assessment, number_of_questions)
  click_next()

  # Select Times topics, Reading clocks skill
  select_filter_option("Topics", 13)
  select_skills_option(2)
  click_next()

  assessment_questions_loading?(number_of_questions)
  click_on_target("button", "Create")
  click_on_target("button", "Done")
end

# Check assessment with a student
Then(/^I should be able to do the assessment$/) do

  # make sure not to click on the pet
  page.driver.execute_script( 
    "var pet = document.getElementsByClassName('scene-pet')[0]; 
     if (pet !== undefined) {
       pet.parentNode.removeChild(pet);
     }
    ")

  find(:css, ".scene-input").click
  click_on_target("button", "Start")

  # For speed purposes instead of checking for div.question existence
  10.times do
    find(".current > div.options > ul > li.option.option-0").click
    #click_on_target("button","Next")
  end

  sleep(1)    # Sometimes Finish button takes time to laod
  click_on_target("button", "Finish")
end

# Can I check assessment results for <student_name> student
Then(/^I should see assessment results for (.+)$/) do |student_name|
  expect(page).to have_content(student_name)
end

Then(/^I open results for last assessment$/) do
  find("table > tbody > tr:nth-child(2)").find("a", :text => "results").click
end 

# Can I see the assessment results at the end of assessment
Then(/^I should see assessment results$/) do
  expect(page).to have_css("div.assessment-progress-pane")
  find(:css, "a", :text => "Done").click
  #current_url.should match(/assessment_end=true\z/) #Commented as the assessment_end url was removed 
end


When(/^I go to create new assessment$/) do
  go_to_create_assessment_form()
end

Then(/^I should be told that assessments are a premium feature$/) do
  in_session "teacher" do
#    page.should have_content "Unsubscribed students"
    page.should have_content "You are trying to use assessments, which are a premium feature."
  end
end

When(/^I click to choose my skills$/) do
  in_session "teacher" do
    click_button("Choose skills")
  end
end

Then(/^I should see the skill browser$/) do
  in_session "teacher" do
    page.should have_content "Sumdog filters"
    page.should have_content "Clear skills"
  end
end

Then(/^I manually navigate to the create assessment form$/) do
  in_session "teacher" do
    go_to_create_assessment_form()
  end
end

When(/^I click to review my questions$/) do
  in_session "teacher" do
    click_button("Review questions")
  end
end

Then(/^I should see each of the questions$/) do
  in_session "teacher" do
    page.should have_content "Assessment questions"
    questions_are_the_same_on_page_refresh
  end
end

Then(/^I should be able to refresh them$/) do
  in_session "teacher" do
    questions_are_different_after_question_refreshed()
  end
end

Then(/^I click on the create assessment option$/)do
  in_session "teacher" do
    find("a", :text=>"Create assessment").click
  end
end

Then(/^the teacher creates an assessment$/) do
  in_session "teacher" do
    create_assessment()
  end
end

Then(/^the student should be able to play in it$/) do
  in_session "student" do
    page.should have_content "5" # the name of the assessment
  end
end

When(/^the student has finished it$/) do
  in_session "student" do
    find(".scene-input").click() #click to start the assessment
    find("a", :text => "Start").click # click the start button
    find("ul").first("li").click #click on the first answer
  end
end

Then(/^the teacher should be able to see their results$/) do
  in_session "teacher" do 
    visit_page("adult")
    click_on_panel("assessments")
    find("a", :text=>"View assessments").click
  end
end
