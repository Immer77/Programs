#Created lists

mylist = ["Cherry","Apples","cuka"]

#Create Empty list for later to append items to list
mylist2 = list()

#Append til list
mylist2.append("Cherry")

#Insert i specifik index
mylist2.insert(0, "Tis")

#Remove last item in the list
mylist2.pop()

#Remove specifik Array.
mylist2.remove(1)

#Reverse List
mylist2.reverse()

#Sort list
mylist2.sort()

#Create new list from previous list
new_list = sorted(mylist2)

#Take input from specific index
a = mylist[1:3]
a = mylist[::3]

#Copying Lists
list_org = ["Banana","Cherry","Apple"]
list_cpy = list_org.copy
 
#Multiply list
mylist = [1,2,3,4,5,6]
b = [i*i for i in mylist]

#Iterate over lists
for i in mylist:
    print(i)

#Check if there is anyting in the lists
if "Cherry" in mylist:
    print("yes")
else:
    print("no")

#Check length of list
print(len(mylist))

