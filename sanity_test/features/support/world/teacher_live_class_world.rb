module TeacherLiveClassWorld
  def stop_live_class
    visit_page("current live class")
    click_on("live class: change activity")
    click_link("Stop live class")
    page.should have_content("Finished")
  end

  def stop_all_live_classes
    visit_page("current live class")
    until current_path == VisitWorld::PATH_FOR["live class set up"]
      stop_live_class
      visit_page("current live class")
    end
  end

  def number_of_attempts
    # this is a mega-hack to click on the 'games' metric in the table
    # it opens the menu then finds the option from a screenshot
    # it should be replaced once the selector has been given an id
    table_contents = find(:xpath, '//*[@id="lesson_status"]/div/table/tbody/tr[2]/td[3]').text
    table_contents == '-' ? 0 : table_contents.to_i
  end
end
World(TeacherLiveClassWorld)
