module Reports

  def join_sanity ## creates a new teacher and joins the sanity school
    click_on("account menu")
    click_on("new teacher menu: join school")
    fill_in 'organisation_postcode', with: 'AUTOSANITY'
    click_on("school creation: submit search")
    click_on("school creation: join school")
    in_session('teacher') do
      sign_in('teacher', 'with a school')
      click_on("account menu")
      click_on("teacher account menu: teachers")
      click_on("teachers: accept teacher")
      sleep(5)
    end
  end

  def waste_reports ## wastes 2 reports (needed for the free reports pop-up)
    click_on("reports: update")
    sleep(2)
    click_on("teacher header: contests")
    sleep(2)
    click_on("teacher header: reports")
    sleep(2)
    click_on("reports: update")
    sleep(2)
    click_on("teacher header: contests")
    sleep(2)
    click_on("teacher header: reports")
    sleep(2)
  end

  # Check if report is displaying
  def report_displaying?
    page.has_css?("div.metrics-column > div:nth-child(1) > div:nth-child(1) > div > div")
  end

  def generate_report
    find(:css, ".reports-panel").click
    find(:css, "div.reports-menu > ul > li > a", text: "Class reports").click

    select_report_subject('Math')
    click_next()

    select_students(["Student One", "Student Two"])
    click_next()

    select_report_metric("Questions answered")
    select_reporting_period("Last 30 days")
    select_report_skill("Kindergarten")
    select_report_skill("Grade 1")
    select_report_skill("Grade 4")
    select_report_skill("Grade 8")
    select_report_format("Table report")
    click_next()
  end

  def select_report_subject(subject)
    find(:css, "label", :text => subject.capitalize).click
  end

  def select_report_metric(metric)
    find(:css, "form > fieldset.metric > ul > li > label", text: metric).click
  end 

  def select_reporting_period(period)
    find(:css, "form > fieldset.period > select > option", text: period).click
  end  

  def select_report_skill(skill)
    find(:css, "form > fieldset.levels > ul > li > label", text: skill).click
  end

  def select_report_format(format)
    find(:css, "form > fieldset.format > ul > li > label", text: format).click
  end

end
World(Reports)
