# thomass/dwarf-fortress

This will run [Dwarf Fortress](http://www.bay12games.com/dwarves/) inside a Docker container.

The default installation is altered by following modifications:

- it uses a [64x64 tile set](http://dwarffortresswiki.org/index.php/Tileset_repository#64.C3.9764) repository
- it uses the [burnedfx Graphic Set](http://burnedfx.com/gs) repository for creatures

## usage

Run `docker run thomass/dwarf-fortress` and follow the instructions.

By default config, savegames and movies are stored under "$HOME/dwarf-fortress"
