require 'gmail'
module EmailWorld
  # email_extension is used to match e-mails, is saved when account created.
  def get_first_email(user_type, email_extension = '')
    gmail   = Gmail.new('sanity@sumdog.com', 'crocodile')
    i       = gmail.inbox
    # checks for 10 seconds whether email has arrived
    puts "checking for email"
    check_for_new_email(user_type, email_extension, gmail)
    # get the first email that is sent to the account whose email_extension matches

    email = i.emails(to: "sanity+#{user_type}#{email_extension}@sumdog.com").first.body.decoded
    gmail.logout

    email
  end

  # very similar to get_first_email - can be refactored?
  def get_last_email(user_type, email_extension = '')
    gmail   = Gmail.new('sanity@sumdog.com', 'crocodile')
    i       = gmail.inbox
    # checks for 10 seconds whether email has arrived
    check_for_new_email(user_type, email_extension, gmail)
    # get the last email that is sent to the account whose email_extension matches
    email = i.emails(to: "sanity+#{user_type}#{email_extension}@sumdog.com").last.body.decoded
    gmail.logout

    email
  end

private

  def check_for_new_email(user_type, email_extension, mailbox)
    c = 0
    ibx = mailbox.inbox
    max = 30
    until ibx.count(to: "sanity+#{user_type}#{email_extension}@sumdog.com@") > 0 || c > max
      sleep 1
      puts "Waited #{c} seconds"
      puts ibx.count(to: "sanity+#{user_type}#{email_extension}@sumdog.com@")
      mailbox.imap.check
      c += 1
    end
  end
end

World(EmailWorld)
