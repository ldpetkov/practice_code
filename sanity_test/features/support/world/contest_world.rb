module Contest

  def in_contest?
    ensure_on?("teacher dashboard")
    find(:css, ".contests-panel").click
    find(:css, "a.button", :text => "Entries").click
    find(:css, ".contests-entries-table").has_content?("AutomateSanityClass")
  end

end
World(Contest)