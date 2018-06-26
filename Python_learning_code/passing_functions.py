def methofception(another):
    return another()

def add_two_methods():
    return 33 +77

# print(methofception(add_two_methods))

# print (methofception(lambda: 33 + 77))


my_list = [13, 56, 77, 444]

# my_list.remove(13)
# print(my_list)


(lambda x: x*3)(5)

#same as
def f(x):
    return x*3

f(5)



print(list(filter(lambda x: x != 13 , my_list)))

def not_13(x):
    return x!=13

print(list(filter(not_13,my_list)))

#lambda are useful for filtering

print([x for x in my_list if x !=13])
