my_set = {1, 3, 5}
my_dict = {"name": "Jose", "age": 90} #dictionaeries are useful because we can store data in them
another_list = {1:1, 2:2, 3:4, 4:8} #could be useful for sequences

#we can put anything as a key, for example tuple, list, sets and another dictionaeries

lottery_player = {
    "name" : "Lach",            #don't forget the comma
    "numbers" : (1,2,5,7,42)
}


universities = [
    {
        "name": "Oxford",
        "location": "UK"
    },
    {
        "name": "MIT",
        "location": "US"
    }
]
#dictionaeries are used to represent something

#we can access a specific key and preform a method on it. Example:
sum(lottery_player["numbers"]) #this will sum the numbers of the lottery_player

#we can change the key value

lottery_player["name"] = "John"
