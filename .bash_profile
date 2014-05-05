# For easier nagivagation
alias ..='cd ../'
alias ...='cs ../../'

# Aliases
alias ll='ls -al'
# ls with -G use color, -F add signs after directory of links etc.
alias ls='ls -GFh'
# Show disk usage within a folder. This will list only a folder right inside it.
alias du='du -h -d 1'

# Shortcuts
alias ~='cd ~/'
alias dl='cd ~/Downloads'
alias db='cd ~/Dropbox'
alias code='cd ~/Codes'
alias www='cd /Library/WebServer/Documents/'

alias br='. ~/.bash_profile' # or use "source ~/.bash_profile" command to reload bash profile alternatively 

# Apps Shortcuts
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias qtp='/Applications/QuickTime\ Player.app/Contents/MacOS/QuickTime\ Player'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim' # Use MacVim's Vim instead of default vim

alias apache='sudo apachectl'

# Paths
ANDROID_SDK=/Users/nauval/android-sdks/platform-tools 
SYS_BIN=/bin:/sbin
LOCAL_BIN=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin

# TOM section
TOM_HOME=$HOME/Apps/tom
CLASSPATH=$TOM_HOME/lib/tom-runtime-full.jar:$CLASSPATH

# colorize ls
export CLICOLOR=1 
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colorize "username@hostname:cwd $" line
# The colors are preceded by an escape sequence \e and defined by a color value, 
# composed of [style;color+m] and wrapped in an escaped [] sequence
# Ref: https://wiki.archlinux.org/index.php/Color_Bash_Prompt#Step_by_step
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[1;31m\]\h\[\e[0m\]:\[\e[0;35m\]\w\[\e[0m\]\$ '

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Export TOM env
export TOM_HOME=$TOM_HOME
export CLASSPATH=$CLASSPATH

export PATH=$SYS_BIN:$LOCAL_BIN:$ANDROID_SDK:$TOM_HOME/bin:$PATH

# RubyEnv init
eval "$(rbenv init -)"

# Set stty to ixon to enable <C-s> in vim. Ref http://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
stty -ixon

# The next line updates PATH for the Google Cloud SDK.
source /Users/nauval/Apps/google-cloud-sdk/path.bash.inc

# The next line enables bash completion for gcloud.
source /Users/nauval/Apps/google-cloud-sdk/completion.bash.inc
