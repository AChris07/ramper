#!/usr/bin/env bash

VIM_CONFIG_URL=https://raw.githubusercontent.com/AChris07/vim-config/master/install.sh
HOMEBREW_CONFIG_URL= https://raw.githubusercontent.com/AChris07/brew-config/master/install.sh

if [ $(command -v curl &> /dev/null; printf $?) -ne 0 ]; then
  VIM_SETUP=`curl -o- $VIM_CONFIG_URL | bash`
  HOMEBREW_SETUP=`curl -o- $HOMEBREW_CONFIG_URL | bash`
elif [ $(command -v wget &> /dev/null; printf $?) -ne 0 ]; then
  VIM_SETUP=`wget -qO- $VIM_CONFIG_URL | bash`
  HOMEBREW_SETUP=`wget -qO- $HOMEBREW_CONFIG_URL | bash`
else
  echo "Could not find curl or wget. Please install one of these and try again. Aborting..." 1>&2
  exit 128
fi

function ramp_mac() {
  echo "Starting up MacOS ramping process..."
  
  echo "Setting up Prezto..."


  echo "Launching VIM configurer..."
  eval $VIM_SETUP

  echo "Launching Brew configurer..."
  eval $HOMEBREW_SETUP

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
