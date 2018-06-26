## Video 1
#variables that are numbers
a = 5
b = 10
my_variable = 56

#variables that are strings
string_variable = "hello"
single_quolate = 'strings can have single quotes'

#The function print
print(string_variable)
print("hello world")


## Video 2

#definind a new method

def my_print_method():
    print ("Hello_method")
    print ("world_method")

#running a new method
my_print_method()

#definind a new method with an my_argument
def my_print_method_argument(my_argument):
    print (my_argument)

#running a new method with an my_argument
my_print_method_argument("Hello argument")


#my_multiply_method
def my_multiply_method(number_one, number_two):
    return number_one * number_two

result = my_multiply_method(5, 6)
print(result)

#we can nest methods, example:
my_print_method_argument(my_multiply_method(5,3))
