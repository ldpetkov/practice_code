module SkillsChooser
  # Checks if example questions are loading
  # Only one answer is correct

  def exit_example_questions
    find("a.button.control.close").click
  end

  def find_question 
    find("div.question")
  end

  def find_options
    all("ul.options > li")
  end

  def questions_loading?
    question = find_question
    for q in question.all("div.fragment.text") do
      expect(q.text).not_to eq("")
    end
  end

  def one_correct_answer?
    options = find_options

    options.each do |option|
      option.click
    end

    correct_found = 0

    options.each do |option|
      correct_found += 1 if option[:class].include?("correct")
    end

    expect(correct_found).to eq(1)
  end

  # Perform all checks on correct answers
  def check_example_question
    questions_loading?
    one_correct_answer?
  end


end
World(SkillsChooser)
