#!/opt/local/bin/sh

#  .bash_profile
#  
#
#  Created by Derek Bixler on 11/2/14.
#


# Source other files first
if [ -f /etc/bashrc ]; then
    . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

if [ -f ~/.bashrc ]; then
. ~/.bashrc   # --> Get functions and alias(es) from ~/.bashrc, if present.
fi

if [ -f ~/.profile ]; then
. ~/.profile   # --> Get paths from ~/.profile, if present.
fi

###############################################################################
# Terminal Colors                                                             #
###############################################################################
# Text options
# \a		an ASCII bell character (07)
# \d		the date in "Weekday Month Date" format (e.g., "Tue May 26")
# \D{format}	the format is passed to strftime(3) and the result
#       is inserted into the prompt string an empty format
#       results in a locale-specific time representation.
#       The braces are required
# \e		an ASCII escape character (033)
# \h		the hostname up to the first `.'
# \H		the hostname
# \j		the number of jobs currently managed by the shell
# \l		the basename of the shell's terminal device name
# \n		newline
# \r		carriage return
# \s		the name of the shell, the basename of $0 (the portion following
#       the final slash)
# \t		the current time in 24-hour HH:MM:SS format
# \T		the current time in 12-hour HH:MM:SS format
# \@		the current time in 12-hour am/pm format
# \A		the current time in 24-hour HH:MM format
# \u		the username of the current user
# \v		the version of bash (e.g., 2.00)
# \V		the release of bash, version + patch level (e.g., 2.00.0)
# \w		the current working directory, with $HOME abbreviated with a tilde
# \W		the basename of the current working directory, with $HOME
#      abbreviated with a tilde
# \!		the history number of this command
# \#		the command number of this command
# \$		if the effective UID is 0, a #, otherwise a $
# \nnn		the character corresponding to the octal number nnn
# \\		a backslash
# \[		begin a sequence of non-printing characters, which could be used
#       to embed a terminal control sequence into the prompt
# \]		end a sequence of non-printing characters

# Prints available colors and corresponding codes
colors() {
local fgc bgc vals seq0

printf "Color escapes are %s\n" '\e[${value};...;${value}m'
printf "Values 30..37 are \e[33mforeground colors\e[m\n"
printf "Values 40..47 are \e[43mbackground colors\e[m\n"
printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

# foreground colors
for fgc in {30..37}; do
# background colors
for bgc in {40..47}; do
fgc=${fgc#37} # white
bgc=${bgc#40} # black

vals="${fgc:+$fgc;}${bgc}"
vals=${vals%%;}

seq0="${vals:+\e[${vals}m}"
printf "  %-9s" "${seq0:-(default)}"
printf " ${seq0}TEXT\e[m"
printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
done
echo; echo
done
}

# Color defs
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

# Customize prompt
case $TERM in
xterm*|rxvt*)
TITLEBAR='\[\033]0;\u ${NEW_PWD}\007\]'
;;
*)
TITLEBAR=""
;;
esac

UC=$COLOR_BLACK               # user's color
[ $UID -eq "0" ] && UC=$COLOR_RED   # root's color

# Custom bash prompt via kirsle.net/wizards/ps1.html
#export PS1="${COLOR_LIGHT_BLUE}\${PWD}${COLOR_LIGHT_BLUE}→${COLOR_NC}"
export PS1="${PWD}→"

###############################################################################
# Miscellaneous                                                               #
###############################################################################
# Bash completion
if [[ -f /opt/local/etc/profile.d/bash_completion.sh ]];
    then . /opt/local/etc/profile.d/bash_completion.sh
fi

# Restart automatically if the computer freezes
# sudo
systemsetup -setrestartfreeze on

# Self explanatory
export MSG_GREETING="
${COLOR_RED}********************************************************************************
${COLOR_WHITE}********************************************************************************
${COLOR_BLUE}********************************************************************************
${COLOR_RED}********************************************************************************
${COLOR_WHITE}********************************************************************************
${COLOR_BLUE}************${COLOR_BLACK}  ___________  ${COLOR_BLUE}********${COLOR_BLACK}   __   .__  ${COLOR_BLUE}********************************
${COLOR_RED}*************${COLOR_BLACK} \_   _____/_ __   ____ |  | _|__| ____ ${COLOR_RED}**${COLOR_BLACK} ____  ${COLOR_RED}******************
${COLOR_WHITE}*************${COLOR_BLACK}  |  /___ |  |  \_/ ___\|  |/ /  |/    \  / ___\  ${COLOR_WHITE}*****************
${COLOR_BLUE}*************${COLOR_BLACK}  |  |__/ |  |  /\  \___|    <|  |   |  \/ /_/  >  ${COLOR_BLUE}****************
${COLOR_RED}**************${COLOR_BLACK} \__ \   |____/  \___  >__|_ \__|___|  /\___  /  ${COLOR_RED}*****************
${COLOR_WHITE}***************${COLOR_BLACK}   \/               \/     \/       \//_____/  ${COLOR_WHITE}******************
${COLOR_BLUE}*****************${COLOR_BLACK}       ________                             ${COLOR_BLUE}*******************
${COLOR_RED}*********************${COLOR_BLACK}  /  _____/_  _  __ __   ____    ${COLOR_RED}**************************
${COLOR_WHITE}*********************${COLOR_BLACK}  \____   \ \/ \/ / _ \ / ___\  ${COLOR_WHITE}***************************
${COLOR_BLUE}*********************${COLOR_BLACK} _____/  / \  ^  / /_\ / /_/  >  ${COLOR_BLUE}**************************
${COLOR_RED}********************${COLOR_BLACK} /_____  /   \/ \/____  \___  /  ${COLOR_RED}***************************
${COLOR_WHITE}********************${COLOR_BLACK}       \/             \/_____/  ${COLOR_WHITE}****************************
${COLOR_BLUE}**************************    ***********          *****************************
${COLOR_RED}********************************************************************************
${COLOR_WHITE}********************************************************************************
${COLOR_BLUE}********************************************************************************
${COLOR_RED}********************************************************************************
${COLOR_WHITE}********************************************************************************
${COLOR_BLUE}********************************************************************************
"

# Greeting
echo -e "$MSG_GREETING${COLOR_NC}"