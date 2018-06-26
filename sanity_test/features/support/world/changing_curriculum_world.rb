module ChangingCurriculum
  def format_standards_string
    {
      'classic skills (gb)'               => 'Classic skills (GB)',
      'classic skills'                    => 'Classic skills',
      'common core'                       => 'Common Core',
      'common core ela'                   => 'Common Core ELA',
      'classic skills (us)'               => 'Classic skills (US)'
    }
  end

  def current_standards(subject)
    unless current_path == VisitWorld::PATH_FOR["#{subject} skills"]
      visit_page(subject + " skills page")
    end

    click_link("2: Restrict their skills") # Open restrict skills pop up
    country = page.has_content?('Level 6') ? :GB : :US
    returned_standards = STANDARDS[country][subject.to_sym]
    click_button("Cancel") # Close restrict skills pop up
    returned_standards
  end

  def change_standards(subject, standards)
    # is this necessary?
    # does it save time at the cost of somewhat obfuscated code?
    unless current_path == VisitWorld::PATH_FOR[subject + 'skills']
      visit_page("#{subject} skills page")
    end
    # the second unless is a workaround - previously had a problem where the confirm button could not be found
    # because we are not actually changing the standards - now we only try to confirm if we are actually changing
    unless find_field('standards_select').find('option[selected]').text == standards
      select standards, from: 'standards_select'
      click_button('Confirm')
    end 
  end

  def return_country
    click_link("2: Restrict their skills") # Open restrict skills pop up
    country = page.has_content?('Level 6') ? :GB : :US
    click_button("Cancel") # Close restrict skills pop up
    country
  end

private

  STANDARDS = {
    GB: {
      maths:   'Classic skills',
      reading: 'Classic skills',
      writing: 'Classic skills (GB)'
    },
    US: {
      maths:   'Common Core',
      reading: 'Common Core ELA',
      writing: 'Classic skills (US)'
    }
  }
end
World(ChangingCurriculum)
