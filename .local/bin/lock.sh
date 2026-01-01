#!/bin/sh

BLANK='#00000000'
DEFAULT='#cdd6f4'

swaylock \
--inside-color=$BLANK      \
--ring-color=$DEFAULT      \
--line-color=$BLANK        \
--separator-color=$DEFAULT \
\
--image=$HOME/data/pictures/backgrounds/better_cat_bsod.png \
\
--show-failed-attempts
