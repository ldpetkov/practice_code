Given(/^I have two sessions open$/) do
  visit_page('homepage')
  in_session('second') do
    visit_page('homepage')
  end
end

When(/^I go to (.*) on the first session$/) do |page_name|
  in_session { visit_page(page_name) }
end
