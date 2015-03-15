#!/usr/bin/env bash

# Fonts
cp -R ${HOME}/.dotfiles/applications/fonts/*.ttf "${HOME}/Library/Fonts/"

# Iterm2
open "${HOME}/.dotfiles/applications/facetheheat.itermcolors"
cp -R "${HOME}/.dotfiles/applications/com.googlecode.iterm2.plist" "${HOME}/Library/Preferences/"

# Terminal
osascript <<EOD
tell application "Terminal"
    local allOpenedWindows
    local initialOpenedWindows
    local windowID
    set themeName to "facetheheat"
    (* Store the IDs of all the open terminal windows. *)
    set initialOpenedWindows to id of every window
    (* Open the custom theme so that it gets added to the list
       of available terminal themes (note: this will open two
       additional terminal windows). *)
    do shell script "open '$HOME/.dotfiles/applications/" & themeName & ".terminal'"
    (* Wait a little bit to ensure that the custom theme is added. *)
    delay 1
    (* Set the custom theme as the default terminal theme. *)
    set default settings to settings set themeName
    (* Get the IDs of all the currently opened terminal windows. *)
    set allOpenedWindows to id of every window
    repeat with windowID in allOpenedWindows
        (* Close the additional windows that were opened in order
           to add the custom theme to the list of terminal themes. *)
        if initialOpenedWindows does not contain windowID then
            close (every window whose id is windowID)
            (* Change the theme for the initial opened terminal windows
           to remove the need to close them in order for the custom
           theme to be applied. *)
        else
            set current settings of tabs of (every window whose id is windowID) to settings set themeName
        end if
    end repeat
end tell
EOD

# Sublime Text
sublime_path="${HOME}/Library/Application Support/Sublime Text*/Packages/User/"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"
cp -R "${HOME}/.dotfiles/applications/highlighter.sublime-settings" "${sublime_path}" 2> /dev/null
cp -R "${HOME}/.dotfiles/applications/Preferences.sublime-settings" "${sublime_path}" 2> /dev/null
cp -R "${HOME}/.dotfiles/applications/*.aff" "${sublime_path}" 2> /dev/null
cp -R "${HOME}/.dotfiles/applications/*.dic" "${sublime_path}" 2> /dev/null
