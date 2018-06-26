module TextboxWorld

  def fill_in_contenteditable(id, params = {})
    click_on_xpath("//*[@id=\"#{id}\"]")
    send_string_of_keys(params[:with], id)
  end
end

World(TextboxWorld)
