#!/opt/local/bin/sh

#  .bashrc
#
#
#  Created by Derek Bixler on 8/5/14.
#

###############################################################################
# Alias(es)                                                                   #
###############################################################################
alias matlab='matlab -nodesktop'  # Launch MATLAB on the command line
alias pos='port search' # Lazy port search
alias poi='sudo port install' # Lazy port install
alias pou='port upgrade installed'
alias la='ls -a' # list all including hidden

###############################################################################
# Functions                                                                   #
###############################################################################
# "Here string" echo to stdout
hechout()
{
    cat <<< "$@";
}

# "Here string" echo to stderr
hecherr()
{
    cat <<< "$@" 1>&2;
}

# String to array
# stoa(input) = echo ret
# stoa(input, output) => output=ret
stoa()
{
    input=$1
    output=$2
    read -r -a $output <<< "$input";
    if [[ "$output" ]]; then
        eval $output
    else
        for i in "${sarray[@]}"
            do echo "$i"
    done
    fi
}

# Give myself ownership over folder
i_own()
{
    DIR=$(pwd)
    sudo chown "$USERNAME" "$DIR"
}

# Create dir if nonexistent
function touch_dir()
{
    if [ ! -d "$@" ]
        then mkdir "$@"
    fi
}

# Show hidden files
showfiles()
{
    defaults write com.apple.finder AppleShowAllFiles YES;
    killall Finder;
}

# Hide hidden files
hidefiles()
{
    defaults write com.apple.finder AppleShowAllFiles NO;
    killall Finder;
}

# Make Safari do something useful
safaridevon()
{
    # Enable the Develop menu and the Web Inspector in Safari
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

    # Add a context menu item for showing the Web Inspector in web views
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
}

# Stop making Safari do something useful
safaridevoff()
{
    # Enable the Develop menu and the Web Inspector in Safari
    defaults write com.apple.Safari IncludeDevelopMenu -bool false
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool false
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool false

    # Add a context menu item for showing the Web Inspector in web views
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool false
}
