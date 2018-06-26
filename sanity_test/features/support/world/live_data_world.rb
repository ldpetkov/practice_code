module LiveDataWorld

#def change_subject(subject, restrict = false)
#  click_on_panel("class controls")
#  find(".panel", :text =>"Choose subject").click()
#  click("Change subject") if page.has content "Changing subject will remove your existing subject and activity restrictions."
#  find(".subject-name", :text=>subject.capitalize).click
#  find(".restriction").click if restrict ##click on the restriction check box
#  find("a", :text =>"Change subject").click if restrict
#  find("a", :text=>"Done").click
#end


def change_subject(subject, restrict = false)
  ensure_on?('teacher dashboard')

  find(:css, ".dashboard-settings-panel").click
  find(:css, "a", :text => "Choose subject").click
  sleep(1)
  find(".subject-name", :text=>subject.capitalize).click
  
  if restrict
    find(:css, "form > fieldset:nth-child(2) > label:nth-child(3)").click
    find("a", :text=>"Done").click
  end
end

def toggle_restriction
  find(:css, ".dashboard-settings-panel").click
  find(:css, "a", :text => "Choose subject").click
  find(:css, "form > fieldset:nth-child(2) > label:nth-child(3)").click
  find("a", :text=>"Done").click
end

end 

World(LiveDataWorld)
