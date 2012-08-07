# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wedisagree"

alias sourcez="source ~/.zshrc"
alias matez="slime ~/.zshrc"
alias rm="rm -r"

alias gitrm='git ls-files --deleted -z | xargs -0 git rm'
alias push='git push origin $(current_branch)'
alias pr='open "https://github.com/orta/energy/pull/new/artsy:dev...$(current_branch)"'

alias energy="cd ~/spiel/ios/energy;git status"
alias puttio="cd ~/spiel/ios/puttio;git status"

alias startredis="redis-server /usr/local/etc/redis.conf"

plugins=(git ruby github osx)

source $ZSH/oh-my-zsh.sh
for file in ~/dotfiles/.{exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done

GIT_AUTHOR_NAME="Orta Therox"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="orta.therox@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/sbin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# make hub be git
eval "$(hub alias -s)"

tab(){
	osascript -e "
	tell application \"System Events\"
		tell process \"iTerm\"
			click menu item \"Split Vertically With Current Profile\" of menu 1 of menu bar item \"Shell\" of menu bar 1
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

branch(){
	git branch --track "$1"
	git checkout "$1"
}

closebranch(){
	OldBranch=$(current_branch)
	git checkout dev
	git merge $OldBranch
	git branch -D $OldBranch
}

export EDITOR="slime -w"
export GEM_EDITOR="slime"
export PATH=/usr/local/rvm/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"