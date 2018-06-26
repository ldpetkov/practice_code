
def click_next
  click_on_target("button", "Next")
end

def go_to_create_assessment_form()
  find(:css, '.assessments-panel').click
  find(:css, 'a.panel', :text => "Create assessment").click
end

def select_assessment_subject(subject)
  find(:css, "label", :text => subject.capitalize).click
end

def set_assessment_details(name, question_count)
  fill_in('Name', :with => name)
  fill_in('Number of questions', :with => question_count)
  # process the time information
  start  = (Time.now - 24*60*60).strftime("%m/%d/%Y")
  finish = (Time.now +  24*60*60).strftime("%m/%d/%Y")
  find(:xpath, '//input[@id="activity_starts_at_date"]').set(start)
  find(:xpath, '//input[@id="activity_ends_at_date"]').set(finish)
end

# Correct number of questions are loading
# Regenerate works
def assessment_questions_loading?(number)
  sleep(1)  # Wait for assessment questions to load
  questions = find(:css, "ul.questions")
  expect(questions.all(:css, "ul.options").length).to eq(number)
  # Change one question
  questions.first(:css, "a.regenerate").click
  expect(questions.all(:css, "ul.options").length).to eq(number)
end

def questions_are_the_same_on_page_refresh()
  q1 = getFirstQuestion() # Get question before refresh
  reload_questions()
  q2 = getFirstQuestion()
  puts "ERROR AFTER THE PAGE WAS REFRESHED THE QUESTIONS WERE DIFFERENT" unless (q1==q2) # check the questions are the same.
end

def questions_are_different_after_question_refreshed()
  puts "within first li"
  within first("li") do
    questiona = first(".text").text() ##get the first question
    puts questiona
  end
  puts "reload_questions"
  reload_questions
  puts "within first li"
  within first("li") do
    puts "refresh the first question"
    find("a").click() ## refresh the question
    questionb = first(".text").text()  # get the new question

   # check the questions are not the same.
    puts "AFTER CLICKING TO REFRESH A QUESTION, THEY WERE THE SAME!" if (q1==q2)
 end
end

def getFirstQuestion()
  within first("li") do
    question = first(".text").text() ##get the first question
    puts question
  end
end

def questions_are_different_after_question_count_changed()
  q1 = getFirstQuestion()
  find("a", :text=>"Done").click()
  fill_in('Number of questions', :with => '5')
  click_button("Review questions")
  q2 = getFirstQuestion()
  puts "AFTER CHANGING THE NUMBER OF QUESTIONS QUESTIONS WERE THE SAME!" if (q1==q2)
end

def reload_questions()
  find("a", :text=>"Done").click() #
  click_button("Review questions")
end
