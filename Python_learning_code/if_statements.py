should_continue = True
if should_continue == True: #you can write if should_continue: without == True
    print("Hello")

known_people = ["John", "Anna", "Marry"]
person = input("Enter the person you know: ")

#not ideal solution, because of duplicated code
# if person in known_people:
#    print("You know this person!")

# if person not in known_people:
#    print("You don't know this person!")

#better solution
if person in known_people:
    print("You know {}!".format(person)) #this formats the string by raplacing the {} with the paramater person
else:
    print("You don't know {}!".format(person))


def who_do_you_know():
    #ask the user for people they know and split the string into a list
    people = input("Enter the names of people you know, seperated by commas: ") #example: John, Rolf, Anna, Greg
    people_list = people.split(",") #this will split the string into a list We need to ignore spaces

    people_without_spaces = []
    for person in people_list:
        people_without_spaces.append(person.strip()) #this will remove the white spaces, tabs etc
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
