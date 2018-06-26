Then(/^I should be told that I cannot access the house as I am a guest$/) do
  # 1. the house panel should say House (closed)
  page.should have_content ("House (closed)")
  # 1.b if they click on that, they should see the "house closed to guests" message
  find(".header", :text => "House (closed)").click()
  page.should have_content ("House closed")
  page.should have_content ("Sorry! The Sumdog House isn't available for guests.")
  find("a", :text => "Done").click
  # 2. if the user goes to their profile then clicks on "Change" near their avatar, they should see an error message.
  find(".header", :text => "Guest").click()
  find("#profile_panel_content > div.sub_panel.avatar > div.field_set > div:nth-child(1) > div.value > a").click()
  page.should have_content ("Sorry! The Sumdog House isn't available for guests.")
end


Then(/^I should see a clothes panel$/) do
  click_on_panel ("wardrobe")
  should_be_on? ("wardrobe")
end
