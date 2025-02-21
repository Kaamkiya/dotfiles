use str

set paths = [ $E:HOME'/.local/bin' $E:HOME'/go/bin' $E:HOME'/.cargo/bin' $E:HOME'/.bun/bin' $E:HOME'/.deno/bin' $E:HOME'/.juliaup/bin' '/usr/local/go/bin' '/usr/lib/jvm/openjdk8/bin' $@paths ]

fastfetch
eval (starship init elvish)

fn ls { |@a| /usr/bin/ls -F --group-directories-first --color $@a }
fn la { |@a| ls -A $@a }
fn ll { |@a| la -lh $@a }

fn mkcd { |d| mkdir $d; cd $d }

fn asmc { |f|
  var obj = (str:trim-suffix $f .asm)
  nasm -f elf64 -o $obj.o $f
  ld -n -N -o $obj $obj.o
}

fn tree { |@a| /usr/bin/tree --dirsfirst -F --gitignore $@a }

set E:XDG_RUNTIME_DIR = "/run/user/"(id -u)
set E:MOZ_ENABLE_WAYLAND = 1
set E:EDITOR = 'hx'

use github.com/zzamboni/elvish-modules/bang-bang
