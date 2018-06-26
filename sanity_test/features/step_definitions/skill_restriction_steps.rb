When(/^I choose to edit the skills of all students in the school$/) do
  click_link("1: Choose students")
  click_link("Select all")
  click_button("OK")
end

When(/^I restrict their maths topics to make the number topic unavailable$/) do
  restrict_topic("number")
end

# This is used to restrict the topics of students and they will see fixed grades on the City page.
# Usage: Fast sanity test
When(/^I restrict their maths topics to make the (.+), (.+), (.+), (.+), and (.+) topics unavailable$/)do |topic, topic1, topic2, topic3, topic4|
  restrict_topics_fast_sanity(topic,topic1,topic2,topic3,topic4)
end

Then(/^I should see the topics restricted$/)do
  ensure_on?('skills')
  first_student_skills = '//*[@id="list_of_students"]/tbody/tr[2]/td[4]/span[1]'
  skills_available_restricted = 'Multiply, Divide, Fractions, Decimals, Percentages, Expressions and equations, Money, Measurement, Graphs and tables, Ti'
  expect(find(first_student_skills)).to have_content(skills_available_restricted)
end

# a better test here would be to have an array of skill names
# and then to pick one at random
Then(/^the students' skills should not include skills from the number topic$/) do
  in_session('student') do
    sign_in('student', 'global username')
    test_skill_restriction('Order numbers up to 1000')
  end
  reset_skills
end

Then(/^their maths skills should not include skills from 3rd grade$/) do
  in_session('student') do
    sign_in('student', 'global username')
    click_on('hangout: subject chooser')
    click_on('hangout: maths training')
    test_skill_restriction('Rounding 2-digit numbers to the nearest 10')
  end
  reset_skills
end

# At some point someone should decide if it's worth combining this with the other skill restriction checks
# and maybe having a hash with the topic/grade name and an array of skills to check are unavailable
Then(/^their reading skills should not include skills from 3rd grade$/) do
  in_session('student') do
    sign_in('student', 'in a school with a subscription')
    click_on('hangout: subject chooser')
    click_on('hangout: reading training')
    sleep 1
    test_skill_restriction('Plurals - Latin endings')
  end
  reset_skills(true)
end

When(/^I restrict (?:their |)(maths|reading) grades to make (.*) unavailable$/) do |subject, grade|
  restrict_grade(grade)
end

When(/^I select one student at the school$/) do
  choose_one_student
end

When(/^I restrict their maths skills to square numbers$/) do
  check('bulk_edit_trigger')
  only_allow_skill('Multiply', 'Square numbers')
end

Then(/^the student's skills should only include square numbers$/) do
  in_session('student') do
    sign_in('student', 'global username')
    skills_panel = find(:css, 'div.training-skills-panel > div > div.header')
    expect(skills_panel.text).to eq('1 skill')
    skills_panel.click
    expect(find('li.skill', text: 'Rounding 2-digit numbers to the nearest 10')[:class].include?('unavailable')).to eq(true)
    expect(find('li.skill', text: 'Square numbers')[:class].include?('unavailable')).not_to eq(true)
  end
end

When(/^I select all students from a class at the school$/) do
  click_link("1: Choose students")
  click_link("Select all")
  click_button("OK")
end

When(/^I choose to edit the skills of one student$/) do
  click_link("1: Choose students")
  find('h3', text: 'Class A').click
  within('label', text: 'Student One') do
    find('input').click
  end
  click_button("OK")
end

When(/^I click the edit button for the student at the top of the list$/) do
  find(:xpath, '//*[@id="list_of_students"]/tbody/tr[2]/td[4]/a').click
end

When(/^I restrict their maths topics to make the addition topic unavailable$/) do
  restrict_topic("add")
end

Then(/^the student's skills should not include skills from the addition topic$/) do
  in_session('student') do
    sign_in('student', 'global username')
    test_skill_restriction('Add within 10')
  end
  reset_skills
end
