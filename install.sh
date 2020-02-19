#!/usr/bin/env bash

VIM_CONFIG_SCRIPT="wget -qO- https://raw.githubusercontent.com/AChris07/vim-config/master/install.sh | bash"
BREW_CONFIG_SCRIPT="wget -qO- https://raw.githubusercontent.com/AChris07/brew-config/master/install.sh | bash"

function ramp_mac() {
  echo "Starting up MacOS ramping process..."
  
  echo "Setting up Prezto..."


  echo "Launching VIM configurer..."
  ${VIM_CONFIG_SCRIPT} 

  echo "Launching Brew configurer..."
  ${BREW_CONFIG_SCRIPT}

  echo "Done! Your machine has been ramped and is ready to go!"
}

# Identify the machine type
case "$(uname -s)"  in
  Linux*)    machine=Linux;;
  Darwin*)   machine=Mac;;
  CYGWIN*)   machine=Cygwin;;
  *)         machine=Unknown
esac

if [ ${machine} == Linux  ]; then
  echo "Ramper is still not configured to setup a GNU/Linux machine :( Coming soon!"
elif [ ${machine} == Mac ]; then
  ramp_mac
elif [ ${machine} == Cygwin ]; then
  echo "Ramper is still not configured to setup a Cygwin (GNU/Linux) machine :( Coming soon!"
else
  echo "Ramper does not support this OS"
fi
