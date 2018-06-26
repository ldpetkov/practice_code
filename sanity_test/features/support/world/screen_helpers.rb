# These are functions extracted from Rukuli
# Please add more functions if you find them useful.
module ScreenHelpers
  # probably not in use (has been moved to env.rb)
  def set_up_screen
    @screen = Rukuli::Screen.new
  end

  def click_image(name, wait_time = 1, max_image_wait_time = 10)
    wait_for_image(name, max_image_wait_time)
    @screen.click(name + '.png')
    # screen can be unstable after click, wait a moment
    sleep(wait_time)
  end

  def hover_image(name)
    wait_for_image(name, 10)
    @screen.hover(name + '.png')
    # screen can be unstable after hover, wait a moment
    sleep(1)
  end

  def wait_for_image(name, seconds)
    clear_up_sessions([Capybara.session_name])
    @screen.wait(name + '.png', seconds)
  end

  def image_exists?(name)
    clear_up_sessions([Capybara.session_name])
    @screen.exists(name + '.png')
  end
end
World(ScreenHelpers)
