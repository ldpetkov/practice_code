module SkillsChooser

  def find_filter (filter_name)
    find("div .filter-group", :text => filter_name.capitalize)
  end

  # Expand toggle <filter_name> filter
  def expand_filter(filter_name)
    # Find filter expand span
    expand = find_filter(filter_name).find(".expand")

    # Expand unless already expanded
    expand.click unless expand[:class].include?("expanded")
  end

  # Tick <filter_name> <option_number> option
  def select_filter_option (filter_name, option_number)
    
    filter_list = find_filter(filter_name).find("ul")
    option      = filter_list.find("li:nth-child(#{option_number})")

    option.find("label").click
  end

  # Select <option_number> skill from skills
  def select_skills_option (option_number)
    skills_list = find('.skills')

    option = skills_list.find("li:nth-child(#{option_number})")

    option.find("div > label").click
  end

  # Expand toggle <option_number> skill
  def expand_skills_option (option_number)
    skills_list = find('.skills')

    expand = skills_list.find("li:nth-child(#{option_number}) > div > a")

    expand.click unless expand[:class].include?("expanded")
  end

  # Open example question from skills chooser
  # skills option should already be expanded
  def open_example_question(option_number)
    skills_list = find('.skills')
    skills_list.find("ul.steps > li:nth-child(#{option_number}) > a.example-question").click
  end

  # Clread all skills from skill plan
  def clear_skill_plan
    # If there are skills selected
    if find("div.skill-plan > ul.skill-plan").has_css?("div.skill")
      skill_plan_list = all("div.skill-plan > ul > li")

      skill_plan_list.each do |skill|
        skill.find("a.remove").click
      end
    end
  end

end
World(SkillsChooser)
