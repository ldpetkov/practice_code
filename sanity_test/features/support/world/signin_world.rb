module SigninWorld

  ## To add new sign ins, add arrays to one of the user_type hashes.
  ## These can then be accessed using SigninWorld::SIGNIN_DETAILS[user_type][login_type]
  ## e.g., SigninWorld::SIGNIN_DETAILS['teacher']['with a school']
  SIGNIN_DETAILS = {
    parent:   {
      'global username'       => %w(SP31602 crocodile),
      'email address'         => %w(sanity+parent@sumdog.com crocodile),
      'incorrect password'    => %w(SP31602 crocodole),
      'invalid email address' => %w(invalid@sumdog,com crocodile)
    },
    teacher:  {
      'automated sanity'                      => %w(ST34933 crocodile),
      'global username'                       => %w(ST26057 crocodile),
      #'scoped username'                       => %w(STA crocodile automated-sanity-test),
      'email address'                         => %w(sanity+teacher@sumdog.com crocodile),
      'incorrect password'                    => %w(ST26057 youshallnotpass),
      'invalid username'                      => %w(ST27INVALID7 crocodile automated-sanity-test),
      'with a school'                         => %w(ST26057 crocodile),
      'with a school with at least one class' => %w(ST26057 crocodile),
      'with a subscription'                   => %w(ST26116 crocodile),
      'with a school that does not have a neighbourhood selected' => %w(ST26116 crocodile),
      'with a school that has a neighbourhood selected' => %w(CT27954 crocodile),
      'with a school that is participating in a contest' => %w(CT27954 crocodile),
      'without a subscription'                => %w(CT27954 crocodile),
      'sanity'                                => %w(qt739 abc)
    },
    student:  {
      'automated sanity'                => %w(SOA SOA automatedsanitytest),
      'global username'                 => %w(SO10661 music38), # Changed on 12/05/2015, password was wrong
      #'scoped username'                 => %w(SOA music38 automated-sanity-test), # Changed on 12/05/2015, password was wrong
      'incorrect password'              => %w(SOA table32 automated-sanity-test),
      'in a school with a subscription' => %w(SO10684 green93)
    },
    student2: {
      'automated sanity'                => %w(STB STB automatedsanitytest),
      'global username'                 => %w(ST26112 grass44),
      'in a school with a subscription' => %w(ST26117 storm47)
    },
    studentww: {
      'automated sanity'                => %w(WWA WWA automatedsanitytest),
    },
    studentcc: {
      'automated sanity'                => %w(CCA CCA automatedsanitytest),
    },
    StudentA: {
      'scoped username'                 => %w(aa aa fast-sanity)
    },    
    StudentB: {
      'scoped username'                 => %w(bb bb fast-sanity)
    },
    student_of_class_B: {
      'one' => %w(aa aa automated-sanity-test),
      'two' => %w(bb bb automated-sanity-test),
      'three' => %w(cc cc automated-sanity-test),
      'four' => %w(dd dd automated-sanity-test),
      'five' =>%w(ee ee automated-sanity-test)
    }
  }

  def sign_out
    visit_page('sign out')
  end

  def sign_in(user_type, user_login_type)
    # if we're on the homepage
    # This current_path == VisitWorld::PATH_FOR appears to be broken or does not work properly with Capybara. Have to fix it!
    if current_path == VisitWorld::PATH_FOR['homepage']
      # click the log in button at the top left of the homepage
      click_on("login")
    else
      visit_page('sign in')
    end

    # access user details from hash above
    user_details = SIGNIN_DETAILS[user_type.to_sym][user_login_type]
    # Changed on 12/05/2015 to comply with the new names of the input fields.
    fill_in 'login', :with => user_details[0]
    fill_in 'password', :with => user_details[1]
    fill_in 'login_scope', :with => user_details[2] if user_details.count > 2

    # click the login button at bottom of form
    # (xpath is same on homepage and signin page)
    click_on("login and play")
	sleep(1)
  end
end

World(SigninWorld)
