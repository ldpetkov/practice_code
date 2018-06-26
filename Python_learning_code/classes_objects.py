#dictionarie
lottery_player = {
    "name" : "Lach",            #don't forget the comma
    "numbers" : (1,2,5,7,42)
}

class LotteryPlayer:
    def __init__(self):     #there are total of 4 _
        self.name = "Rolf"
        self.numbers = (1,2,5,7,42)

    def total(self):
        return sum(self.numbers)


player_one = LotteryPlayer()      #this creates an object from this class It will assign player.name to be Rolf and player.numbers to be the tuple
player_two = LotteryPlayer()
#objects don't only hava data, but they have actions and methods assossiated with them.

print(player_one.name)
print(player_one.total())
print(player_one == player_two) #this will give False, They are separate enteties, that share the same value. Therefore they are not the same.
