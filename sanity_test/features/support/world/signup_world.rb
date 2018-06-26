module SignUpWorld

  def sign_up_and_confirm_email(user_type)
    # may want to remove and_click_confirmation_link from title
    visit_page("#{user_type} sign up")
    timestamp = Time.now.to_i
    complete_sign_up_form(user_type, timestamp)
    confirm_email(user_type, timestamp)
  end

  def complete_sign_up_form_with_names(user_type, timestamp, first_name, surname)
    # the timestamp here will usually be called as Time.now.to_i
    # unless the scenario requires the user to be stored, in which case
    # it should be stored in a variable before passing in.
    fill_in_sign_up_form_with_names(user_type, timestamp, first_name, surname)
    find("label", :text => "I accept Sumdog's ").click()
    find("a", :text => "Sign up").click()
  end
  
  def fill_in_sign_up_form_with_names(user_type, timestamp, first_name, surname)
    details = {
        first_name:            first_name,
        last_name:             surname,
        email:                 "sanity+#{user_type}#{timestamp}@sumdog.com",
        password:              "qwe",
        password_confirmation: "qwe"
    }
    # fill out form with details from sign_up_info hash
    %w(first_name last_name email password password_confirmation).each do |field|
        fill_in "user_#{field}", with: details.fetch(field.to_sym)
    end
  end  

  
  
  def complete_sign_up_form(user_type, timestamp, validity = :valid, name =nil)
    # the timestamp here will usually be called as Time.now.to_i
    # unless the scenario requires the user to be stored, in which case
    # it should be stored in a variable before passing in.
    name = timestamp if name == nil
    fill_in_sign_up_form(user_type, validity, name)
    find("label", :text => "I accept Sumdog's ").click()
    find("a", :text => "Sign up").click()
  end
  

  def fill_in_sign_up_form(user_type, validity, timestamp)
    details = get_sign_up_info(timestamp, user_type, validity)
    # fill out form with details from sign_up_info hash
    %w(first_name last_name email password password_confirmation).each do |field|
        fill_in "user_#{field}", with: details.fetch(field.to_sym)
    end
  end

private

  ALL_DETAILS = {
    teacher: {
      first_name:            'Signup',
      last_name:             'McCulloch',
      password:              'crocodile',
      password_confirmation: 'crocodile'
    },
    parent:  {
      first_name:            'Signup',
      last_name:             'McCulloch',
      password:              'qwe',
      password_confirmation: 'qwe'
    }
  }.freeze
  
  def get_sign_up_info(timestamp = 0, user_type, validity)
    details = ALL_DETAILS.fetch(user_type.to_sym).
      merge(email: "sanity+#{user_type}#{timestamp}@sumdog.com")
    details.merge!(email: 'not an email') if validity.to_sym == :invalid
    details.merge!(password_confirmation: 'not the password') if validity.to_sym == :invalid
    details
  end

  def confirm_email(user_type, timestamp)
    email = get_first_email(user_type, timestamp)
    # find the confirmation link in the message
    link  = %r{\/user\/confirmation\?confirmation_token=\w+}.match(email).to_s
    visit link
  end


end

World(SignUpWorld)
