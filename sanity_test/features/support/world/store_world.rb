module Store

  # Get item list for current selection
  def item_list
    all(:css, "div.item-grid > div.item")
  end

  # Find item by option number
  def find_item(option_number)
    items = item_list
    items[option_number]
  end

  # Get how many coins do I have
  def get_my_coins
    find("div .house-panel").find('div .footer').text.chomp(' coins').delete(',').to_i
  end

  # Get <option_number> item price
  def get_item_price(option_number)
    item = find_item(option_number)
    price = item.find(:css, "div.price").delete(',').to_i
  end 

  def buy_current_item
    find(:css, "div.buy").click
  end

  def sell_current_item
    find(:css, "div.sell").click
  end

  def get_response
    find(:css, "div.response").text
  end
  
end
World(Store)