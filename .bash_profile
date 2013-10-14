# For easier nagivagation
alias ..='cd ../'
alias ...='cs ../../'

# Aliases
alias ll='ls -al'
# ls with -G use color, -F add signs after directory of links etc.
alias ls='ls -GFh'

# Shortcuts
alias ~='cd ~/'
alias dl='cd ~/Downloads'
alias db='cd ~/Dropbox'
alias dc='cd ~/Codes'



# Paths
ANDROID_SDK=/Users/nauval/android-sdks/platform-tools 
SYS_BIN=/bin:/sbin
LOCAL_BIN=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin

# colorize ls
export CLICOLOR=1 
export LSCOLORS=ExFxBxDxCxegedabagacad

# Colorize "username@hostname:cwd $" line
# The colors are preceded by an escape sequence \e and defined by a color value, 
# composed of [style;color+m] and wrapped in an escaped [] sequence
# Ref: https://wiki.archlinux.org/index.php/Color_Bash_Prompt#Step_by_step
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export PATH=$SYS_BIN:$LOCAL_BIN:$ANDROID_SDK:$PATH

# RubyEnv init
eval "$(rbenv init -)"
