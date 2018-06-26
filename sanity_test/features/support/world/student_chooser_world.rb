module StudentChooser

  def select_students(names)
  sleep(1)
  click_on_target("button", "Clear all")

  list = find("ul.groups > li.ng-scope.expanded > ul")
  names.each do |name|
    list.find(:css, "label", :text => name).click
  end
end

end
World(StudentChooser)