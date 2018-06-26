
# Click on link, button, panel by its text
When(/^I click on (.+) (\w+)$/) do |target_text, target_tag|
  click_on_target(target_tag, target_text)
end

def wait_for_progression()
  progression = find(".progression-status")
  while progression.has_css?(" div > div.loading") do
    # sleep(1)
  end
end

# Click on link, button, panel by its text
When(/^I open progression status$/) do
  # Progression takes time to load occasionally
  wait_for_progression()
  click_on_target("status", "progression")
end

# Check if I am in a specified phase
When(/^I am in (Find Level|Find Skill|Focus|Prepare|Revise) phase$/) do |phase|
  # Progression takes time to load occasionally
  wait_for_progression()
  case phase
  when "Find Level"
    page.should have_css("span", :text => "WELCOME TO SUMDOG")
  else
    pending
  end
end

# Check if I can play some game
Then(/^I should be able to play (.+)$/) do |game_name|
  # TODO: better check for game play, game end, score count

  if page.has_content?("GUEST")
    find(:css, ".play", :text => "Play").click
  else
    start_game(game_name)
  end

  if page.has_content?('Writing')
    # Dont wait for players to join
    expect(page.has_content?('Waiting for players')).to eq(true)
  else
    # Check for game object
    page.should have_css("object#game")

    # Check if correct game loading
    current_url.should match(/#{GameWorld::GAMES[game_name]}/)
  end

  #Quick escape
  ensure_on?('city')
end


# Sign in as <user_type> with <conditions>
Given(/^I am signed in as a (\w+) with (.+) condition$/) do |user_type, condition|
  # Creates a new session if one with user_type name does not exist
  in_session(user_type)

  # Ensure on sign in page
  visit_page("sign in")

  # If you are already signed in, from sign in page you are rediredted to adult or city page
  # depending on weater you are loged in as a teache, parent or a student,child
  if on_page?('sign in page')
    # Sign in if the page was not redirected
    sign_in(user_type, condition)
  end
end

# Check if the avatar has loaded
Then(/^I can see the avatar$/) do
  page.should have_css("div .avatar")
end

# Check if some activity is selected
Then(/^I should be in the (.+) activity$/) do |activity_text|
  page.should have_css("div .activities-panel", :text => activity_text)
end

# Check if you can equip, change and remove clothess
# Remove depends on weather there is 'No <clothe_selection>' option
Then(/^I should be able to equip, change and remove clothes$/) do
  within("div .item-grid") do
    page.all(:css, "div .item").each do |item|
      item.click
    end
  end
end

# Check if you can purchase item and right ammount of coins are deducted
# Provide number of coins to be deducted as extra check
Then(/^I can buy and sell an item with (\d+) coins deducted and (\d+) coins refunded$/) do |coins_buy, coins_sell|
  pre_coins = 0
  pos_coins = 0

  # Buy item check ----------------------------------------------

  # Get the ammount of coins you have before purchase
  pre_coins = get_my_coins()
  # Purchase an item
  buy_current_item()
  # Check 'Item bought.' message
  message = get_response()
  expect(message).to eq("Item bought.")
  # Get the ammount of coins you have after purchase
  pos_coins = get_my_coins()
  # Check if right ammount was deducted
  expect(pos_coins).to eq(pre_coins - coins_buy.to_i)

  # Sell item check ---------------------------------------------

  # Get the ammount of coins you have before sell
  pre_coins = get_my_coins()
  # Sell an item
  sleep(1)  # There is a timer after purchase
  sell_current_item()
  # Check 'Item sold.' message
  message = get_response()
  expect(message).to eq("Item sold.")
  # Get the ammount of coins you have after sell
  pos_coins = get_my_coins()
  # Check if right ammount was refunded
  expect(pos_coins).to eq(pre_coins + coins_sell.to_i)

end

Then(/^I can select a skill and view example questions$/) do
  # Show filters
  click_on_target("button", "Show filters")

  # deselect current year group
  select_filter_option("Grades", 1)

  # Select year group
  select_filter_option("Grades", 6)

  # Select a skill
  clear_skill_plan
  select_skills_option (1)

  # Expand a skill
  expand_skills_option (1)

  # Check example questions
  open_example_question(1)
  check_example_question

  # Exit example questions
  exit_example_questions()

  # Save plan
  click_on_target("button", "Save")
end

Then(/^I should be able to generate a report$/) do
  generate_report()
  expect(report_displaying?).to eq(true)
end

When(/^I restrict students to (\w+)$/) do |subject|
  change_subject(subject, true)
end

When(/^I change subject to (\w+)$/) do |subject|
  if find(".subjects-panel").text() != subject.capitalize
    find(:css, ".subjects-panel").click
    find(:css, "a.panel", :text => subject.capitalize).click
  end
end

When(/^I select (\w+) subject$/) do |subject|
  change_subject(subject, false)
end

Then(/^I remove subject restriction$/) do
  toggle_restriction()
end

Given(/^I am in a contest$/) do
  expect(in_contest?()).to eq(true)
  find(:xpath, '//a[@class="button affirmative"]').click
  find(:css, "#home_link").click
end

When(/^I select contest activity$/) do
  switch_to_maths()
  find(:css, ".activities-panel").click
  find(:css, "a.panel", :text => "AUTOMATED-TEST-CONTEST").click
end

Then(/^I should see proficiency chart$/) do
  expect(page).to have_css(".proficiency")
end

Then(/^I should be able to hide and show (.+) data$/) do |student_name|
  proficiency_hide_student_data(student_name)
  proficiency_show_student_data(student_name)
end

# Doesn't find the hit-box circle
Then(/^I should be able to check data points$/) do
  # select data point
  find("g.skills > circle").click
  # Expand data point
  find("a.expand").click
  # Open example question
  find("ul.steps > li:nth-child(1) > a.example-question").click
  # Check example question
  check_example_question()
end

When(/^I open proficiency chart$/) do
  find(:css, ".reports-panel").click
  find(:css, "a.panel", :text => "Proficiency").click
end

When(/^I can see data$/) do
  find("circle.hit-point").click
  sleep(1)
end

When(/^I make sure I can restrict student activities$/) do
  click_on_target("panel", "dashboard-settings")
  panels = all("div.dashboard-settings-menu > ul > li")
  house_panel = panels.first
  if house_panel.has_no_css?("Click to open")

  end
end
