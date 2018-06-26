module SkillRestriction
  # Restricts the topic for preselected students
  def restrict_topic(topic_name)
    check('bulk_edit_trigger')
    click_link("2: Restrict their skills")
    find('.tab', text: 'Topic').click
    # Click to select all topics, unless all are already selected
    unless find(:css, '#selection_toggle').text == "Select None"
      find(:css, '#selection_toggle').click
    end
    unless topic_name.nil? then
      uncheck(topic_name)
    end
    click_button('OK')
  end

  # Restricts topics from the fast sanity in the default skills selector
  def restrict_topics_fast_sanity(topic_name, topic_name1, topic_name2, topic_name3, topic_name4)
    check('bulk_edit_trigger')
    click_link("2: Restrict their skills")
    find('.tab', text: 'Topic').click
    # Click to select all topics, unless all are already selected
    unless find(:css, '#selection_toggle').text == "Select None"
      find(:css, '#selection_toggle').click
    end
    deselect_single_topic(topic_name)
    deselect_single_topic(topic_name1)
    deselect_single_topic(topic_name2)
    deselect_single_topic(topic_name3)
    deselect_single_topic(topic_name4)
    click_button('OK')
    end

  # Method used for unchecking topic boxes
  def deselect_single_topic(topic_name)
    unless topic_name.nil? then
      uncheck(topic_name)
    end
  end

  # Restricts the grade for preselected students (assumes CCSS curriculum)
  def restrict_grade(grade)
    check('bulk_edit_trigger')
    click_link("2: Restrict their skills")
    unless find(:css, '#selection_toggle').text == "Select None"
      find(:css, '#selection_toggle').click
    end
    within('label', text: grade) do
      find('input').click
    end
    click_button("OK")
  end

  # Selects Student One from the 'Choose Students' pop up
  def choose_one_student
    click_link("1: Choose students")
    unless find(:css, '#students_in_groups_chooser > div.select_all > a').text == "Select all"
      find(:css, '#students_in_groups_chooser > div.select_all > a').click
    end
    # this does not work if class A isn't the top class in the list (possible if earlier step fails)
    # but there's seemingly no way to rectify this currently
    find(:css, '#ui-accordion-studentSelect-header-0').click
    check('Student One')
    click_button("OK")
  end

  # Restricts everything but skill skill_name from topic topic_name
  def only_allow_skill(topic_name, skill_name)
    click_link("2: Restrict their skills")
    find('.tab', text: 'Topics').click
    select_nothing_with_selection_toggle
    find('span', text: topic_name).click
    within('label', text: skill_name) do
      find('input').click
    end
    click_button('OK')
  end

  def select_nothing_with_selection_toggle
    # Click once to have either all or none selected
    # (this avoids the issue of only some being selected)
    find(:css, '#selection_toggle').click
    # Select none if all are selected
    find(:css, '#selection_toggle').click if find(:css, '#selection_toggle').text == "Select None"
  end

  def test_skill_restriction(skill_name)
    page.all(:css, '.training-skills-panel')[0].click
    sleep 1
    puts current_path
    expect(find(:xpath, "//li[./div[text()=\"#{skill_name}\"]]")[:class].include?('unavailable')).to eq true
  end

  # Selects all skills for selected students (the 'default' position)
  def reset_skills(reset_reading = false, session_name = :default)
    in_session(session_name) do
      visit_page('maths skills')
      reset_topic
      
      if reset_reading then
        visit_page('reading skills')
        reset_topic
      end
    end
  end
  
  private
  def reset_topic
      click_link("1: Choose students")
      find('h3', text: 'Class A').click
      
      within('label', text: 'Student One') do
        find('input').click
      end
      
      click_button("OK")
      click_link("2: Restrict their skills")
      
      unless find(:css, '#selection_toggle').text == "Select None"
        find(:css, '#selection_toggle').click
      end
      
      click_button("OK")
  end
end
World(SkillRestriction)
