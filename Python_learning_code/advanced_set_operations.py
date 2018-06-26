#Set operations

your_lottery_numbers = {1,2,3,4,5}
winning_numbers = {1,3,4,7,9,11}

#Because sets are unordered and uniquie, what matters is what elements are in the set.

#this will intesect the two sets. It will show a new set that contains {1,3,5}. They are in both sets
print (your_lottery_numbers.intersection(winning_numbers))

#this will unite both sets. It will print {1, 2, 3, 4, 5, 7, 9, 11} . Remember only unique elelemnts will be printed.
print(your_lottery_numbers.union(winning_numbers))

#this will print the differnce bethween the two sets It will print {3,4}
print ({1,2,3,4}.difference({1,2}))
