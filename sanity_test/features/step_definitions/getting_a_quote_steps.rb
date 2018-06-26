When(/^I click on the request a quote button$/) do
  click_on('quotes page: request a quote')
end

When(/^I order an? ?(maths|maths, reading and writing|extension|) quote(?: with an invalid )?(number of student places|date|email address|)$/) do |quote_type, invalidation|
  if quote_type == "maths"
    fill_in 'product_places_reading', with: 0
    fill_in 'product_places_writing', with: 0
  elsif quote_type == "extension"
    fill_in 'product_places_maths', with: 999
    fill_in 'product_places_reading', with: 999
    fill_in 'product_places_writing', with: 999
  end

  if invalidation == "number of student places"
    fill_in 'product_places_maths', with: 0
    fill_in 'product_places_reading', with: 0
    fill_in 'product_places_writing', with: 0
  elsif invalidation == "date"
    fill_in 'ends_on', with: 'January  1, 2001'
  elsif (invalidation == "email address")
    fill_in 'notification_email', with: 'Barmy Brit Brian Blessed Brushes Beard Beautifully'
  end

  click_on('quotes page: show prices and send quote')
end

Then(/^the quote for field should read "(.+)"$/) do |quotefor|
  page.should have_content(quotefor)
end

Then(/^I should receive an error message saying "(.+?)(?:\.*)"$/) do |error|
  page.should have_content(error)
end

Then(/^I should receive an email with the details of the ?(extension|) quote$/) do |type|
  email = (type == 'extension') ? 'subscribed' : 'teacher'
  regex = /Thanks for requesting a quote for a Sumdog subscription/
  expect(regex.match(get_last_email(email))).not_to eq nil
end

Then(/^I should get a quote summary on a new page$/) do
  # remove any trailing '/' and check whether it matches the stored path
  regex = %r{teacher\/school\/subscription_quotes\/(\d+)}
  expect(regex =~ current_path.chomp('/')).not_to eq nil
end
