```
            __         _ 
 _ __  ___ / _| _ __  | |
| '_ \(_-<|  _|| '  \ | |
| .__//__/|_|  |_|_|_||_|
|_|   SFML for Pascal   
```
[![Chat on Discord](https://img.shields.io/discord/754884471324672040.svg?logo=discord)](https://discord.gg/tPWjMwK) [![Twitter Follow](https://img.shields.io/twitter/follow/tinyBigGAMES?style=social)](https://twitter.com/tinyBigGAMES)
# psfml
### Simple and Fast Multimedia Library for Pascal

Pascal bindings that allow you to use **SFML** and other useful libraries with <a href="https://www.embarcadero.com/es/products/delphi" target="_blank">Delphi</a> and <a href="https://www.freepascal.org" target="_blank">FreePascal</a>.

### Included
- <a href="https://github.com/SFML/CSFML" target="_blank">CSFML</a>
- <a href="https://github.com/madler/zlib/tree/develop/contrib/minizip" target="_blank">minizip</a>
- <a href="https://github.com/phoboslab/pl_mpeg" target="_blank">pl_mpeg</a>

### Additional Features
- Create password protected ZIP archives
- Load resources from password protected ZIP archives.
- MPEG1 video playback
- HiDPI window support
- Extended CSFML routines for ease of use/greater flexibility

### Minimum Requirements 
- Should work on Windows 10+ (64 bits)
- Should work on any Delphi/FreePascal that can target Win64/Unicode

**NOTE: Made/tested on Windows/Delphi 12.**

### Usage
You simply add a `psfml.*` unit to your uses section, you will have direct access to all the aforementioned libraries.

See `examples` for more information on usage and implementation. You must build the `Data.zip` ZIP archive file first, as most examples depend on it being present.

```Pascal
uses
  SysUtils,
  psfml,     // SFML
  psfml.ext; // SFML extensions

var
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
begin
  // create window
  LRenderWindow := sfRenderWindow_create('SFML: HiDPI Window');

  // start game loop
  while sfRenderWindow_isOpen(LRenderWindow) = sfTrue do
  begin

    // process events
    while sfRenderWindow_pollEvent(LRenderWindow, @LEvent) = sfTrue do
    begin
      // close window
      if LEvent.&type = sfEvtClosed then
        sfRenderWindow_close(LRenderWindow);
    end;

    // process DPI/monitor changes
    sfRenderWindow_scaleOnDPIChange(LRenderWindow);

    // clear window
    sfRenderWindow_clear(LRenderWindow, DARKSLATEBROWN);

    // display rendering
    sfRenderWindow_display(LRenderWindow);
  end;

  // destroy window
  sfRenderWindow_destroy(LRenderWindow);
end;
```

### Support
- <a href="https://github.com/tinyBigGAMES/psfml/issues" target="_blank">Issues</a>
- <a href="https://github.com/tinyBigGAMES/psfml/discussions" target="_blank">Discussions</a>
- <a href="https://www.sfml-dev.org/" target="_blank">SFML website</a>

<p align="center">
 <a href="https://www.embarcadero.com/products/delphi" target="_blank"><img src="media/delphi.png"></a>
 <a href="https://www.freepascal.org" target="_blank"><img src="media/FreePascal.gif"></a><br/> 
 ♥ <b>Made for Pascal</b>
</p>