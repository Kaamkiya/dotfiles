set paths = [ $E:HOME'/.local/bin' $E:HOME'/go/bin' '/usr/local/go/bin' '/usr/lib/jvm/openjdk8/bin' $@paths ]

fastfetch
eval (starship init elvish)

fn ls { |@a| /usr/bin/ls -F --group-directories-first --color $@a }
fn la { |@a| ls -A $@a }
fn ll { |@a| la -lh $@a }

fn tree { |@a| /usr/bin/tree --dirsfirst -F --gitignore $@a }

use github.com/zzamboni/elvish-modules/bang-bang
