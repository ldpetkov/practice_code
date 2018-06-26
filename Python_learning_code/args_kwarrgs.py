def my_method(arg1, arg2):
    return arg1 + arg2

my_method (5,6)

def my_long_method(arg1, arg2, arg3, arg4, arg5, arg6):
    return arg1 + arg2 + arg3 + arg4 + arg5 + arg6

my_long_method(1,2,3,4,5,6)

def my_list_adition(list_arg):
    return sum(list_arg)

my_list_adition([1,2,3,4,5,6]) #we have to remember that this is a list

def addition_simplified(*args): #we can pass multiple items and we don't have to worry about typing them as a lits
    return sum(args)

addition_simplified (1,2,3,4,5,6)


def  what_are_kwargs (*args, **kwargs):
    print(args)
    print(kwargs)

what_are_kwargs (12,13,14,555, name="Ron", location = "UK")
