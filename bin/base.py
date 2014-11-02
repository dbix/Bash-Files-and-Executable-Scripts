#!/opt/local/bin/python

import sys
import re

HEX = re.compile("0x[A-fa-f0-9]+")
TEN = re.compile("0|[1-9]+[0-9]*")
OCT = re.compile("0[0-9]+")
TWO = re.compile("0b[01]+")

B_16 = 16
B_10 = 10
B_8 = 8
B_2 = 2

def current_base(num):
    num = str(num)
    if HEX.match(num) != None:
        return B_16
    elif TEN.match(num) != None:
        return B_10
    elif OCT.match(num) != None:
        return B_8
    elif TWO.match(num) != None:
        return B_2
    else:
        print("Input is numerical only")
        return -1

def convert(num, tobase):
    if tobase == "16":
        return "0x{0:x}".format(num)
    elif tobase == "10":
        return "{0:d}".format(num)
    elif tobase == "8":
        return "{0:o}".format(num)
    elif tobase == "2":
        return "0b{0:b}".format(num)
    else:
        print("Usage: base.py <number: real-valued> <base: 2, 10, 16>")
        return -1

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: base.py <number: real-valued> <base: 2, 10, 16>")
    else:
        num = sys.argv[1]
        tobase = sys.argv[2]
        frombase = current_base(num)
        num = int(num, frombase)
        res = convert(num, tobase)
        print(res)