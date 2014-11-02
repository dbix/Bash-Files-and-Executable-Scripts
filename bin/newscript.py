#!/opt/local/bin/python

__author__ = 'dbixler'

import os
import re
import stat

# The user has two options where
# I will make a shebang line for
# them. Those are if they are using
# python or bash.
pyfile = re.compile("[^\s]*\.py")
shfile = re.compile("[^\s]*\.sh")

# Get script's name and parent directory
filename = raw_input("New file's name:")
dir=raw_input("Parent directory (enter for default):")

if dir == "":
    # If user enters nothing, scripts go into bin
    path = "/Users/dbixler/Developer/bin/filename"
else:
    # Or use specified directory
    path = dir + os.sep + filename

# Create file
file = open(dir, "w+")

# Check if the script is python or bash
# to add a complimentary shebang line
if pyfile.match(filename):
    file.write("#!/opt/local/bin/python")
elif shfile.match(filename):
    file.write("#!/opt/local/bin/bash")
else:
    file.write("#!/opt/local/bin/")

# Close file
file.close()
# Make script executable
os.chmod(dir, stat.S_IEXEC)