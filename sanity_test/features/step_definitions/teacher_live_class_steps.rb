When(/^I cancel setting up a maths training live class$/) do
  in_session do
    click_on("live class: cancel")
  end
end

Then(/^I should not have an active live class$/) do
  in_session do
    visit_page("current live class")
    should_be_on?("live class set up")
  end
end

When(/^I set up a maths training live class$/) do
  in_session do
    stop_all_live_classes
    visit_page("live class set up")
    select("Class A", from: 'lesson_student_group_id')
    select("Training", from: 'lesson_activity_id')
    click_on("live class: set up")
  end
end

Then(/^there should be an active live class$/) do
  in_session do
    visit_page("current live class")
    should_be_on?("current live class")
    stop_live_class
  end
end

Given(/^I have an active (.+) (?:t|T)raining live class$/) do |subject|
  in_session do
    stop_all_live_classes
    visit_page("live class set up")
    select("Class A", from: 'lesson_student_group_id')
    select("Training", from: 'lesson_activity_id')
    select(subject.capitalize.chomp('s'), from: 'lesson_subject_id')
    click_on("live class: set up")
  end
end

When(/^I change the activity of the live class to tables$/) do
  in_session do
    click_on("live class: change activity")
    select("Tables", from: 'lesson_activity_id')
    click_on("live class: set up")
  end
end

Then(/^the live class activity should be changed to tables$/) do
  in_session do
    visit_page("current live class")
    page.should have_content('Tables')
    stop_live_class
  end
end

When(/^I stop the live class$/) do
  in_session do
    stop_live_class
  end
end

When(/^I click on the report button for the live class$/) do
  in_session do
    visit_page("current live class")
    click_on("live class: view report")
  end
end

When(/^a student participating in the live class plays a game$/) do
  in_session('student') do
    sign_in('student', 'global username')
    start_game('Talent Show')
    play_game('talentshow_question_box')
  end
end

Then(/^the live class table should update with their score$/) do
  in_session do
    visit_page("current live class")
    sleep(1)
    n = number_of_attempts

    # ensures live class stops even if test fails
    stop_live_class

    expect(n).not_to eq(0)
  end
end

When(/^I open the shop for students in the live class$/) do
  in_session do
    visit_page("current live class")
    click_on("live class: open shop")
  end
end

# in the two steps below 'student2' is used as the session name

Then(/^students in the live class should not be able to open the wardrobe$/) do
  in_session('student') do
    sign_in('student', 'global username')
    click_on("wardrobe")
    shouldnt_be_on?("wardrobe")
  end
end

Then(/^students in the live class should be able to open the wardrobe$/) do
  in_session('student') do
    sign_in('student', 'global username')
    click_on("wardrobe")
    should_be_on?("wardrobe")
  end
  in_session { stop_live_class }
end
