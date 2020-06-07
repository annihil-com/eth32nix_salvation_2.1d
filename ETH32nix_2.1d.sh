#!/bin/bash
#########
# SOUND #
#########

#SDL.so name for the et-sdl-sound.so (will be searched in libary folders)
export ETSDL_SDL_LIB="libSDL.so"

#since ubuntu 10.04 you can only use pulse, because you cant install the libSDL-all package
#in other distributions, install libSDL1.2-all and you can also use alsa or esd, and so on
export SDL_AUDIODRIVER="pulse"


########
# HACK #
########

# path to where the compiled hack&stuff resides, automatic solution
# if not wirking replace `pwd` with "/path/to/hack"
export ETH32_DIR=`pwd`

# path where the game is
export ETH32_ET="/home/immortal/enemy-territory"



##################################################
# DO NOT CHANGE UNLESS YOU KNOW WHAT YOURE DOING #
##################################################
export LD_PRELOAD="$ETH32_DIR/libImmoHooK.so"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
cd $ETH32_ET

# Preload the ET-SDL Libary
export LD_PRELOAD="${LD_PRELOAD}:$ETH32_DIR/et-sdl-sound.so" 
exec ./et.x86 +set com_zonemegs 128 +set com_hunkMegs 256 +set fs_game etpub +exec autoexec.cfg +set net_port 27964 "$@"


# if you add this youll get random net_port, i had problems with that, cause of my ISP settings but you can add it again if you want
#+set net_port $(dd if=/dev/urandom count=1 2> /dev/null | cksum | cut -f1 -d" ")

# some tests without arguments... dont need to bother you ;)
#./et.x86 $*

