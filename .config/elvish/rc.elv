set paths = [ $E:HOME'/.local/bin' $@paths ]

fastfetch
eval (starship init elvish)

fn ls { |@a| /usr/bin/ls -F --group-directories-first --color $@a }
fn la { |@a| ls -A $@a }
fn ll { |@a| la -lh $@a }
