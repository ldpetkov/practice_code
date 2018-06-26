class Student:
    def __init__(self, name, school):
        self.name = name
        self.school = school
        self.marks = []

    def average(self):
        return sum(self.marks)/len(self.marks) #len gives us the total number of elements in the list/set/tuple It should always be self.marks. The marks are assossiated with the object


    def go_to_school(self): #it does not use self
        print("I am going to school.")

    @classmethod
    def go_to_school_2(cls): #This passes the class as an argument. It will pass class Student instead of cls
        print("I am going to school.")

    @staticmethod
    def go_to_school_3():
        print("I am going to school.") #here it does not matter who is calling the method, because it will always give us the same result.


anna = Student("Anna", "MIT")
anna.marks.append(56)
anna.marks.append(60)
print(anna.average())

rolf = Student ("Rolf", "Oxford")
Student.go_to_school_3() #calling it with Student, because the result is always the same.
