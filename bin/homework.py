#!/opt/local/bin/python


# I forget where I found this, but it's not mine. I found 
# it on a forum where an extremely bitter man scolded this
# kid for "trying to make a natural language processor" and
# for using two different languages in a script. I thought
# it was a cool idea so here we are.
import os 
a=0 
pi = 3.14 
b=0 
c="" 
x=int(input("Enter number of problems: "))         
while a != x: 
    a = a+1 
    b=input("%i. " % (a)) 
    b=os.popen("awk 'BEGIN {print %s}'" % (b)).read() 
    b=b[:-1] 
    c = ("%s. %s\n" % (a, b)) + c 
print ("\n%s\n" % ('\n'.join( reversed(c.split('\n')) ))) 
