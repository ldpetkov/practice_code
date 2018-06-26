module GameWorld

  def switch_to_maths()
    find("div.subjects-panel").click()
    find(:xpath, '//*[@id="app"]/div[1]/div[3]/ul/li[1]/a/div').click()
  end

  def start_game(game_name)
    choose_game(game_name)
    sleep(1)
	
	# make sure not to click on the pet
	page.driver.execute_script(
	"var pet = document.getElementsByClassName('scene-pet')[0];
	 if (pet !== undefined) {
	   pet.parentNode.removeChild(pet);
	 }
	")
	
    find(".scene-input").click()
    # click_on("hangout: start game")
  end

  def choose_opponent(opponent)
    click_on_xpath('//*[@id="game_settings_panel"]/div[2]')
    sleep(1)
    click_on_xpath("//*[@id=\"game_settings_panel\"]/div/div/ul/li/div[text()=\"#{opponent}\"]/..")
  end

  def choose_game(game_name)
    unless find("div.subjects-panel.panel.ng-isolate-scope > div.ng-scope > div.header").text == "Writing"
      navigate_to_game_from_map(game_name)
    else
      choose_game_by_url(game_name)
    end
  end

  def navigate_to_game_from_map(game_name)
    #click_on_panel("games")
    find("div.games-panel-city").click
    # change game_name to be the name of the game used in the URL
    game_name = GAMES[game_name] unless GAMES[game_name].nil?
    find(:css, "li.game-button.game_#{game_name}").click # navigate to game
  end

  def choose_game_by_url(game_name)
    if ['Lies', 'Secret', 'Snake', 'Candy'].include? game_name
      visit_page("/city/writing?game=#{GAMES[game_name]}")
    else
      visit_page("/city?game=#{GAMES[game_name]}")
    end
  end

  def quit_game
    wait_for_image('game_menu', 10)
    hover_image('game_menu')
    click_image('game_exit')
  end

  def leave_endscreen   
    click_on("endscreen: next")
    sleep(2)
    page.should have_content('Corrections')
    click_on("endscreen: next")
  end

  def assert_game_is_chosen(game_name)
    game_name = GAMES[game_name] unless GAMES[game_name].nil?
    # page.should have_content('.scene-slider>ul>.#{game_name}')
  end

  def game_is_chosen?(game_name)
    p = "//div[text()=\"#{game_name}\"]"
    page.has_selector?(:xpath, p)
  end

  def game_is_playing?(game_name)
    should_be_on_regex?(%r{.+game/play/#{GAMES[game_name]}(?:\?.+)?})
  end

  def play_game(game_answer_box)
    time_between_answers = 0.8
    # max number of answers is game length divided by answer time
    max_no_of_answers = 80 / time_between_answers
    no_of_answers = 0

    # wait for game to start before attempting to play
    wait_for_image('game_menu', 10)
    # click answers until the end screen appears or time runs out
    until current_url.include?('game_end') || no_of_answers >= max_no_of_answers
      click_image(game_answer_box, time_between_answers, 0)
      no_of_answers += 1
    end
  end

  # Some games don't end after 80s, like creeper or chef. suggest you add another attribute to the 
  # hash below with the actual end time of a game.

  GAMES = {
    "Animals"          => "animal",
    "Chef"             => "chef",
    "Snowball"         => "snowball",
    "Haircut"          => "haircut",
    "Diner Defense"    => "dinerdefense",
    "Junk Pile"        => "junkpile",
    "Dress Down"       => "dressdown",
    "Endangered"       => "endangered",
    "Street Racer"     => "racing",
    "Creeper"          => "towerbuilder",
    "Bunny Hop"        => "bunnyhop",
    "Tower Climber"    => "towerclimber",
    "Dream Jigsaw"     => "jigsaw",
    "Talent Show"      => "talentshow",
    "Athletics"        => "worldcup",
    "Touchdown"        => "americanfootball",
    "Starship"         => "starship",
    "Tennis Tie-break" => "tennis",
    "Disguise"         => "disguise",
    "Kiteboarding"     => "kiteboarding",
    "Submarine"        => "submarine",
    "Jet-Ski Rescue"   => "jetski",
    "Pop Tune"         => "poptune",
    "Basketball"       => "basketball",
    "Alien Invaders"   => "alieninvaders",
    "Penalty Shootout" => "penalty",
    "Holi"             => "holi",
    "Secret"           => "secret",
    "Lies"             => "lies",
    "Snake"            => "snake",
    "Candy"            => "candy",
    "Bubble Gum"       => "bubblegum"
  }
end
World(GameWorld)
