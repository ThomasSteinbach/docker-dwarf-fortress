FROM thomass/dwarf-fortress-base:43.05
MAINTAINER thomas.steinbach at aikq.de

# install Ironhand graphics set
RUN cd /tmp && \
    curl -o ironhand.zip 'http://dffd.bay12games.com/download.php?id=11349&f=Ironhand_43_05A_Upgrade.zip' && \
    unzip ironhand.zip && \
    cd "Dwarf Fortress" && \
    cp -a data/init/* /df_init && \
    cp -a * /df_linux && \
    cd .. && \
    rm -rf "Dwarf Fortress"

RUN sed -i \
		-e 's/\[INTRO:YES\]/[INTRO:NO]/' \
		-e 's/\[SOUND:YES\]/[SOUND:NO]/' \
		-e 's/\[PRINT_MODE:2D\]/[PRINT_MODE:VBO]/' \
		/df_init/init.txt

# add short cut for zoom in (Strg +) and zoom out (Strg -)
RUN sed -i \
    -e '/\[BUTTON:0:5\]/a [SYM:2:Plus]' \
    -e '/\[BUTTON:0:4\]/a [SYM:2:Minus]' \
    /df_init/interface.txt

RUN chown -R 1000:1000 /df_linux
