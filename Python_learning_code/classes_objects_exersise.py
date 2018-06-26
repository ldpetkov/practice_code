class Store:
    def __init__(self, name):
        self.name = name
        self.items = []
        # You'll need 'name' as an argument to this method.
        # Then, initialise 'self.name' to be the argument, and 'self.items' to be an empty list.

    def add_item(self, name, price):
        # Create a dictionary with keys name and price, and append that to self.items.
        item =  {
            "name": name,
            "price": price
            }
        self.item.append(item)

    def stock_price(self):
        # Add together all item prices in self.items and return the total.
        total = sum(item["price"] for item in self.items)
        return total
