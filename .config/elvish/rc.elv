use str

set paths = [ $E:HOME'/.local/bin' $E:HOME'/go/bin' $E:HOME'/.cargo/bin' $E:HOME'/.bun/bin' $E:HOME'/.deno/bin' '/home/zm/.local/lib/flutter/bin' '/usr/local/node/bin' '/usr/local/go/bin' '/usr/lib/jvm/openjdk8/bin' $@paths ]

fastfetch
eval (starship init elvish)

fn ls { |@a| eza -F --group-directories-first --color $@a }
fn la { |@a| ls -A $@a }
fn ll { |@a| la --icons -lh $@a }

fn mkcd { |d| mkdir $d; cd $d }

fn asmc { |f|
  var obj = (str:trim-suffix $f .asm)
  nasm -f elf64 -g -F stabs $f
  ld -o $obj $obj.o
}

fn rm_orphans { |_| sudo -- pacman --remove --nosave --recursive (pacman --query --deps --unrequired | awk '{print $1}')}

fn tree { |@a| ll --tree $@a }

set E:XDG_RUNTIME_DIR = "/run/user/"(id -u)
set E:MOZ_ENABLE_WAYLAND = 1
set E:EDITOR = 'nvim'
set E:CHROME_EXECUTABLE = '/home/zm/.local/applications/ungoogled-chromium/chrome'

use github.com/zzamboni/elvish-modules/bang-bang
