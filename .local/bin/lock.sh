#!/bin/sh

BLANK='#00000000'
DEFAULT='#cdd6f4'

swaylock \
--inside-color=$BLANK      \
--ring-color=$DEFAULT      \
--line-color=$BLANK        \
--separator-color=$DEFAULT \
\
--image=$HOME/pictures/backgrounds/stabby_cat.png \
\
--show-failed-attempts
