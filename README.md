# thomass/dwarf-fortress

This will run [Dwarf Fortress](http://www.bay12games.com/dwarves/) inside a Docker container.

The default installation is altered by following modifications:

- it uses the [Ironhand upgrade package for 0.43.05](http://dffd.bay12games.com/file.php?id=11349) graphics set
- set FPS_CAP to 30 to allow a slower, more 'realistic' simulation

## usage

Run `docker run thomass/dwarf-fortress` and follow the instructions.

By default config, savegames and movies are stored under "$HOME/dwarf-fortress"

# drawbacks

Because of the graphics set in combination with VBO rendering punctuation characters are not displayed properly.

## troubleshooting

By complications with you current game on updating the image, please update your start.sh or/and rename your $HOME/dwarf-fortress/init folder.
