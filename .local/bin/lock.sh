#!/bin/sh

imgs=("handsoff.png" "itslocked.png")
selected_img=${imgs[ $RANDOM % ${#imgs[@]} ]}
echo $selected_img >> /tmp/SELECTEDBACKGROUND

# states: normal, clear, capslock, ver, wrong

BLANK="#00000000"

swaylock \
--ring-color="#cdd6f4" \
--line-color=$BLANK \
--separator-color=$BLANK \
--inside-color="#cdd6f466" \
--ring-clear-color="#f9e2af" \
--line-clear-color=$BLANK \
--inside-clear-color="#f9e2af66" \
--ring-caps-lock-color="#fab387" \
--line-caps-lock-color=$BLANK \
--inside-caps-lock-color="#fab38766" \
--ring-ver-color="#74c7ec" \
--line-ver-color=$BLANK \
--inside-ver-color="#74c7ec66" \
--ring-wrong-color="#f38ba8" \
--line-wrong-color=$BLANK \
--inside-wrong-color="#f38ba866" \
\
--font="JetBrainsMono Nerd Font" \
--font-size=12 \
\
--image=$HOME/data/pictures/backgrounds/$selected_img \
\
--show-failed-attempts \
--indicator-caps-lock
