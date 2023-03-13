# Update PATH variable for:
# - Ruby Gems
# - local bin repository for custom scripts
# - Go language binaries
export PATH="$HOME/Shelf/gems/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

# Set GOPATH variables for downloaded modules and my own code path
export GOPATH="/home/knave8/Shelf/golib"
export PATH="$GOPATH/bin:$PATH"
export GOPATH="$GOPATH:/home/knave8/Projects/go"

# Install Ruby Gems to a specified directory:
export GEM_HOME="$HOME/Shelf/gems"


. "$HOME/.cargo/env"
