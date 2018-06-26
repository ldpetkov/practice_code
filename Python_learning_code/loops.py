my_variable = "hello"

#this will print the first element of the variable
# print(my_variable[0])

#for loop
#character is a new variable

for character in my_variable: #iterables are strings, lists, sets, tuples and more. You can run this for loop for them
    print(character)

my_list = [1,3,4,5]

for number in my_list:
    print(number ** 2)
    #** is the sign for power. It means 1^2, 3^2, etc


user_wants_number = True

while user_wants_number == True:
    # == means compare while, = gives the value
    print(10)

    user_input = input("Should we print again (y/n) ")
    if user_input != "y" and user_input != "n":
        user_input = input("Please enter (y/n) ")


    if user_input == "n":
        user_wants_number = False

    if user_input == "y":
        user_wants_number = True
