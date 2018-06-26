my_variable = "hello"

grade_one = 77
grade_two = 80
grade_three = 90

#not sustainable because every time I add a grade it will make me change the code

print ((grade_one + grade_two + grade_three / 3))

# declaring a list. The list can increase the size.
grades_list = [77,80,90,95,100]

print(sum(grades_list) / len(grades_list))
#len(grades) gives us the number of elements in the list
#sum(grades) gives us the sum of the elements in the list.

#tuple is like a list, but it can not change its size.
#There is not way of increasing the size of the tuple
#You can not change the values of the tuple
# The tuple is imutable
grades_tuple = (77,80,90,95,100)

#Even tho I can't add the value at the end of the tuple, I can change the tuple with this specific syntax:
grades_tiple = grades_tuple + (200,) # it must need to have a comma! If there is no comam it will be just a number and not an element
#What this made is that it did not change the tuple, but it crated a new one with the same name and added the elemnt 100 at the end


#You can change the size of the list.
#grades_list,append addds the element 100 at the end of the list.
grades_list.append(100)

#declaring sets
#sets are unique & unordered. If you print the set it will give you the variables in a random order. ALso it will print only the unique variables. Therefore, 20 will be printed only once
grades_set = {5,10,15,20, 20}

print (grades_list[0])

#this will print the 0st elemnt of the list.

grades_list[0] = 40
#THis changes the 0th element to 40

print (grades_list)

### this will give an error because tuple is imutable
# grades_tuple[0] = 20

### this will give an error because sets are unordered, thereofre you don't know which eleemnt is the 0th
# grades_set[0] = 40

# But we can add the ele3men to the set
set_grades.add(40)
