#!/bin/sh

# Need to find out where we are currently running from
export R_DIR="`dirname \"$0\"`"
# Need to tell R where to look for code to automatically
# execute upon startup
export R_PROFILE="$R_DIR/updateiNZightVIT.R"
export DYLD_FALLBACK_FRAMEWORK_PATH="$R_DIR/Library"
export DYLD_FRAMEWORK_PATH="$R_DIR/Library/Frameworks/R.framework"
export DYLD_LIBRARY_PATH="$R_DIR/Library/Frameworks/R.framework/Versions/3.0/Resources/lib"
export R_LIBRARIES="$R_DIR/Library/Frameworks/R.framework/Versions/3.0/Resources/library"

# Set the current directory to where R happens to be located,
# allows us to set R's current working directory when loading R.
cd "$R_DIR"

# Load R and update packages first
open -a "$R_DIR/R.app"
