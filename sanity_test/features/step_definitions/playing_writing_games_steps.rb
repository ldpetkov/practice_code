Given(/^I am signed in as a student who does not have a writing subscription$/) do
  sign_in('student', 'global username')
end

#When(/^I change(?: my)? subject to writing$/) do
#  if find(".subjects-panel").text() != "Writing" 
#    find(".subjects-panel").click()
#    find(".panel", :text =>"Writing").click()
#  end
#end



When(/^I choose to play (.+)$/) do |game|
  choose_game(game)
  start_game(game)
end

Then(/^I should be notified that (?:.+) is a premium game$/) do
  page.should have_content('Premium game')
end

Given(/^I am signed in as a subscribed student with full writing permissions$/) do
  in_session('student') do
    sign_in('student', 'in a school with a subscription')
  end
end

When(/^the (teacher|student) chooses to play (.+)$/) do |person, game|
  person = nil if person == "teacher"
  in_session person do
    start_game(game)
  end
  sleep(2)
end

Then(/^a game of Secret should start for the teacher$/) do
  sleep(6)
  in_session do
    expect(%r{writing.+?/writing/index\.html} =~ current_url).not_to eq nil
  end
end

Then(/^a game of Secret should start for the student$/) do
  in_session('student') do
    expect(%r{writing.+?/writing/index\.html} =~ current_url).not_to eq nil
  end
  in_session do
    stop_all_live_classes
  end
end

When(/^the teacher types a rude word$/) do
  in_session do
    sleep 1 while page.has_selector?('rules')
    fill_in_contenteditable 'textinput', with: 'Oh fuck this.'
    click_on("secret: send message")
  end
end

When(/^I should start looking for players$/)do
  in_session "studentA" do
    sign_in("studentA" , "scoped username")
    start_game("candy")
  end
  in_session "studentB" do
    page.should have_content "starting"
  end
end

When(/^I have allowed students to play writing games$/) do
  in_session "teacher" do
    click_on_panel("class controls", ".footer") # click on the footer of the panel
    click_on_panel("Choose subject", ".panel")
    check "subject_writing"
    sleep 2
    check "subject-restriction"
  end
end
  
Then(/^they should see a message warning them$/) do
  in_session do
    page.should have_content("Sumdog thinks this is a rude message so he's not going to pass it to the other players. Use of bad words may lead to a ban from writing games.")
  end
end

When(/^the teacher makes a spelling mistake$/) do
  in_session do
    sleep 1 while page.has_selector?('rules')
    fill_in_contenteditable 'textinput', with: 'Ask me about liff insurance.'
    click_on("secret: send message")
  end
end

Then(/^they should be given a list of corrections to choose from$/) do
  in_session do
    page.should have_content("Did you mean?")
    page.should have_content("life")
  end
end
