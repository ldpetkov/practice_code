module Classes

  def get_id(nameofclass)
    old = current_path
    visit_page('all classes')
    page.all(:xpath, "//a[text()=\"#{nameofclass}\"]")[0].click
    id = current_path[/\d+(?=\/?$)/]
    visit_page(old)

    return id
  end

  def delete_class(nameofclass)
    old = current_path.chomp('/')
    id = get_id(nameofclass)

    visit_page('edit classes')

    click_on_xpath("//*[@id=\"selected_#{id}\"]")
    click_on("edit classes: delete class")
    click_on("edit classes: confirm delete")
    click_on("edit classes: save changes")

    visit_page(old)
  end
end
World(Classes)
