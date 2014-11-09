#!/opt/local/bin/sh

#  .profile
#
#
#  Created by Derek Bixler on 8/5/14.
#

###############################################################################
# Path                                                                        #
###############################################################################
# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:/Users/dbixler/bin:$PATH"
export PATH="$PATH":"$ANDROIDSDK/platform-tools":"$ANDROIDSDK/tools"
export PATH="$PATH":"/Applications/MATLAB_R2013b.app/bin"

###############################################################################
# Variables                                                                   #
###############################################################################
# Yours truly
export USERNAME="dbixler"

# Programs
export EDITOR="/usr/bin/xed"
export SHELL="/opt/local/bin/bash"
export TERM=xterm-256color
export JYTHON_HOME="/opt/local/share/java/jython"
export PYTHON_HOME="/opt/local/Library/Frameworks/Python.framework/Versions/3.4"
export MATLAB_JAVA="/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home/jre"

# Colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# SDK locations
export ANDROIDSDK="/opt/android-sdk-macosx"
export ANDROIDNDK="/opt/android-ndk-r10c"
export APPENGINESDK="/opt/appengine-java-sdk-1.9.14"
export GWT="/opt/gwt-2.6.1"

