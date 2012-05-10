# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wedisagree"

alias sourcez="slime ~/.zshrc"
alias rm="rm -r"

plugins=(git ruby github osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/sbin/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

tab(){
	osascript -e "
	tell application \"System Events\"
		tell process \"iTerm\"
			click menu item \"Split Vertically With Same Profile\" of menu 1 of menu bar item \"Shell\" of menu bar 1
		end tell
	end tell

	tell application \"iTerm\"
	 tell the current terminal
	  tell the current session
	   write text \"cd $(pwd)\"
	   write text \"$1\"
	  end tell
	 end tell
	end tell"
}

openx(){ 
	if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
	then
	  echo "Opening workspace"
	  open *.xcworkspace
	  return
	else
	  if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
	  then
	    echo "Opening project"
	    open *.xcodeproj
	    return  
	  else
	    echo "Nothing found"
	  fi
	fi
}

gitac(){
	 git add .
	 git commit -m "$1"	
}