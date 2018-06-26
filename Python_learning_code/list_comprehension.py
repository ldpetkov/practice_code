my_list = [1,2,3,4,5]
my_equal_list = [x for x in range(5)] #the first x will be the element, then there is a loop where it takes x and gives it the first value of range(5)
multiply_list = [x*3 for x in range(5)] #this list contains the elements in range(5) multiplied by 3
print(multiply_list)

# 8 % 3 gives us 2. This gives us the remider. It is called modulus
#every number modulus 2 that results to 0, will be even

even_list = [n for n in range(10) if n % 2 == 0] #gives us a list with even numbers from 0 to 10
print(even_list)

people_you_know = ["Rolf", "John", "anna", "RON"] #list with people
normilised_people = [person.strip().lower() for person in people_you_know] #this removes the white spaces and turns them all to lower caseself.
print(normilised_people)

#simplify the code from the last exerceise
def who_do_you_know():
    #ask the user for people they know and split the string into a list
    people = input("Enter the names of people you know, seperated by commas: ") #example: John, Rolf, Anna, Greg

    people_list = people.split(",") #this will split the string into a list We need to ignore spaces

    people_without_spaces = [person.strip() for person in people_list] #this adds the loop in the definition of the list +

    #people_without_spaces = []
    #for person in people_list:
    #    people_without_spaces.append(person.strip()) #this will remove the white spaces, tabs etc
    return people_without_spaces

def ask_user():
    #ask user for a name
    #See if their name is in the list of people they know.
    #Print out that they know the person.
    ask_name = input("Enter a name of someone you know: ")
    if ask_name in who_do_you_know():
        print("You know {}!".format(ask_name))
    else:
        print("You don't know {}!".format(ask_name))

ask_user()
