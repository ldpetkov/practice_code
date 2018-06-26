module VisitWorld
  def click_on_panel(name)
    name = "dashboard-settings" if name == "class controls"
    panel = ".panel-column > .#{name}-panel".downcase
    puts panel
    find(panel).click()
  end 
  
  def visit_page(page_name)
    # maximize_current_window
    path = PATH_FOR[page_name.chomp(' page')]
    path = page_name if path.nil?
    visit(path)
  end

  def should_be_on_regex?(regex)
    # puts current_path
    # puts regex
    expect(regex =~ current_path).not_to eq nil
  end

  def should_be_on?(target_page)
    target_path, regex = get_target_path_from_target_page(target_page)
    path_matches_regex?(target_path, regex)
  end

  def get_target_path_from_target_page(target_page)
    regex       = true
    target_path = REGEX[target_page.chomp(' page')]
    if target_path.nil?
      target_path = PATH_FOR[target_page.chomp(' page')]
      regex       = false
    end
    return target_path, regex
  end

  def path_matches_regex?(target_path, regex)
    # remove any trailing '/' and check whether it matches the stored path
    sleep 1
    current_page = current_path.chomp('/')
    if !regex && !target_path.nil? && target_path.include?('?')
      url          = URI.parse(current_url)
      current_page = "#{url.path}?#{url.query}"
    end
    if regex
      expect(/#{target_path}/ =~ current_page).not_to eq nil
    else
      expect(current_page).to eq target_path
    end
  end

  # this feels like it should be more similar to should_be_on?
  def shouldnt_be_on?(target_page)
    #expect(current_path.chomp('/')).to_not eq PATH_FOR[target_page.chomp(' page')]
    #expect(page).to have_no_xpath('/html/body/div/div[2]')
    page.should have_no_content('This should be called Fundog')

  end


  # This method should check if you are on the desired page and visit it if this is not true.
  def ensure_on?(page_name)
    path = PATH_FOR[page_name.chomp(' page')]
    currentpath = current_path || ""
    current_page_check = currentpath == path
    visit(path) unless current_page_check
  end

  def on_page?(page_name)
    path = PATH_FOR[page_name.chomp(' page')]
    currentpath = current_path || ""
    current_page_check = currentpath == path
  end



  PATH_FOR =
    { 
      'city'                              => "/city",
      'homepage'                          => "/",
      'signup_selector'                   => "/sign_up",
      'teacher sign up'                   => "/teacher/sign_up",
      'parent sign up'                    => "/parent/sign_up",
      'student sign up'                   => "/student/sign_up",
      'teacher dashboard'                 => "/adult",
      'hangout'                           => "/student",
      'student activity selector'         => "/student/activity",
      'new parent dashboard'              => "/parent/students/new",
      'parent dashboard'                  => "/adult",
      'sign in'                           => "/user/sign_in",
      'sign out'                          => "/user/sign_out",
      'classes'                           => "/teacher/classes",
      'all classes'                       => "/teacher/classes?all=true",
      'edit classes'                      => "/teacher/classes/edit_multiple?all=true",
      'standard signin'                   => "/student/sign_in",
      'avatar editor'                     => "/student/avatar",
      'students'                          => "/teacher/students",
      'subscription'                      => "/teacher/school/subscription",
      'teacher list'                      => "/teacher/teachers",
      'student list'                      => "/teacher/students",
      'activities'                        => "/teacher/activities",
      'school dashboard'                  => "/teacher/school",
      'subscription page'                 => "/teacher/school/subscription",
      'teacher login settings'            => "/teacher/login_settings/edit",
      'school edit'                       => "/teacher/school/edit",
      'school region edit'                => "teacher/school/region/edit",
      'advanced search'                   => "/teacher/school_search/expanded/new",
      'contests'                          => "/teacher/contests",
      'skills'                            => "/teacher/skills",
      'parents wiki'                      => "/en/parents/",
      'teachers wiki'                     => "/en/teachers/",
      'teacher registration confirmation' => "/user/email",
      'parent registration confirmation'  => "/user/email",
      'email not confirmed'               => "/user/email",
      'manage students'                   => "/teacher/students",
      'live class set up'                 => "/teacher/lessons/new",
      'current live class'                => "/teacher/lessons/current",
      'reports'                           => "/teacher/reports",
      'shop'                              => "/student/shop",
      'maths skills'                      => "/teacher/skills?selected_subject=maths",
      'reading skills'                    => "/teacher/skills?selected_subject=english",
      'writing skills'                    => "/teacher/skills?selected_subject=writing",
      'get a quote'                       => "/teacher/school/subscription_quotes/new",
      'house'                             => "/house",
      'wardrobe'                          => "/house/clothes",
      'maths activities'                  => "/teacher/activities?selected_subject=maths",
      'reading activities'                => "/teacher/activities?selected_subject=english",
      'writing activities'                => "/teacher/activities?selected_subject=writing",
      'new competition'                   => "/teacher/competitions/new",
      'new challenge'                     => "/teacher/challenges/new",
      'dashboard'                         => "/adult",
      'news feed'                         => "/teacher/lessons/current"
    }

  REGEX =
    {
      'get a quote'   => "/teacher/school/subscription_quotes(?:/new)?",
      'quote summary' => "/teacher/school/subscription_quotes/\\d+",
      'classes'       => "/teacher/classes(?:\\?.*)?",
      'edit classes'  => "/teacher/classes/edit_multiple(?:\\?.*)?",
      'entries'       => "/contests/GB_NATIONAL_\\d+\/entries"
    }

  ### Navigation (WIP) ###
  # The idea here is to have an array containing the links one needs to click 
  # to get from one part of the site to another.
  # The method then loops through the array clicking on each link in turn.
  def navigate_to(page_name) 
    NAVIGATION_STEPS[page_name].each { |link| click_on(link) }
  end

  NAVIGATION_STEPS =
    {
      'students page'    => ['account menu', 'teacher account menu: students'],
      'add student menu' => ['account menu', 'teacher account menu: students', 'students: add student']
    }
end
World(VisitWorld)
