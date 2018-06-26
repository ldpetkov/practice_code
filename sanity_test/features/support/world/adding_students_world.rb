module AddingStudentsWorld
  def remove_all_students_from_class(class_name)
    select(class_name, from: 'class_selector')
    click_link('edit_multiple')
    find("#select_all").set(true)
    click_link('remove_selected')
    find('button.yes').click
    find('#organisation_submit').click
  end
end
World(AddingStudentsWorld)
