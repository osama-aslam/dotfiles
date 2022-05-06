# Function to source files if they exist

function add_file() {
    [ -f "$ZDOTDIR/files/$1" ] && source "$ZDOTDIR/files/$1"
}

# Function to source plugins if they exist

function add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/files/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
        add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/files/plugins/$PLUGIN_NAME"
    fi
}
