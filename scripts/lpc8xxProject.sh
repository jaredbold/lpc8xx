#!/bin/bash
###############################################################################
# Author: Jared Bold
# Date:   6/3/2016
# Description:
#   Sets up a new project directory for an LPC8XX project
###############################################################################

# Parse the command line
if [ $# == "0" ]; then
  HELP=1
fi

while [[ $# > 1 ]]
do
  KEY="$1"
  case $KEY in 
    -p|--project)
      PROJ="$2"
      shift
      ;;
    *)
      HELP=1
      ;;
  esac
  shift
done

if [ $HELP ]; then
  echo "todo - help"
  exit 1
fi

# Determine paths
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJ_PATH="$PWD/$PROJ"

# Folders to create
PROJ_SRC="$PROJ_PATH/src"
PROJ_DOC="$PROJ_PATH/doc"
PROJ_INCLUDE="$PROJ_PATH/include"

# Folders to hardlink
RSRC_PATH="$SCRIPT_PATH/../rsrc"
PROJ_RSRC="$PROJ_PATH/rsrc"

# Files to hardlink
MAKEFILE="$SCRIPT_PATH/Makefile"
PROJ_MAKEFILE="$PROJ_PATH/Makefile"

# Create the project
echo "Creating project directory: $PROJ_PATH"
if [ -e $PROJ_PATH ]; then
  echo "$PROJ_PATH already exists. Exiting."
  exit 1
else
  echo "mkdir $PROJ_PATH"
  mkdir $PROJ_PATH
fi

# Make the required directories
echo "Setting up directories within $PROJ_PATH"
mkdir $PROJ_SRC
mkdir $PROJ_DOC
mkdir $PROJ_INCLUDE

# Hard link the required files and directories
echo "Linking required directories"
ln $RSRC_PATH $PROJ_RSRC
echo "Linking required files"
ln $MAKEFILE $PROJ_MAKEFILE

