#!/bin/bash
xhost +local:dwarf-fortress

docker run -it --rm \
  --name dwarf-fortress \
  -v "$HOME/dwarf-fortress/save:/df_linux/data/save" \
  -v "$HOME/dwarf-fortress/movies:/df_linux/data/movies" \
  -v "$HOME/dwarf-fortress/init:/df_linux/data/init" \
  -e DISPLAY=:0.0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  thomass/dwarf-fortress run-dwarf-fortress

xhost -local:dwarf-fortress
