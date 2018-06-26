module Clicking

  def click_on(target)
    click_on_xpath(TARGETS.fetch(target))
  end

  def click_on_xpath(path)
    find(:xpath, path).click
  end

  # Click on element by its text
  # Use tag to avoid ambiguity
  def click_on_target(target_tag, target_text)
        case target_tag
        when "link"
          find("a", :text => target_text).click
        when "button"
          find("div.footer > a.button", :text => target_text).click
        else
          class_name = target_text.downcase+"-"+target_tag
          find("div .#{class_name}").click
        end
  end

  # NAMING CONVENTION FOR TARGETS:
  # "area of site: name of link" (note that this list should be
  # converted to that format at some point)

  TARGETS =
    {
      ## Old-style targets (if you use these in your code, please refactor to new-style) ##
      "teachers"                                => '//*[@id="menu"]/ul/li[1]/a',
      "parents"                                 => '//*[@id="menu"]/ul/li[2]/a',
      #"try me"                                  => '//*[@id="menu"]/ul/li[3]/a',
      "try me"                                  => '/html/body/div/div[3]/div[3]/a/div/h2',
      "live class tab"                          => '//*[@id="menu"]/ul/li[1]/a',


      # Old version causing a crash
      #"login and play"                          => '//*[@id="new_user_session_submit"]',
      "login"                                   => '/html/body/div/div[3]/div[2]/a/h4',
      "login and play"                          => '//*[@id="app"]/div[1]/div[3]/a[4]',
      "main game image"                         => '//*[@id="gallery_box"]/div/div/div/div[3]',
      "rotating contest banner"                 => '//*[@id="upper_info_panel"]/a/img',
      "sign up free"                            => '//*[@id="new_session"]/div[2]/div/a[1]',
      "play as guest"                           => '//*[@id="app"]/div[3]/div/div[1]/ul/li[3]/div/span',
      #"play as guest"                           => '/html/body/div/div[3]/div[3]/a',

      "class label"                             => '//*[@id="class_membership"]/fieldset/ol/div[1]/label',
      "add to contests dropdown"                => '//*[@id="add_to_contests"]',
      "enter to all"                            => '//*[@id="add_to_contests"]/option[2]',

      "choose class"                            => '//*[@id="class_selector"]',
      "no class"                                => '//*[@id="class_selector"]/option[2]',
      "any class"                               => '//*[@id="class_selector"]/option[1]',

      ## (Parent/teacher) Dashboard links ##
      #"dashboard: sumdog logo"                  => '//*[@id="sumdog-logo"]',
      "dashboard: sumdog logo"                  => '//*[@id="app"]/div[2]/a',
      

      ## Account menu (specify teacher or parent) ##
      "account menu"                            => '//*[@id="account_menu_link"]',
      "teacher account menu: classes"           => '//*[@id="account_menu"]/ul/li[3]/a',
      "teacher account menu: students"          => '//*[@id="account_menu"]/ul/li[2]/a',
      "new teacher menu: join school"           => '//*[@id="account_menu"]/ul/li[1]/a',
      "teacher account menu: teachers"          => '//*[@id="account_menu"]/ul/li[4]/a',

      ## Students page links & buttons ##
      "students: add student"                   => '//*[@id="students_index"]/div/div[2]/a[1]',
      "students: add student pop-up close"      => '//*[@id="new_user"]/fieldset[2]/ol/a',
      "students: submit student"                => '//*[@id="user_submit"]',

      ## Teacher header links ##
      "teacher header: reports"                 => '//*[@id="menu"]/ul/li[4]/a',
      "teacher header: contests"                => '//*[@id="menu"]/ul/li[2]/a',


      ## Sign up links ##
      "sign up: homepage link"                  => '//*[@id="login_link"]/div/a[2]',
      "sign up: teacher"                        => '//*[@id="content"]/div/div/div[1]/div[1]/ul/li[6]/div/a',
      "sign up: parent"                         => '//*[@id="content"]/div/div/div[1]/div[3]/ul/li[4]/div/a',
      "sign up: terms of use"                   => '//*[@id="terms_and_conditions"]',
      "sign up: parent submit"                  => '//*[@id="parent_user_submit"]',
      "sign up: teacher submit"                 => '//*[@id="teacher_user_submit"]',

      ## Quotes links ##
      "quotes page: request a quote"            => '//*[@id="quote"]/a',
      "quotes page: show prices and send quote" => '//*[@name="commit"]',

      ## School creation links ##
      "school creation: create or join school"  => '//*[@id="create_school"]/a',
      "school creation: submit search"          => '//*[@id="organisation_submit"]',
      "school creation: create new school"      => '//*[@id="create_new_school"]/div/div[1]/a',
      "school creation: join school"            => '//*[@id="similar_schools_list"]/div[1]/form/div/input[1]',
      
      ## Contests ##
      "contests: entries"                       => '//*[@id="content"]/div[3]/div/table/tbody/tr[2]/td[5]/a',
      "contests: enter"                         => '//*[@id="content"]/div[3]/div/table/tbody/tr[2]/td[3]/a',

      ## Reports ##
      "reports: update"                         => '//*[@id="report_update_button"]',
      "reports: cancel update"                  => '/html/body/div[4]/div[3]/div/button[2]/span',
      "reports: show report"                    => '/html/body/div[4]/div[11]/div/button[1]/span',
      "reports: bar chart"                      => '//*[@id="chart_type_switch"]',
      "reports: choose skills"                  => '//*[@id="choose_ccss_topics_trigger"]/div',

      ## Teachers page ##
      "teachers: accept teacher"                => '//*[@id="join_requests"]/table/tbody/tr[2]/td[3]/form[1]/div/input[1]',

      ## Live class ##
      "live class: cancel"                      => '//*[@id="new_lesson"]/div[3]/a',
      "live class: set up"                      => '//*[@id="save_lesson_button"]',
      "live class: change activity"             => '//*[@id="lesson_overview"]/div/div[1]/div[4]/a',
      "live class: view report"                 => '//*[@id="report_link"]',
      "live class: open shop"                   => '//*[@id="lesson_overview"]/div/div[1]/div[8]/div[4]/a',

      ## Hangout ##
      "hangout: start game"                     => '//*[@id="student_home"]/div[2]/div[2]/div[5]',
      "hangout: previous game"                  => '//*[@id="student_home"]/div[2]/div[2]/div[6]',
      "hangout: opponent selector"              => '//*[@id="game_settings_panel"]',
      "hangout: game map"                       => '//*[@id="map_panel"]/div[2]/div',
      "hangout: subject chooser"                => '//*[@id="app"]/div/div[2]/div[1]/div[1]',
      "hangout: maths training"                 => '//li[@class="training"]/a[./span[text()="Maths training"]]',
      "hangout: writing training"               => '//li[@class="training"]/a[./span[text()="Writing training"]]',
      "hangout: reading training"               => '//li[@class="training"]/a[./span[text()="Reading training"]]',
      "opponent: robot"                         => '//*[@id="game_settings_panel"]/div[4]/div[1]/ul/li/div[text()="Robot"]',
      "opponent: class"                         => '//*[@id="game_settings_panel"]/div[4]/div[1]/ul/li/div[text()="Class"]',
      "opponent: world"                         => '//*[@id="game_settings_panel"]/div[4]/div[1]/ul/li/div[text()="World"]',
      "endscreen: next"                         => '//*[@id="app"]/div/div[2]/div[1]/div/div/div[1]/a/div',
      "wardrobe"                                => '//*[@id="app"]/div/div[2]/div[4]/div/div[2]',
      "shop"                                    => '//*[@id="back_button1"]/a',

      ## City ##
      "city: skills browser"                    => '//*[@id="app"]/div[2]/div[2]/div[2]/div/div[3]',
      "city: select a skill"                    => '//*[@id="app"]/div[1]/div[3]/div[2]/div/div[2]/div[2]/div/ul/li[1]/input',
      "city: close skill browser"               => '//*[@id="app"]/div[1]/div[3]/div[3]/a[4]',

      ## Skills page ##
      "skills: more information"                => '//*[@id="show1410047209"]',
      "skills: hide details"                    => '//*[@id="hide1410047209"]',
      "skills: cancel choose standards"         => '/html/body/div[4]/div[3]/div/button[1]/span',
      "restrict skills"                         => '//*[@id="choose_ccss_topics_trigger"]',
      "confirm choose standards"                => '/html/body/div[4]/div[3]/div/button[2]',
      "cancel restrict skills"                  => '/html/body/div[4]/div[3]/div/button[2]/span',
      "skills: reading tab"                     => '//*[@id="content"]/div[1]/div[1]/div[2]',
      "skills: writing tab"                     => '//*[@id="content"]/div[1]/div[1]/div[3]',
      "skills selector: topics"                 => '//*[@id="ccss_topics_dialog"]/div/div[1]/div[2]',
      "skills selector: toggle all"             => '//*[@id="selection_toggle"]',
      "skills selector: number"                 => '//*[@id="number"]',


      ## Classes page ##
      "classes: new class"                      => '//a[@title="New class"]',
      "classes: edit classes"                   => '//a[@id="edit_classes"]',
      "classes: cancel new class"               => '//*[@id="new_student_group"]/div[2]/button',
      "classes: add new class"                  => '//input[@value="Add New Class"]',
      "edit classes: delete class"              => '//a[@id="delete_selected"]',
      "edit classes: save changes"              => '//input[@value="Save Changes"]',
      "edit classes: confirm delete"            => '//*[@id="dialog-fancyConfirm"]/div/button[2]',

      ## Writing Games ##
      "secret: send message"                    => '//*[@id="submit-remark"]'
    }
end
World(Clicking)
