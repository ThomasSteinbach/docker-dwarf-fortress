FROM ubuntu:16.04
MAINTAINER thomas.steinbach at aikq.de

ENV DF_VERSION 43_05

# install prerequisites
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      curl \
      bzip2 \
      libsdl-image1.2 \
      libsdl-ttf2.0-0 \
      libgtk2.0-0 \
      libglu1-mesa \
      libopenal1 \
      libcanberra-gtk-module && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install dwarf fortress
RUN mkdir /df_linux && \
    curl -SL http://www.bay12games.com/dwarves/df_${DF_VERSION}_linux.tar.bz2 | tar -xjC / df_linux

# copy system files
COPY files/system/docs.txt /root/docs.txt
COPY files/system/start.sh /root/start.sh
COPY files/system/get-start-script /usr/local/bin/get-start-script
RUN chmod 0755 /usr/local/bin/get-start-script

#
# configure DF
################

# copy tile set
COPY files/tileset/Hack_square_64x64.png /df_linux/data/art/Hack_square_64x64.png

# replace burnedfx graphic files
RUN rm -rf  /df_linux/raw/graphics \
            /df_linux/data/init/colors.txt
COPY files/burnedfx/raw/graphics /df_linux/raw/graphics
COPY files/burnedfx/data/init/colors.txt /df_linux/data/init/colors.txt

# configure burnedfx and others
RUN sed -i \
    -e 's/\[SKY:178:3:0:0\]/[SKY:255:3:0:0]/' \
    -e 's/\[CHASM:250:0:0:1\]/[CHASM:255:0:0:1]/' \
		/df_linux/data/init/d_init.txt

RUN sed -i \
    -e 's/\[WINDOWED:YES\]/[WINDOWED:NO]/' \
		-e 's/\[INTRO:YES\]/[INTRO:NO]/' \
		-e 's/\[SOUND:YES\]/[SOUND:NO]/' \
		-e 's/\[TRUETYPE:24\]/[TRUETYPRE:NO]/' \
    -e 's/\[GRAPHICS:NO\]/[GRAPHICS:YES]/' \
    -e 's/\[GRAPHICS_FONT:curses_square_16x16.png\]/[GRAPHICS_FONT:Hack_square_64x64.png]/' \
    -e 's/\[GRAPHICS_FULLFONT:curses_square_16x16.png\]/[GRAPHICS_FULLFONT:Hack_square_64x64.png]/' \
    -e 's/\[TEXTURE_PARAM:LINEAR\]/[TEXTURE_PARAM:NEAREST]/' \
		/df_linux/data/init/init.txt

RUN chown -R 1000:1000 /df_linux

WORKDIR /df_linux
VOLUME /df_linux/data/save
VOLUME /df_linux/data/movies

CMD ["cat", "/root/docs.txt"]
