#!/bin/bash
xhost +local:dwarf-fortress

docker run -it --rm \
  --name dwarf-fortress \
  -v "$HOME/dwarf-fortress/save:/df_linux/data/save" \
  -v "$HOME/dwarf-fortress/movies:/df_linux/data/movies" \
  -e DISPLAY=:0.0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  thomass/dwarf-fortress /df_linux/df

xhost -local:dwarf-fortress
