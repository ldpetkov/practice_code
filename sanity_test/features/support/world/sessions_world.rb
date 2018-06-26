module SessionsWorld
  def sessions
    return (@sessions ||= Set.new)
  end
  
  def in_session(name = :default)
   # if id != Capybara.session_name then
   #   Capybara.current_session.current_window.resize_to(0, 0)
   # end
   # 
    #Capybara.using_session(id) do
    ##  Capybara.current_session.current_window.resize_to(960, 738)
    #  yield
    #end

    Capybara.session_name = name
    Capybara.current_session.switch_to_window(Capybara.current_session.current_window)
    #Capybara.current_session.current_window.maximize()
    
    sessions << name
    
    # puts Capybara.current_session.driver.browser.manage.window.size
  end
  
  def clear_up_sessions(except = {})
    puts "Clearing up all session except #{except}"
    
    sessions.each do |id|
      unless except.include?(id) then
        Capybara.using_session(id) do
          puts "Resetting #{id}"
          Capybara.current_session.current_window.resize_to(0, 0)
        end
      end
    end
    
    #Capybara.reset_sessions!
  end
end

World(SessionsWorld)
