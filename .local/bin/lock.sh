#!/bin/sh

imgs=("handsoff.png" "itslocked.png")
selected_img=${imgs[ $RANDOM % ${#imgs[@]} ]}
echo $selected_img >> /tmp/SELECTEDBACKGROUND

BLANK='#00000000'
DEFAULT='#cdd6f4'

swaylock \
--inside-color=$BLANK      \
--ring-color=$DEFAULT      \
--line-color=$BLANK        \
--separator-color=$DEFAULT \
\
--image=$HOME/data/pictures/backgrounds/$selected_img \
\
--show-failed-attempts
