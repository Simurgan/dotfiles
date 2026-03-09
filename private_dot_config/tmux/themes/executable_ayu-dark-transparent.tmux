#!/usr/bin/env bash

ayu_black="#0A0E14"
ayu_blue="#53BDFA"
ayu_yellow="#F9AF4F"
ayu_red="#EA6C73"
ayu_white="#B3B1AD"
ayu_green="#91B362"
ayu_visual_grey="#686868"
ayu_comment_grey="#5C6773"

get() {
   local option=$1
   local default_value=$2
   local option_value
   option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   tmux set-option -gq "$1" "$2"
}

setw() {
   tmux set-window-option -gq "$1" "$2"
}

set "status" "on"
set "status-justify" "left"
set "status-left-length" "100"
set "status-right-length" "100"

set "message-style" "fg=$ayu_white,bg=$ayu_black"
set "message-command-style" "fg=$ayu_white,bg=$ayu_black"

# IMPORTANT: make the bar itself transparent
set "status-style" "fg=$ayu_white,bg=default"

# Make inactive tab area transparent too
setw "window-status-style" "fg=$ayu_white,bg=default"
setw "window-status-current-style" "fg=$ayu_black,bg=$ayu_yellow"
setw "window-status-activity-style" "fg=$ayu_yellow,bg=default"

setw "window-status-separator" ""

set "window-style" "fg=$ayu_comment_grey"
set "window-active-style" "fg=$ayu_white"

set "pane-border-style" "fg=$ayu_visual_grey"
set "pane-active-border-style" "fg=$ayu_green"

set "display-panes-active-colour" "$ayu_yellow"
set "display-panes-colour" "$ayu_blue"

set "@prefix_highlight_fg" "$ayu_black"
set "@prefix_highlight_bg" "$ayu_green"
set "@prefix_highlight_copy_mode_attr" "fg=$ayu_black,bg=$ayu_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@ayu_widgets" "")
time_format=$(get "@ayu_time_format" "%R")
date_format=$(get "@ayu_date_format" "%d.%m.%Y")

set "status-right" "#[fg=$ayu_white,bg=default]  ${time_format}      ${date_format}    󰁺 #(cat /sys/class/power_supply/BAT0/capacity)% #[fg=$ayu_green,bg=default]"
# set "status-right" "#[fg=$ayu_white,bg=default]  ${time_format}    ${date_format}  #(sh -c 's=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null); if [ \"$s\" = \"Charging\" ]; then printf \"⚡ \"; else printf \" \"; fi')󰁺 #(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)% #[fg=$ayu_green,bg=default]"

set "status-left" "#[fg=$ayu_black,bg=$ayu_green,bold]  #S #{prefix_highlight}#[fg=$ayu_green,bg=default,nobold,nounderscore,noitalics]"
# set "window-status-format" "#[fg=$ayu_green,bg=default,nobold,nounderscore,noitalics]#[fg=$ayu_white,bg=default] #I  #W "
# set "window-status-current-format" "#[fg=$ayu_green,bg=$ayu_yellow,nobold,nounderscore,noitalics]#[fg=$ayu_black,bg=$ayu_yellow,nobold] #I  #W #[fg=$ayu_yellow,bg=default,nobold,nounderscore,noitalics]"
set "window-status-format" "#[fg=$ayu_green,bg=default,nobold,nounderscore,noitalics]#{?window_start_flag,,}#[fg=$ayu_white,bg=default] #I  #W "

set "window-status-current-format" "#[fg=$ayu_green,bg=$ayu_yellow,nobold,nounderscore,noitalics]#{?window_start_flag,,}#[fg=$ayu_black,bg=$ayu_yellow,nobold] #I  #W #[fg=$ayu_yellow,bg=default,nobold,nounderscore,noitalics]"
# set "status-right" "#[fg=$ayu_white,bg=$ayu_black,nounderscore,noitalics]  ${time_format}    ${date_format} #[fg=$ayu_visual_grey,bg=$ayu_black]#[fg=$ayu_visual_grey,bg=$ayu_visual_grey]#[fg=$ayu_white, bg=$ayu_visual_grey]${status_widgets} #[fg=$ayu_green,bg=$ayu_visual_grey,nobold,nounderscore,noitalics]#[fg=$ayu_black,bg=$ayu_green,bold] #h "
# set "window-status-format" "#[fg=$ayu_black,bg=$ayu_black,nobold,nounderscore,noitalics]#[fg=$ayu_white,bg=$ayu_black] #I  #W #[fg=$ayu_black,bg=$ayu_black,nobold,nounderscore,noitalics]"
# set "window-status-current-format" "#[fg=$ayu_black,bg=$ayu_yellow,nobold,nounderscore,noitalics]#[fg=$ayu_black,bg=$ayu_yellow,nobold] #I  #W #[fg=$ayu_yellow,bg=$ayu_black,nobold,nounderscore,noitalics]"
#
# set "status-left" "#[fg=$ayu_black,bg=$ayu_green,bold]   #S #{prefix_highlight}#[fg=$ayu_green,bg=default,nobold,nounderscore,noitalics]"
#
# set "window-status-format" "#[fg=$ayu_white,bg=default] #I  #W "
#
# set "window-status-current-format" "#{?window_start_flag,#[fg=$ayu_green,bg=$ayu_yellow,nobold,nounderscore,noitalics],}#[fg=$ayu_black,bg=$ayu_yellow,nobold] #I  #W #[fg=$ayu_yellow,bg=default,nobold,nounderscore,noitalics]"
