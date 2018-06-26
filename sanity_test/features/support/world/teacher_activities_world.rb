module TeacherActivitiesWorld

  RANDOM_NAME = (0...8).map { (65 + rand(26)).chr }.join

  def delete_activity(activity_name)
    table_row = find('table > tbody > tr', text: activity_name)
    within(table_row) do
      page.evaluate_script('window.confirm = function() { return true; }')
      find('a', text: 'delete').click
    end
  end

  def edit_challenge(challenge_name)
    table_row = find('table > tbody > tr', text: challenge_name)
    within(table_row) do
      find('a', text: 'edit').click
    end
    fill_in 'start_at_date', with: '01/01/2001'
    check('bulk_edit_trigger')
    click_link('Save challenge')
  end

  def create_activity(activity_type)
    click_link("New #{activity_type}")
    should_be_on?("new #{activity_type} page")
    fill_in 'title', with: TeacherActivitiesWorld::RANDOM_NAME
    check('bulk_edit_trigger') # Used checkbox id here
    click_link("Save #{activity_type}")
  end

  def make_challenge_past(challenge_name)
    table_row = find('table > tbody > tr', text: challenge_name)
    within(table_row) do
      find('a', text: 'edit').click
    end
    fill_in 'start_at_date', with: '01/01/2000'
    fill_in 'end_at_date', with: '01/01/2001'
    check('bulk_edit_trigger')
    click_link('Save challenge')
    visit_page('maths activities') # Refresh to ensure challenge has time to move to the past activities section
  end

  # Below I have omitted the skills scenario for now as the skill selection will get an overhaul soon

  # def restrict_skills_challenge(challenge_name)
  #   table_row = find('table > tbody > tr', text: challenge_name)
  #   within(table_row) do
  #     find('a', text: 'edit').click
  #   end
  #   check('bulk_edit_trigger')
  #   student_table_row = find('table > tbody > tr', text: 'Student One')
  #   within(student_table_row) do
  #     find('a', text: 'edit').click
  #   end
  #   find('.tab', text: 'Topic').click
  #   find('#selection_toggle').click
  #   check('number')
  #   click_button('OK')
  #   click_link('Save challenge')
  # end

end

World(TeacherActivitiesWorld)
