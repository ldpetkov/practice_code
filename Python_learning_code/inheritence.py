class Student:
    def __init__ (self,name,school):
        self.name = name
        self.school = school
        self.marks = []

    def average(self):
        return sum(self.marks) / len(self.marks)
    @classmethod
    def friend(cls, origin, friend_name, *args, **kwargs):
        #return new Student called 'friend_name' in the same school as self
        return cls(friend_name, origin.school, *args, **kwargs)  #cls =  class name

anna = Student("Anna", "Oxford")


##

class WorkingStudent(Student): #coppies the information from the class Student
    def __init__ (self,name, school, salary, job_title):  #adds to the method
        super().__init__(name, school)          #this takes the information about name, school from Student
        self.salary = salary
        self.job_title = job_title



ron = WorkingStudent("Ron", "Oxford", 20.00, "tester")
print(ron.salary)

new_friend = WorkingStudent.friend(ron, "Harry", 30.00, job_title = "QA")
print(new_friend.salary)
print(new_friend.job_title)
