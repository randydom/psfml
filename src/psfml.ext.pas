(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                __         _
     _ __  ___ / _| _ __  | |
    | '_ \(_-<|  _|| '  \ | |
    | .__//__/|_|  |_|_|_||_|
    |_|  SFML for Pascal™

Copyright © 2024-present tinyBigGAMES™ LLC
         All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com
License: BSD 3-Clause

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
----------------------------------------------------------------------------
Contains the following open-source libraries:
  + pl_mpeg        - https://github.com/phoboslab/pl_mpeg
  + CSFML          - https://github.com/SFML/CSFML
  + zlib           - https://github.com/madler/zlib
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

unit psfml.ext;

{$I psfml.defines.inc}

interface

uses
  System.Types,
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.Math,
  WinApi.Windows,
  WinApi.Messages,
  psfml,
  psfml.utils;

//=== CSFML =================================================================
const
  sfTransform_Identity: sfTransform = (
    matrix: (
      1, 0, 0, // First row
      0, 1, 0, // Second row
      0, 0, 1  // Third row
    )
  );

{$REGION ' Common Blend Modes '}
const
  sfBlendAlpha: sfBlendMode = (
    colorSrcFactor: sfBlendFactorSrcAlpha;
    colorDstFactor: sfBlendFactorOneMinusSrcAlpha;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOneMinusSrcAlpha;
    alphaEquation: sfBlendEquationAdd
  );

  sfBlendAdd: sfBlendMode = (
    colorSrcFactor: sfBlendFactorSrcAlpha;
    colorDstFactor: sfBlendFactorOne;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOne;
    alphaEquation: sfBlendEquationAdd
  );

  sfBlendMultiply: sfBlendMode = (
    colorSrcFactor: sfBlendFactorDstColor;
    colorDstFactor: sfBlendFactorZero;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorDstColor;
    alphaDstFactor: sfBlendFactorZero;
    alphaEquation: sfBlendEquationAdd
  );

  sfBlendMin: sfBlendMode = (
    colorSrcFactor: sfBlendFactorOne;
    colorDstFactor: sfBlendFactorOne;
    colorEquation: sfBlendEquationMin;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOne;
    alphaEquation: sfBlendEquationMin
  );

  sfBlendMax: sfBlendMode = (
    colorSrcFactor: sfBlendFactorOne;
    colorDstFactor: sfBlendFactorOne;
    colorEquation: sfBlendEquationMax;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOne;
    alphaEquation: sfBlendEquationMax
  );

  sfBlendNone: sfBlendMode = (
    colorSrcFactor: sfBlendFactorOne;
    colorDstFactor: sfBlendFactorZero;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorZero;
    alphaEquation: sfBlendEquationAdd
  );
{$ENDREGION}

{$REGION ' Common Colors '}
const
  ALICEBLUE           : sfColor = (r:$F0; g:$F8; b:$FF; a:$FF);
  ANTIQUEWHITE        : sfColor = (r:$FA; g:$EB; b:$D7; a:$FF);
  AQUA                : sfColor = (r:$00; g:$FF; b:$FF; a:$FF);
  AQUAMARINE          : sfColor = (r:$7F; g:$FF; b:$D4; a:$FF);
  AZURE               : sfColor = (r:$F0; g:$FF; b:$FF; a:$FF);
  BEIGE               : sfColor = (r:$F5; g:$F5; b:$DC; a:$FF);
  BISQUE              : sfColor = (r:$FF; g:$E4; b:$C4; a:$FF);
  BLACK               : sfColor = (r:$00; g:$00; b:$00; a:$FF);
  BLANCHEDALMOND      : sfColor = (r:$FF; g:$EB; b:$CD; a:$FF);
  BLUE                : sfColor = (r:$00; g:$00; b:$FF; a:$FF);
  BLUEVIOLET          : sfColor = (r:$8A; g:$2B; b:$E2; a:$FF);
  BROWN               : sfColor = (r:$A5; g:$2A; b:$2A; a:$FF);
  BURLYWOOD           : sfColor = (r:$DE; g:$B8; b:$87; a:$FF);
  CADETBLUE           : sfColor = (r:$5F; g:$9E; b:$A0; a:$FF);
  CHARTREUSE          : sfColor = (r:$7F; g:$FF; b:$00; a:$FF);
  CHOCOLATE           : sfColor = (r:$D2; g:$69; b:$1E; a:$FF);
  CORAL               : sfColor = (r:$FF; g:$7F; b:$50; a:$FF);
  CORNFLOWERBLUE      : sfColor = (r:$64; g:$95; b:$ED; a:$FF);
  CORNSILK            : sfColor = (r:$FF; g:$F8; b:$DC; a:$FF);
  CRIMSON             : sfColor = (r:$DC; g:$14; b:$3C; a:$FF);
  CYAN                : sfColor = (r:$00; g:$FF; b:$FF; a:$FF);
  DARKBLUE            : sfColor = (r:$00; g:$00; b:$8B; a:$FF);
  DARKCYAN            : sfColor = (r:$00; g:$8B; b:$8B; a:$FF);
  DARKGOLDENROD       : sfColor = (r:$B8; g:$86; b:$0B; a:$FF);
  DARKGRAY            : sfColor = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKGREEN           : sfColor = (r:$00; g:$64; b:$00; a:$FF);
  DARKGREY            : sfColor = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKKHAKI           : sfColor = (r:$BD; g:$B7; b:$6B; a:$FF);
  DARKMAGENTA         : sfColor = (r:$8B; g:$00; b:$8B; a:$FF);
  DARKOLIVEGREEN      : sfColor = (r:$55; g:$6B; b:$2F; a:$FF);
  DARKORANGE          : sfColor = (r:$FF; g:$8C; b:$00; a:$FF);
  DARKORCHID          : sfColor = (r:$99; g:$32; b:$CC; a:$FF);
  DARKRED             : sfColor = (r:$8B; g:$00; b:$00; a:$FF);
  DARKSALMON          : sfColor = (r:$E9; g:$96; b:$7A; a:$FF);
  DARKSEAGREEN        : sfColor = (r:$8F; g:$BC; b:$8F; a:$FF);
  DARKSLATEBLUE       : sfColor = (r:$48; g:$3D; b:$8B; a:$FF);
  DARKSLATEGRAY       : sfColor = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKSLATEGREY       : sfColor = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKTURQUOISE       : sfColor = (r:$00; g:$CE; b:$D1; a:$FF);
  DARKVIOLET          : sfColor = (r:$94; g:$00; b:$D3; a:$FF);
  DEEPPINK            : sfColor = (r:$FF; g:$14; b:$93; a:$FF);
  DEEPSKYBLUE         : sfColor = (r:$00; g:$BF; b:$FF; a:$FF);
  DIMGRAY             : sfColor = (r:$69; g:$69; b:$69; a:$FF);
  DIMGREY             : sfColor = (r:$69; g:$69; b:$69; a:$FF);
  DODGERBLUE          : sfColor = (r:$1E; g:$90; b:$FF; a:$FF);
  FIREBRICK           : sfColor = (r:$B2; g:$22; b:$22; a:$FF);
  FLORALWHITE         : sfColor = (r:$FF; g:$FA; b:$F0; a:$FF);
  FORESTGREEN         : sfColor = (r:$22; g:$8B; b:$22; a:$FF);
  FUCHSIA             : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  GAINSBORO           : sfColor = (r:$DC; g:$DC; b:$DC; a:$FF);
  GHOSTWHITE          : sfColor = (r:$F8; g:$F8; b:$FF; a:$FF);
  GOLD                : sfColor = (r:$FF; g:$D7; b:$00; a:$FF);
  GOLDENROD           : sfColor = (r:$DA; g:$A5; b:$20; a:$FF);
  GRAY                : sfColor = (r:$80; g:$80; b:$80; a:$FF);
  GREEN               : sfColor = (r:$00; g:$80; b:$00; a:$FF);
  GREENYELLOW         : sfColor = (r:$AD; g:$FF; b:$2F; a:$FF);
  GREY                : sfColor = (r:$80; g:$80; b:$80; a:$FF);
  HONEYDEW            : sfColor = (r:$F0; g:$FF; b:$F0; a:$FF);
  HOTPINK             : sfColor = (r:$FF; g:$69; b:$B4; a:$FF);
  INDIANRED           : sfColor = (r:$CD; g:$5C; b:$5C; a:$FF);
  INDIGO              : sfColor = (r:$4B; g:$00; b:$82; a:$FF);
  IVORY               : sfColor = (r:$FF; g:$FF; b:$F0; a:$FF);
  KHAKI               : sfColor = (r:$F0; g:$E6; b:$8C; a:$FF);
  LAVENDER            : sfColor = (r:$E6; g:$E6; b:$FA; a:$FF);
  LAVENDERBLUSH       : sfColor = (r:$FF; g:$F0; b:$F5; a:$FF);
  LAWNGREEN           : sfColor = (r:$7C; g:$FC; b:$00; a:$FF);
  LEMONCHIFFON        : sfColor = (r:$FF; g:$FA; b:$CD; a:$FF);
  LIGHTBLUE           : sfColor = (r:$AD; g:$D8; b:$E6; a:$FF);
  LIGHTCORAL          : sfColor = (r:$F0; g:$80; b:$80; a:$FF);
  LIGHTCYAN           : sfColor = (r:$E0; g:$FF; b:$FF; a:$FF);
  LIGHTGOLDENRODYELLOW: sfColor = (r:$FA; g:$FA; b:$D2; a:$FF);
  LIGHTGRAY           : sfColor = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTGREEN          : sfColor = (r:$90; g:$EE; b:$90; a:$FF);
  LIGHTGREY           : sfColor = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTPINK           : sfColor = (r:$FF; g:$B6; b:$C1; a:$FF);
  LIGHTSALMON         : sfColor = (r:$FF; g:$A0; b:$7A; a:$FF);
  LIGHTSEAGREEN       : sfColor = (r:$20; g:$B2; b:$AA; a:$FF);
  LIGHTSKYBLUE        : sfColor = (r:$87; g:$CE; b:$FA; a:$FF);
  LIGHTSLATEGRAY      : sfColor = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSLATEGREY      : sfColor = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSTEELBLUE      : sfColor = (r:$B0; g:$C4; b:$DE; a:$FF);
  LIGHTYELLOW         : sfColor = (r:$FF; g:$FF; b:$E0; a:$FF);
  LIME                : sfColor = (r:$00; g:$FF; b:$00; a:$FF);
  LIMEGREEN           : sfColor = (r:$32; g:$CD; b:$32; a:$FF);
  LINEN               : sfColor = (r:$FA; g:$F0; b:$E6; a:$FF);
  MAGENTA             : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  MAROON              : sfColor = (r:$80; g:$00; b:$00; a:$FF);
  MEDIUMAQUAMARINE    : sfColor = (r:$66; g:$CD; b:$AA; a:$FF);
  MEDIUMBLUE          : sfColor = (r:$00; g:$00; b:$CD; a:$FF);
  MEDIUMORCHID        : sfColor = (r:$BA; g:$55; b:$D3; a:$FF);
  MEDIUMPURPLE        : sfColor = (r:$93; g:$70; b:$DB; a:$FF);
  MEDIUMSEAGREEN      : sfColor = (r:$3C; g:$B3; b:$71; a:$FF);
  MEDIUMSLATEBLUE     : sfColor = (r:$7B; g:$68; b:$EE; a:$FF);
  MEDIUMSPRINGGREEN   : sfColor = (r:$00; g:$FA; b:$9A; a:$FF);
  MEDIUMTURQUOISE     : sfColor = (r:$48; g:$D1; b:$CC; a:$FF);
  MEDIUMVIOLETRED     : sfColor = (r:$C7; g:$15; b:$85; a:$FF);
  MIDNIGHTBLUE        : sfColor = (r:$19; g:$19; b:$70; a:$FF);
  MINTCREAM           : sfColor = (r:$F5; g:$FF; b:$FA; a:$FF);
  MISTYROSE           : sfColor = (r:$FF; g:$E4; b:$E1; a:$FF);
  MOCCASIN            : sfColor = (r:$FF; g:$E4; b:$B5; a:$FF);
  NAVAJOWHITE         : sfColor = (r:$FF; g:$DE; b:$AD; a:$FF);
  NAVY                : sfColor = (r:$00; g:$00; b:$80; a:$FF);
  OLDLACE             : sfColor = (r:$FD; g:$F5; b:$E6; a:$FF);
  OLIVE               : sfColor = (r:$80; g:$80; b:$00; a:$FF);
  OLIVEDRAB           : sfColor = (r:$6B; g:$8E; b:$23; a:$FF);
  ORANGE              : sfColor = (r:$FF; g:$A5; b:$00; a:$FF);
  ORANGERED           : sfColor = (r:$FF; g:$45; b:$00; a:$FF);
  ORCHID              : sfColor = (r:$DA; g:$70; b:$D6; a:$FF);
  PALEGOLDENROD       : sfColor = (r:$EE; g:$E8; b:$AA; a:$FF);
  PALEGREEN           : sfColor = (r:$98; g:$FB; b:$98; a:$FF);
  PALETURQUOISE       : sfColor = (r:$AF; g:$EE; b:$EE; a:$FF);
  PALEVIOLETRED       : sfColor = (r:$DB; g:$70; b:$93; a:$FF);
  PAPAYAWHIP          : sfColor = (r:$FF; g:$EF; b:$D5; a:$FF);
  PEACHPUFF           : sfColor = (r:$FF; g:$DA; b:$B9; a:$FF);
  PERU                : sfColor = (r:$CD; g:$85; b:$3F; a:$FF);
  PINK                : sfColor = (r:$FF; g:$C0; b:$CB; a:$FF);
  PLUM                : sfColor = (r:$DD; g:$A0; b:$DD; a:$FF);
  POWDERBLUE          : sfColor = (r:$B0; g:$E0; b:$E6; a:$FF);
  PURPLE              : sfColor = (r:$80; g:$00; b:$80; a:$FF);
  REBECCAPURPLE       : sfColor = (r:$66; g:$33; b:$99; a:$FF);
  RED                 : sfColor = (r:$FF; g:$00; b:$00; a:$FF);
  ROSYBROWN           : sfColor = (r:$BC; g:$8F; b:$8F; a:$FF);
  ROYALBLUE           : sfColor = (r:$41; g:$69; b:$E1; a:$FF);
  SADDLEBROWN         : sfColor = (r:$8B; g:$45; b:$13; a:$FF);
  SALMON              : sfColor = (r:$FA; g:$80; b:$72; a:$FF);
  SANDYBROWN          : sfColor = (r:$F4; g:$A4; b:$60; a:$FF);
  SEAGREEN            : sfColor = (r:$2E; g:$8B; b:$57; a:$FF);
  SEASHELL            : sfColor = (r:$FF; g:$F5; b:$EE; a:$FF);
  SIENNA              : sfColor = (r:$A0; g:$52; b:$2D; a:$FF);
  SILVER              : sfColor = (r:$C0; g:$C0; b:$C0; a:$FF);
  SKYBLUE             : sfColor = (r:$87; g:$CE; b:$EB; a:$FF);
  SLATEBLUE           : sfColor = (r:$6A; g:$5A; b:$CD; a:$FF);
  SLATEGRAY           : sfColor = (r:$70; g:$80; b:$90; a:$FF);
  SLATEGREY           : sfColor = (r:$70; g:$80; b:$90; a:$FF);
  SNOW                : sfColor = (r:$FF; g:$FA; b:$FA; a:$FF);
  SPRINGGREEN         : sfColor = (r:$00; g:$FF; b:$7F; a:$FF);
  STEELBLUE           : sfColor = (r:$46; g:$82; b:$B4; a:$FF);
  TAN                 : sfColor = (r:$D2; g:$B4; b:$8C; a:$FF);
  TEAL                : sfColor = (r:$00; g:$80; b:$80; a:$FF);
  THISTLE             : sfColor = (r:$D8; g:$BF; b:$D8; a:$FF);
  TOMATO              : sfColor = (r:$FF; g:$63; b:$47; a:$FF);
  TURQUOISE           : sfColor = (r:$40; g:$E0; b:$D0; a:$FF);
  VIOLET              : sfColor = (r:$EE; g:$82; b:$EE; a:$FF);
  WHEAT               : sfColor = (r:$F5; g:$DE; b:$B3; a:$FF);
  WHITE               : sfColor = (r:$FF; g:$FF; b:$FF; a:$FF);
  WHITESMOKE          : sfColor = (r:$F5; g:$F5; b:$F5; a:$FF);
  YELLOW              : sfColor = (r:$FF; g:$FF; b:$00; a:$FF);
  YELLOWGREEN         : sfColor = (r:$9A; g:$CD; b:$32; a:$FF);
  BLANK               : sfColor = (r:$00; g:$00; b:$00; a:$00);
  WHITE2              : sfColor = (r:$F5; g:$F5; b:$F5; a:$FF);
  RED22               : sfColor = (r:$7E; g:$32; b:$3F; a:255);
  COLORKEY            : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  OVERLAY1            : sfColor = (r:$00; g:$20; b:$29; a:$B4);
  OVERLAY2            : sfColor = (r:$01; g:$1B; b:$01; a:255);
  DIMWHITE            : sfColor = (r:$10; g:$10; b:$10; a:$10);
  DARKSLATEBROWN      : sfColor = (r:30;  g:31;  b:30;  a:1);
  RAYWHITE            : sfColor = (r:245; g:245; b:245; a:255);
  TRANSPARENT         : sfColor = (r:255; g:255; b:255; a:0);
{$ENDREGION}

{ sfVector }
function  sfVector2i_create(const X, Y: Integer): sfVector2i;
function  sfVector2u_create(const X, Y: Cardinal): sfVector2u;
function  sfVector2f_create(const X, Y: Single): sfVector2f;
function  sfVector3f_create(const X, Y, Z: Single): sfVector3f;

{ sfRect }
function  sfFloatRect_create(const ALeft, ATop, AWidth, AHeight: Single): sfFloatRect;
function  sfIntRect_create(const ALeft, ATop, AWidth, AHeight: Integer): sfIntRect;

{ sfZipFile }
const
  sfDefaultZipFilePassword = 'Q.<g%zw[k6T,7:4N2DWC>Y]+n;(r3yj@JcF?Ru=s5LbM`paPf!';

type
  { sfZipFileBuildProgressCallback }
  sfZipFileBuildProgressCallback = procedure(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean);

function sfZipFile_build(const AArchive, ADirectory: string; const APassword: string=sfDefaultZipFilePassword; const ASender: Pointer=nil; const AHandler: sfZipFileBuildProgressCallback=nil): Boolean;

{ sfInputStream }
type
  { sfInputStreamCloseFunc }
  sfInputStreamCloseFunc = function(userData: Pointer): Boolean; cdecl;

  { sfInputStream }
  PsfInputStream = ^sfInputStream;
  sfInputStream = record
    Base: psfml.sfInputStream;
    close: sfInputStreamCloseFunc;
  end;

function sfInputStream_create(): PsfInputStream; cdecl;
function sfInputStream_read(const AInputStream: PsfInputStream; const AData: Pointer; const ASize: sfInt64): sfInt64;
function sfInputStream_seek(const AInputStream: PsfInputStream; const APosition: sfInt64): sfInt64;
function sfInputStream_tell(const AInputStream: PsfInputStream): sfInt64;
function sfInputStream_getSize(const AInputStream: PsfInputStream): sfInt64;
function sfInputStream_eof(const AInputStream: PsfInputStream): Boolean;
function sfInputStream_close(var AInputStream: PsfInputStream): Boolean;
function sfInputStream_createFromFile(const AFilename: string): PsfInputStream;
function sfInputStream_createFromMemory(const ABuffer: Pointer; const ASize: Int64): PsfInputStream;
function sfInputStream_createFromZipFile(const AZipFilename, AFilename: string; const APassword: string=sfDefaultZipFilePassword): PsfInputStream;

{ sfRenderWindow}
const
  sfDefaultWindowWidth = 1920 div 2;
  sfDefaultWindowHeight = 1080 div 2;
  sfDefaultWindowStyle = sfClose;

type
  { TsfTiming }
  TsfTiming = record
    Clock: PsfClock;
    ElapsedTime: sfTime;
    FrameRate: Single;
    FrameCount: Integer;
    Limit: Cardinal;
  end;

  { TsfRenderWindow }
  PsfRenderWindow = ^TsfRenderWindow;
  TsfRenderWindow = record
    Handle: psfml.PsfRenderWindow;
    Mode: sfVideoMode;
    Settings: sfContextSettings;
    Scale: Single;
    Dpi: Cardinal;
    Timing: TsfTiming;
  end;

function  sfRenderWindow_create(ATitle: string; const AWidth: Cardinal=sfDefaultWindowWidth; const AHeight: Cardinal=sfDefaultWindowHeight; const AStyle: sfUint32=Ord(sfDefaultWindowStyle)): PsfRenderWindow;
procedure sfRenderWindow_destroy(var AWindow: PsfRenderWindow);
procedure sfRenderWindow_setFramerateLimit(const AWindow: PsfRenderWindow; limit: Cardinal);
procedure sfRenderWindow_display(const AWindow: PsfRenderWindow);
function  sfRenderWindow_getFrameRate(const AWindow: PsfRenderWindow): Cardinal;
procedure sfRenderWindow_resetTiming(const AWindow: PsfRenderWindow);
procedure sfRenderWindow_setTitle(const AWindow: PsfRenderWindow; const title: string);
function  sfRenderWindow_createUnicode(mode: sfVideoMode; const title: PsfUint32; style: sfUint32; const settings: PsfContextSettings): PsfRenderWindow;
function  sfRenderWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow;
procedure sfRenderWindow_close(renderWindow: PsfRenderWindow);
function  sfRenderWindow_isOpen(const renderWindow: PsfRenderWindow): sfBool;
function  sfRenderWindow_getSettings(const renderWindow: PsfRenderWindow): sfContextSettings;
function  sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool;
function  sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool;
function  sfRenderWindow_getPosition(const renderWindow: PsfRenderWindow): sfVector2i;
procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: sfVector2i);
function  sfRenderWindow_getSize(const renderWindow: PsfRenderWindow): sfVector2u;
function  sfRenderWindow_isSrgb(const renderWindow: PsfRenderWindow): sfBool;
procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: sfVector2u);
procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; const title: PsfUint32);
procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; width: Cardinal; height: Cardinal; const pixels: PsfUint8);
procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: sfBool);
procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: sfBool);
procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: sfBool);
procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: sfBool);
procedure sfRenderWindow_setMouseCursor(window: PsfRenderWindow; const cursor: PsfCursor);
procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: sfBool);
procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: Single);
function  sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: sfBool): sfBool;
procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow);
function  sfRenderWindow_hasFocus(const renderWindow: PsfRenderWindow): sfBool;
function  sfRenderWindow_getSystemHandle(const renderWindow: PsfRenderWindow): sfWindowHandle;
procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: sfColor);
procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; const view: PsfView);
function  sfRenderWindow_getView(const renderWindow: PsfRenderWindow): PsfView;
function  sfRenderWindow_getDefaultView(const renderWindow: PsfRenderWindow): PsfView;
function  sfRenderWindow_getViewport(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect;
function  sfRenderWindow_mapPixelToCoords(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f;
function  sfRenderWindow_mapCoordsToPixel(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i;
procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates);
procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates);
procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates);
procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates);
procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates);
procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates);
procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates);
procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates);
procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates);
procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow);
procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow);
procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow);
function  sfRenderWindow_capture(const renderWindow: PsfRenderWindow): PsfImage;
function  sfRenderWindow_getDPI(const AWindow: PsfRenderWindow): Cardinal;
function  sfRenderWindow_scaleToDPI(const AWindow: PsfRenderWindow; const ABaseWidth, ABaseHeight: Cardinal; const ACenter: Boolean; const ADefaultDPI: Integer=96): Boolean;
function  sfRenderWindow_scaleOnDPIChange(const AWindow: PsfRenderWindow): Boolean;
procedure sfRenderWindow_setDefaultIcon(const AWindow: PsfRenderWindow);
procedure sfRenderWindow_drawLine(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2: Single; const AColor: sfColor; const AThickness: Single);
procedure sfRenderWindow_drawRect(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor);
procedure sfRenderWindow_drawFilledRect(const ARenderWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor);
procedure sfRenderWindow_drawText(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: string; const AArgs: array of const);
procedure sfRenderWindow_drawCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius, AThickness: Single; const AColor: sfColor);
procedure sfRenderWindow_drawFilledCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius: Single; const AColor: sfColor);
procedure sfRenderWindow_drawTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor, AOutlineColor: sfColor);
procedure sfRenderWindow_drawFilledTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: sfColor);
procedure sfRenderWindow_drawPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor, AOutlineColor: sfColor);
procedure sfRenderWindow_drawFilledPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AColor: sfColor);
procedure sfRenderWindow_drawPolyline(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor: sfColor);
procedure sfRenderWindow_drawEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor);
procedure sfRenderWindow_drawFilledEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor);

{ sfView }
procedure sfView_setLetterBox(const AView: PsfView; const AWindowWidth, AWindowHeight: Integer);
function  sfView_createLetterBox(const AWindowWidth, AWindowHeight: Integer): PsfView;

{ sfFont }
function sfFont_createFromRes(const AInstance: HINST; const AResName: string): PsfFont;
function sfFont_createDefaultFont(): PsfFont;
function sfFont_createFromStream(stream: PsfInputStream): PsfFont;

{ sfText }
procedure sfText_setCharacterSize(const AWindow: PsfRenderWindow; const AText: PsfText; const ASize: Cardinal);
procedure sfText_setUnicodeString(const AText: PsfText; const AString: string);

{ sfTexture }
function sfTexture_createFromRes(const AInstance: HINST; const AResName: string; const AArea: PsfIntRect): PsfTexture;
function sfTexture_createFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
function sfTexture_createSrgbFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;

{ sfImage }
function sfImage_createFromStream(stream: PsfInputStream): PsfImage;

{ sfMusic }
function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic; cdecl;

{ sfSoundBuffer }
function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer; cdecl;

{ sfShader }
function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl;

{ sfVideo }
type
  sfVideoStatus = (vsPlaying, vsStopped, vsPaused);
  sfVideoStatusCallback = procedure(const ASender: Pointer; const AStatus: sfVideoStatus; const AFilename: string);

function  sfVideo_playFromStream(const AStream: PsfInputStream; const AVolume: Single; const ALoop: Boolean; const AName: string; const ASender: Pointer; const AHandler: sfVideoStatusCallback): Boolean;
function  sfVideo_playFromFile(const AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer=nil; const AHandler: sfVideoStatusCallback=nil): Boolean;
function  sfVideo_playFromZipFile(const AZipFilename, AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer=nil; const AHandler: sfVideoStatusCallback=nil; const APassword: string=sfDefaultZipFilePassword): Boolean;
procedure sfVideo_destroy();
function  sfVideo_Update(const AWindow: PsfRenderWindow): sfVideoStatus;
procedure sfVideo_render(const AWindow: PsfRenderWindow; const X, Y, AScale: Single);
function  sfVideo_getStatus(): sfVideoStatus;
function  sfVideo_getLoop(): Boolean;
procedure sfVideo_setLoop(const ALoop: Boolean);
function  sfVideo_getVolume(): Single;
procedure sfVideo_setVolume(const AVolume: Single);

//=== IMGUI ==================================================================
function ImFontAtlas_AddFontFromResTTF(self: PImFontAtlas; const AInstance: HINST; const AResName: string; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont;
function ImFontAtlas_AddDefaultFontTTF(self: PImFontAtlas; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont;

//=== IMGUI-SFML =============================================================
function  ImGui_SFML_Init_RenderWindow(window: PsfRenderWindow; loadDefaultFont: Boolean): Boolean;
procedure ImGui_SFML_ProcessEvent_Window(window: PsfRenderWindow; event: PsfEvent);
procedure ImGui_SFML_Render_RenderWindow(window: PsfRenderWindow);


implementation

{$R psfml.ext.res}

//=== CSFML =================================================================
{ sfVector }
function  sfVector2i_create(const X, Y: Integer): sfVector2i;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector2u_create(const X, Y: Cardinal): sfVector2u;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector2f_create(const X, Y: Single): sfVector2f;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector3f_create(const X, Y, Z: Single): sfVector3f;
begin
  Result.x := X;
  Result.y := Y;
  Result.z := Z;
end;

{ sfRect }
function  sfFloatRect_create(const ALeft, ATop, AWidth, AHeight: Single): sfFloatRect;
begin
  Result.left := ALeft;
  Result.top := ATop;
  Result.width := AWidth;
  Result.height := AHeight;
end;

function  sfIntRect_create(const ALeft, ATop, AWidth, AHeight: Integer): sfIntRect;
begin
  Result.left := ALeft;
  Result.top := ATop;
  Result.width := AWidth;
  Result.height := AHeight;
end;

{ sfZipFile }
procedure sfZipFile_buildProgress(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean);
begin
  if aNewFile then PrintLn;
  Print(#13+'Adding %s(%d%s)...', [ExtractFileName(aFilename), aProgress, '%']);
end;

function sfZipFile_build(const AArchive, ADirectory: string; const APassword: string; const ASender: Pointer; const AHandler: sfZipFileBuildProgressCallback): Boolean;
var
  LFileList: TStringDynArray;
  LArchive: PAnsiChar;
  LFilename: string;
  LFilename2: PAnsiChar;
  LPassword: PAnsiChar;
  LZipFile: zipFile;
  LZipFileInfo: zip_fileinfo;
  LFile: TStream;
  LCrc: Cardinal;
  LBytesRead: Integer;
  LFileSize: Int64;
  LProgress: Single;
  LNewFile: Boolean;
  LHandler: sfZipFileBuildProgressCallback;
  LSender: Pointer;

  function GetCRC32(aStream: TStream): Cardinal;
  var
    LBytesRead: Integer;
    LBuffer: array of Byte;
  begin
    Result := crc32(0, nil, 0);
    repeat
      LBytesRead := AStream.Read(GetTempStaticBuffer^, GetTempStaticBufferSize);
      Result := crc32(Result, PBytef(GetTempStaticBuffer), LBytesRead);
    until LBytesRead = 0;

    LBuffer := nil;
  end;

begin
  Result := False;

  // check if directory exists
  if not TDirectory.Exists(ADirectory) then Exit;

  // init variabls
  FillChar(LZipFileInfo, SizeOf(LZipFileInfo), 0);

  // scan folder and build file list
  LFileList := TDirectory.GetFiles(ADirectory, '*',
    TSearchOption.soAllDirectories);

  LArchive := PAnsiChar(AnsiString(AArchive));
  LPassword := PAnsiChar(AnsiString(APassword));

  // create a zip file
  LZipFile := zipOpen64(LArchive, APPEND_STATUS_CREATE);

  // init handler
  LHandler := AHandler;
  LSender := ASender;

  if not Assigned(LHandler) then
    LHandler := sfZipFile_buildProgress;

  // process zip file
  if LZipFile <> nil then
  begin
    // loop through all files in list
    for LFilename in LFileList do
    begin
      // open file
      LFile := TFile.OpenRead(LFilename);

      // get file size
      LFileSize := LFile.Size;

      // get file crc
      LCrc := GetCRC32(LFile);

      // open new file in zip
      LFilename2 := PAnsiChar(AnsiString(LFilename));
      if ZipOpenNewFileInZip3_64(LZipFile, LFilename2, @LZipFileInfo, nil, 0,
        nil, 0, '',  Z_DEFLATED, 9, 0, 15, 9, Z_DEFAULT_STRATEGY,
        LPassword, LCrc, 1) = Z_OK then
      begin
        // make sure we start at star of stream
        LFile.Position := 0;

        LNewFile := True;

        // read through file
        repeat
          // read in a buffer length of file
          LBytesRead := LFile.Read(GetTempStaticBuffer^, GetTempStaticBufferSize);

          // write buffer out to zip file
          zipWriteInFileInZip(LZipFile, GetTempStaticBuffer, LBytesRead);

          // calc file progress percentage
          LProgress := 100.0 * (LFile.Position / LFileSize);

          // show progress
          if Assigned(LHandler) then
          begin
            LHandler(LSender, LFilename, Round(LProgress), LNewFile);
          end;

          LNewFile := False;

        until LBytesRead = 0;

        // close file in zip
        zipCloseFileInZip(LZipFile);

        // free file stream
        FreeNilObject(LFile);
      end;
    end;

    // close zip file
    zipClose(LZipFile, '');
  end;

  // return true if new zip file exits
  Result := TFile.Exists(LFilename);
end;

{ sfInputStream }
function sfInputStream_create(): PsfInputStream;
begin
  New(Result);
end;

function sfInputStream_read(const AInputStream: PsfInputStream; const AData: Pointer; const ASize: sfInt64): sfInt64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  Result := AInputStream.Base.read(AData, ASize, AInputStream.Base.userData);
end;

function sfInputStream_seek(const AInputStream: PsfInputStream; const APosition: sfInt64): sfInt64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  Result := AInputStream.Base.seek(APosition, AInputStream.Base.userData);
end;

function sfInputStream_tell(const AInputStream: PsfInputStream): sfInt64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  Result := AInputStream.Base.tell(AInputStream.Base.userData);
end;

function sfInputStream_getSize(const AInputStream: PsfInputStream): sfInt64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  Result := AInputStream.Base.getSize(AInputStream.Base.userData);
end;

function sfInputStream_eof(const AInputStream: PsfInputStream): Boolean;
begin
  Result := Boolean(AInputStream.Base.tell(AInputStream.Base.userData) >= AInputStream.Base.getSize(AInputStream.Base.userData));
end;

function sfInputStream_close(var AInputStream: PsfInputStream): Boolean;
begin
  Result := False;
  if not Assigned(AInputStream) then Exit;
  if Assigned(AInputStream.close) then
  begin
    if Assigned(AInputStream.Base.userData) then
    begin
      AInputStream.close(AInputStream.Base.userData);
    end;
  end;
  Dispose(AInputStream);
  AInputStream := nil;
end;

{ sfInputStream_createFromFile }
function File_ReadInputStream(data: Pointer; size: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Read(data^, size);
end;

function File_SeekInputStream(position: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Seek(position, soBeginning);
end;

function File_TellInputStream(userData: Pointer): sfInt64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Position;
end;

function File_GetSizeInputStream(userData: Pointer): sfInt64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Size;
end;

function File_CloseInputStream(userData: Pointer): Boolean; cdecl;
var
  LFile: TFileStream;
begin
  Result := False;
  LFile := userData;
  if not Assigned(LFile) then Exit;
  FreeNilObject(LFile);
  Result := True;
end;

function sfInputStream_createFromFile(const AFilename: string): PsfInputStream;
var
  LFile: TFileStream;
begin
  Result := nil;
  if not TFile.Exists(AFilename) then Exit;

  LFile := TFile.OpenRead(AFilename);

  Result := sfInputStream_create;
  Result.Base.read := File_ReadInputStream;
  Result.Base.seek := File_SeekInputStream;
  Result.Base.tell := File_TellInputStream;
  Result.Base.getSize := File_GetSizeInputStream;
  Result.Base.userData := LFile;
  Result.close := File_CloseInputStream;
end;

{ sfInputStream_createFromMemory }
type
  TStaticMemoryStream = class(TCustomMemoryStream)
  public
    constructor Create(const ABuffer: Pointer; const ASize: NativeInt);
  end;

constructor TStaticMemoryStream.Create(const ABuffer: Pointer; const ASize: NativeInt);
begin
  inherited Create;
  SetPointer(ABuffer, ASize);
end;

function Memory_ReadInputStream(data: Pointer; size: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Read(data^, size);
end;

function Memory_SeekInputStream(position: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Seek(position, soBeginning);
end;

function Memory_TellInputStream(userData: Pointer): sfInt64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Position;
end;

function Memory_GetSizeInputStream(userData: Pointer): sfInt64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Size;
end;

function Memory_CloseInputStream(userData: Pointer): Boolean; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  Result := False;
  LMem := userData;
  if not Assigned(LMem) then Exit;
  FreeNilObject(LMem);
  Result := True;
end;

function sfInputStream_createFromMemory(const ABuffer: Pointer; const ASize: Int64): PsfInputStream;
var
  LMem: TStaticMemoryStream;
begin
  Result := nil;
  if not Assigned(ABuffer) then Exit;

  LMem := TStaticMemoryStream.Create(ABuffer, ASize);

  Result := sfInputStream_create;
  Result.Base.read := Memory_ReadInputStream;
  Result.Base.seek := Memory_SeekInputStream;
  Result.Base.tell := Memory_TellInputStream;
  Result.Base.getSize := Memory_GetSizeInputStream;
  Result.Base.userData := LMem;
  Result.close := Memory_CloseInputStream;
end;

{ sfInputStream_createFromZipFile }
type
  { TsfZipFile }
  PsfZipFile = ^TsfZipFile;
  TsfZipFile = record
    ZipFile: unzFile;
    Password: AnsiString;
    Filename: AnsiString;
  end;

function ZipFile_ReadInputStream(data: Pointer; size: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LZipFile: PsfZipFile;
begin
  LZipFile := userData;
  Result := unzReadCurrentFile(LZipFile.ZipFile, data, size);
end;

function ZipFile_SeekInputStream(position: sfInt64; userData: Pointer): sfInt64; cdecl;
var
  LZipFile: PsfZipFile;
  LBytesToRead: sfInt64;
begin
  LZipFile := userData;
  unzCloseCurrentFile(LZipFile.ZipFile);
  unzLocateFile(LZipFile.ZipFile, PAnsiChar(LZipFile.Filename), 0);
  unzOpenCurrentFilePassword(LZipFile.ZipFile, PAnsiChar(LZipFile.Password));

  LBytesToRead := UInt64(position) - unztell64(LZipFile.ZipFile);
  while LBytesToRead > 0 do
  begin
    if LBytesToRead > GetTempStaticBufferSize then
      unzReadCurrentFile(LZipFile.ZipFile, GetTempStaticBuffer, GetTempStaticBufferSize)
    else
      unzReadCurrentFile(LZipFile.ZipFile, GetTempStaticBuffer, LBytesToRead);

    LBytesToRead := UInt64(position) - unztell64(LZipFile.ZipFile);
  end;

  Result := unztell64(LZipFile.ZipFile);
end;

function ZipFile_TellInputStream(userData: Pointer): sfInt64; cdecl;
var
  LZipFile: PsfZipFile;
begin
  LZipFile := userData;
  Result := unztell64(LZipFile.ZipFile);
end;

function ZipFile_GetSizeInputStream(userData: Pointer): sfInt64; cdecl;
var
  LZipFile: PsfZipFile;
  LInfo: unz_file_info64;
begin
  LZipFile := userData;
  unzGetCurrentFileInfo64(LZipFile.ZipFile, @LInfo, nil, 0, nil, 0, nil, 0);
  Result := LInfo.uncompressed_size;
end;

function ZipFile_CloseInputStream(userData: Pointer): Boolean; cdecl;
var
  LZipFile: PsfZipFile;
begin
  Result := False;
  if not Assigned(userData) then Exit;

  LZipFile := userData;

  Assert(unzCloseCurrentFile(LZipFile.ZipFile) = UNZ_OK);
  Assert(unzClose(LZipFile.ZipFile) = UNZ_OK);

  Dispose(LZipFile);

  Result := True;
end;

function sfInputStream_createFromZipFile(const AZipFilename, AFilename: string; const APassword: string): PsfInputStream;
var
  LPassword: PAnsiChar;
  LZipFilename: PAnsiChar;
  LFilename: PAnsiChar;
  LFile: unzFile;
  LZipFile: PsfZipFile;
begin
  Result := nil;

  LPassword := PAnsiChar(AnsiString(APassword));
  LZipFilename := PAnsiChar(AnsiString(StringReplace(AZipFilename, '/', '\', [rfReplaceAll])));
  LFilename := PAnsiChar(AnsiString(StringReplace(AFilename, '/', '\', [rfReplaceAll])));

  LFile := unzOpen64(LZipFilename);
  if not Assigned(LFile) then Exit;

  if unzLocateFile(LFile, LFilename, 0) <> UNZ_OK then
  begin
    unzClose(LFile);
    Exit;
  end;

  if unzOpenCurrentFilePassword(LFile, LPassword) <> UNZ_OK then
  begin
    unzClose(LFile);
    Exit;
  end;

  New(LZipFile);
  LZipFile.ZipFile := LFile;
  LZipFile.Password := AnsiString(APassword);
  LZipFile.Filename := AnsiString(AFilename);

  Result := sfInputStream_create;
  Result.Base.read := ZipFile_ReadInputStream;
  Result.Base.seek := ZipFile_SeekInputStream;
  Result.Base.tell := ZipFile_TellInputStream;
  Result.Base.getSize := ZipFile_GetSizeInputStream;
  Result.Base.userData := LZipFile;
  Result.close := ZipFile_CloseInputStream;

end;

function  sfRenderWindow_create(ATitle: string; const AWidth: Cardinal; const AHeight: Cardinal; const AStyle: sfUint32): PsfRenderWindow;
begin
  New(Result);

  Result.Mode.Width := AWidth;
  Result.Mode.Height := AHeight;
  Result.Mode.BitsPerPixel := 32;

  FillChar(Result.settings, SizeOf(Result.settings), 0);
  Result.settings.depthBits := 24;
  Result.settings.stencilBits := 8;
  Result.settings.antialiasingLevel := 8; // Set anti-aliasing level
  Result.Settings.majorVersion := 2;
  Result.Settings.minorVersion := 1;

  Result.Handle := psfml.sfRenderWindow_create(Result.Mode, AsUTF8(ATitle), AStyle, @Result.Settings);
  if not Assigned(Result.Handle) then
  begin
    Dispose(Result);
    Exit;
  end;

  sfRenderWindow_setDefaultIcon(Result);
  if not sfRenderWindow_scaleToDPI(Result, AWidth, AHeight, True, 96) then
  begin
    sfRenderWindow_destroy(Result);
    Exit;
  end;
  sfRenderWindow_setFramerateLimit(Result, 60);
  sfRenderWindow_setVerticalSyncEnabled(Result, sfFalse);

  Result.Timing.FrameCount := 0;
  Result.Timing.FrameRate := 0;
  Result.Timing.Clock := sfClock_create();

  SetForegroundWindow(HWND(sfRenderWindow_getSystemHandle(Result)));
end;

procedure sfRenderWindow_destroy(var AWindow: PsfRenderWindow);
begin
  sfVideo_destroy;
  sfClock_destroy(AWindow.Timing.Clock);
  psfml.sfRenderWindow_destroy(AWindow.Handle);
  Dispose(AWindow);
  AWindow := nil;
end;

procedure sfRenderWindow_setFramerateLimit(const AWindow: PsfRenderWindow; limit: Cardinal);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  psfml.sfRenderWindow_setFramerateLimit(AWindow.Handle, limit);
  AWindow.Timing.Limit := limit;
end;

procedure sfRenderWindow_display(const AWindow: PsfRenderWindow);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  psfml.sfRenderWindow_display(AWindow.Handle);

  if Assigned(AWindow.Timing.Clock) then
  begin
    Inc(AWindow.Timing.FrameCount);
    AWindow.Timing.ElapsedTime := sfClock_getElapsedTime(AWindow.Timing.Clock);

    if sfTime_asMilliseconds(AWindow.Timing.ElapsedTime) >= 1000 then
    begin
      AWindow.Timing.FrameRate := AWindow.Timing.FrameCount / (sfTime_asMilliseconds(AWindow.Timing.ElapsedTime) / 1000);
      AWindow.Timing.FrameCount := 0;
      sfClock_restart(AWindow.Timing.Clock);
    end;
  end;
end;

function   sfRenderWindow_getFrameRate(const AWindow: PsfRenderWindow): Cardinal;
begin
  Result := Round(AWindow.Timing.FrameRate);
end;

procedure sfRenderWindow_resetTiming(const AWindow: PsfRenderWindow);
begin
  AWindow.Timing.FrameRate := 0;
  AWindow.Timing.FrameCount := 0;
  sfClock_restart(AWindow.Timing.Clock);
end;

procedure sfRenderWindow_setTitle(const AWindow: PsfRenderWindow; const title: string);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  psfml.sfRenderWindow_setTitle(AWindow.Handle, AsUTF8(title));
end;

function  sfRenderWindow_createUnicode(mode: sfVideoMode; const title: PsfUint32; style: sfUint32; const settings: PsfContextSettings): PsfRenderWindow;
begin
  Result := psfml.sfRenderWindow_createUnicode(mode, title, style, settings);
end;

function  sfRenderWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow;
begin
  Result := psfml.sfRenderWindow_createFromHandle(handle, settings);
end;

procedure sfRenderWindow_close(renderWindow: PsfRenderWindow);
begin
  psfml.sfRenderWindow_close(renderWindow.Handle);
end;


function  sfRenderWindow_isOpen(const renderWindow: PsfRenderWindow): sfBool;
begin
  Result := psfml.sfRenderWindow_isOpen(renderWindow.Handle);
end;

function  sfRenderWindow_getSettings(const renderWindow: PsfRenderWindow): sfContextSettings;
begin
  Result := psfml.sfRenderWindow_getSettings(renderWindow.Handle);
end;

function  sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool;
begin
  Result := psfml.sfRenderWindow_pollEvent(renderWindow.Handle, event);
end;

function  sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool;
begin
  Result := psfml.sfRenderWindow_waitEvent(renderWindow.Handle, event);
end;

function  sfRenderWindow_getPosition(const renderWindow: PsfRenderWindow): sfVector2i;
begin
  Result := psfml.sfRenderWindow_getPosition(renderWindow.Handle);
end;

procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: sfVector2i);
begin
  psfml.sfRenderWindow_setPosition(renderWindow.Handle, position);
end;

function  sfRenderWindow_getSize(const renderWindow: PsfRenderWindow): sfVector2u;
begin
  Result := psfml.sfRenderWindow_getSize(renderWindow.Handle);
end;

function  sfRenderWindow_isSrgb(const renderWindow: PsfRenderWindow): sfBool;
begin
  Result := psfml.sfRenderWindow_isSrgb(renderWindow.Handle);
end;

procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: sfVector2u);
begin
  psfml.sfRenderWindow_setSize(renderWindow.Handle, size);
end;

procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; const title: PsfUint32);
begin
  psfml.sfRenderWindow_setUnicodeTitle(renderWindow.Handle, title);
end;

procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; width: Cardinal; height: Cardinal; const pixels: PsfUint8);
begin
  psfml.sfRenderWindow_setIcon(renderWindow.Handle, width, height, pixels);
end;

procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: sfBool);
begin
  psfml.sfRenderWindow_setVisible(renderWindow.Handle, visible);
end;

procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: sfBool);
begin
  psfml.sfRenderWindow_setVerticalSyncEnabled(renderWindow.Handle, enabled);
end;

procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: sfBool);
begin
  psfml.sfRenderWindow_setMouseCursorVisible(renderWindow.Handle, show);
end;

procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: sfBool);
begin
  psfml.sfRenderWindow_setMouseCursorGrabbed(renderWindow.Handle, grabbed);
end;

procedure sfRenderWindow_setMouseCursor(window: PsfRenderWindow; const cursor: PsfCursor);
begin
  psfml.sfRenderWindow_setMouseCursor(window.Handle, cursor);
end;

procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: sfBool);
begin
  psfml.sfRenderWindow_setKeyRepeatEnabled(renderWindow.Handle, enabled);
end;

procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: Single);
begin
  psfml.sfRenderWindow_setJoystickThreshold(renderWindow.Handle, threshold);
end;

function  sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: sfBool): sfBool;
begin
  Result := psfml.sfRenderWindow_setActive(renderWindow.Handle, active);
end;

procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow);
begin
  psfml.sfRenderWindow_requestFocus(renderWindow.Handle);
end;

function  sfRenderWindow_hasFocus(const renderWindow: PsfRenderWindow): sfBool;
begin
  Result := psfml.sfRenderWindow_hasFocus(renderWindow.Handle);
end;

function  sfRenderWindow_getSystemHandle(const renderWindow: PsfRenderWindow): sfWindowHandle;
begin
  Result := psfml.sfRenderWindow_getSystemHandle(renderWindow.Handle);
end;

procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: sfColor);
begin
  psfml.sfRenderWindow_clear(renderWindow.Handle, color);
end;

procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; const view: PsfView);
begin
  psfml.sfRenderWindow_setView(renderWindow.Handle, view);
end;

function  sfRenderWindow_getView(const renderWindow: PsfRenderWindow): PsfView;
begin
  Result := psfml.sfRenderWindow_getView(renderWindow.Handle);
end;

function  sfRenderWindow_getDefaultView(const renderWindow: PsfRenderWindow): PsfView;
begin
  Result := psfml.sfRenderWindow_getDefaultView(renderWindow.Handle);
end;

function  sfRenderWindow_getViewport(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect;
begin
  Result := psfml.sfRenderWindow_getViewport(renderWindow.Handle, view);
end;

function  sfRenderWindow_mapPixelToCoords(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f;
begin
  Result := psfml.sfRenderWindow_mapPixelToCoords(renderWindow.Handle, point, view);
end;

function  sfRenderWindow_mapCoordsToPixel(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i;
begin
  Result := psfml.sfRenderWindow_mapCoordsToPixel(renderWindow.Handle, point, view);
end;

procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawSprite(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawCircleShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawConvexShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawRectangleShape(renderWindow, &object, states);
end;

procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawVertexArray(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawVertexBuffer(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawVertexBufferRange(renderWindow.Handle, &object, firstVertex, vertexCount, states);
end;

procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates);
begin
  psfml.sfRenderWindow_drawPrimitives(renderWindow.Handle, vertices, vertexCount, &type, states);
end;

procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow);
begin
  psfml.sfRenderWindow_pushGLStates(renderWindow.Handle);
end;

procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow);
begin
  psfml.sfRenderWindow_popGLStates(renderWindow.Handle);
end;

procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow);
begin
  psfml.sfRenderWindow_resetGLStates(renderWindow.Handle);
end;

function  sfRenderWindow_capture(const renderWindow: PsfRenderWindow): PsfImage;
begin
  Result := psfml.sfRenderWindow_capture(renderWindow.Handle);
end;

function sfRenderWindow_getDPI(const AWindow: PsfRenderWindow): Cardinal;
begin
  Result := 0;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  Result := GetDpiForWindow(HWND(sfRenderWindow_getSystemHandle(AWindow)));
end;

function sfRenderWindow_scaleToDPI(const AWindow: PsfRenderWindow; const ABaseWidth, ABaseHeight: Cardinal; const ACenter: Boolean; const ADefaultDPI: Integer=96): Boolean;
var
  LDpi: UINT;
  LSize: sfVector2u;
  LScaleSize: sfVector2u;
  LPos: sfVector2i;
  LScreenSize: sfVector2i;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  // get window DPI
  LDpi := GetDpiForWindow(HWND(sfRenderWindow_getSystemHandle(AWindow)));

  // get window size
  //LSize := sfRenderWindow_getSize(AWindow);
  LSize.x := ABaseWidth;
  LSize.y := ABaseHeight;

  // get scaled widow size
  LScaleSize.x := MulDiv(LSize.x, LDPI, ADefaultDPI);
  LScaleSize.y := MulDiv(LSize.y, LDpi, ADefaultDPI);

  if ACenter then
  begin
    // get center window position
    LScreenSize := GetScreenWorkAreaSize;

    LPos.x := (Cardinal(LScreenSize.X) - LScaleSize.x) div 2;
    LPos.y := (Cardinal(LScreenSize.Y) - LScaleSize.y) div 2;

    // set new postion
    sfRenderWindow_setPosition(AWindow, LPos);
  end;

  // set new scale
  sfRenderWindow_setSize(AWindow, LScaleSize);

  // update scale & DPI
  AWindow.Scale := LDpi / ADefaultDPI;
  AWindow.Dpi := LDpi;

  Result := True;
end;

function sfRenderWindow_scaleOnDPIChange(const AWindow: PsfRenderWindow): Boolean;
begin
  Result := False;
  if sfRenderWindow_getDPI(AWindow) <> AWindow.Dpi then
  begin
    sfRenderWindow_scaleToDPI(AWindow, AWindow.Mode.width, AWindow.Mode.height, False, 96);
    Result := True;
  end;
end;

procedure sfRenderWindow_setDefaultIcon(const AWindow: PsfRenderWindow);
var
  IconHandle: HICON;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(HWND(sfRenderWindow_getSystemHandle(AWindow)), WM_SETICON, ICON_BIG, IconHandle);
  end;
end;

procedure sfRenderWindow_drawLine(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2: Single; const AColor: sfColor; const AThickness: Single);
var
  length, angle: Single;
  rectangle: PsfRectangleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  length := Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1));
  angle := ArcTan2(Y2 - Y1, X2 - X1) * (180 / Pi);

  rectangle := sfRectangleShape_create();
  try
    sfRectangleShape_setPosition(rectangle, sfVector2f_create(X1, Y1));
    sfRectangleShape_setSize(rectangle, sfVector2f_create(length, AThickness));
    sfRectangleShape_setFillColor(rectangle, AColor);
    sfRectangleShape_setRotation(rectangle, angle);

    sfRenderWindow_drawRectangleShape(AWindow.Handle, rectangle, nil);
  finally
    sfRectangleShape_destroy(rectangle);
  end;
end;

procedure sfRenderWindow_drawRect(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor);
var
  top, bottom, left, right: PsfRectangleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  // Top
  top := sfRectangleShape_create();
  sfRectangleShape_setPosition(top, sfVector2f_create(X, Y));
  sfRectangleShape_setSize(top, sfVector2f_create(AWidth, AThickness));
  sfRectangleShape_setFillColor(top, AColor);
  sfRenderWindow_drawRectangleShape(AWindow.Handle, top, nil);
  sfRectangleShape_destroy(top);

  // Bottom
  bottom := sfRectangleShape_create();
  sfRectangleShape_setPosition(bottom, sfVector2f_create(X, Y + AHeight - AThickness));
  sfRectangleShape_setSize(bottom, sfVector2f_create(AWidth, AThickness));
  sfRectangleShape_setFillColor(bottom, AColor);
  sfRenderWindow_drawRectangleShape(AWindow.Handle, bottom, nil);
  sfRectangleShape_destroy(bottom);

  // Left
  left := sfRectangleShape_create();
  sfRectangleShape_setPosition(left, sfVector2f_create(X, Y + AThickness));
  sfRectangleShape_setSize(left, sfVector2f_create(AThickness, AHeight - 2 * AThickness));
  sfRectangleShape_setFillColor(left, AColor);
  sfRenderWindow_drawRectangleShape(AWindow.Handle, left, nil);
  sfRectangleShape_destroy(left);

  // Right
  right := sfRectangleShape_create();
  sfRectangleShape_setPosition(right, sfVector2f_create(X + AWidth - AThickness, Y + AThickness));
  sfRectangleShape_setSize(right, sfVector2f_create(AThickness, AHeight - 2 * AThickness));
  sfRectangleShape_setFillColor(right, AColor);
  sfRenderWindow_drawRectangleShape(AWindow.Handle, right, nil);
  sfRectangleShape_destroy(right);
end;

procedure sfRenderWindow_drawFilledRect(const ARenderWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor);
var
  rectangle: PsfRectangleShape;
begin
  if not Assigned(ARenderWindow) then Exit;
  if not Assigned(ARenderWindow.Handle) then Exit;

  rectangle := sfRectangleShape_create();
  sfRectangleShape_setPosition(rectangle, sfVector2f_create(X, Y));
  sfRectangleShape_setSize(rectangle, sfVector2f_create(AWidth, AHeight));
  sfRectangleShape_setFillColor(rectangle, AColor);
  sfRenderWindow_drawRectangleShape(ARenderWindow.Handle, rectangle, nil);
  sfRectangleShape_destroy(rectangle);
end;

procedure sfRenderWindow_drawText(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: string; const AArgs: array of const);
var
  LText: string;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  if not Assigned(AText) then Exit;

  LText := Format(AMsg, AArgs);
  sfText_setUnicodeString(AText, LText);
  sfText_setColor(AText, AColor);
  sfText_setPosition(AText, sfVector2f_create(X, Y));
  psfml.sfRenderWindow_drawText(AWindow.Handle, AText, nil);
end;

procedure sfRenderWindow_drawCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius, AThickness: Single; const AColor: sfColor);
var
  circle: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  circle := sfCircleShape_create();
  sfCircleShape_setPosition(circle, sfVector2f_create(X - ARadius, Y - ARadius));
  sfCircleShape_setRadius(circle, ARadius);
  sfCircleShape_setFillColor(circle, TRANSPARENT);
  sfCircleShape_setOutlineThickness(circle, AThickness);
  sfCircleShape_setOutlineColor(circle, AColor);
  sfRenderWindow_drawCircleShape(AWindow.Handle, circle, nil);
  sfCircleShape_destroy(circle);
end;

procedure sfRenderWindow_drawFilledCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius: Single; const AColor: sfColor);
var
  circle: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  circle := sfCircleShape_create();
  sfCircleShape_setPosition(circle, sfVector2f_create(X - ARadius, Y - ARadius));
  sfCircleShape_setRadius(circle, ARadius);
  sfCircleShape_setFillColor(circle, AColor);
  sfRenderWindow_drawCircleShape(AWindow.Handle, circle, nil);
  sfCircleShape_destroy(circle);
end;

procedure sfRenderWindow_drawTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor, AOutlineColor: sfColor);
var
  triangle: PsfConvexShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  triangle := sfConvexShape_create();
  sfConvexShape_setPointCount(triangle, 3);
  sfConvexShape_setPoint(triangle, 0, sfVector2f_create(X1, Y1));
  sfConvexShape_setPoint(triangle, 1, sfVector2f_create(X2, Y2));
  sfConvexShape_setPoint(triangle, 2, sfVector2f_create(X3, Y3));
  sfConvexShape_setFillColor(triangle, TRANSPARENT);
  sfConvexShape_setOutlineThickness(triangle, AThickness);
  sfConvexShape_setOutlineColor(triangle, AOutlineColor);
  sfRenderWindow_drawConvexShape(AWindow.Handle, triangle, nil);
  sfConvexShape_destroy(triangle);
end;

procedure sfRenderWindow_drawFilledTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: sfColor);
var
  triangle: PsfConvexShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  triangle := sfConvexShape_create();
  sfConvexShape_setPointCount(triangle, 3);
  sfConvexShape_setPoint(triangle, 0, sfVector2f_create(X1, Y1));
  sfConvexShape_setPoint(triangle, 1, sfVector2f_create(X2, Y2));
  sfConvexShape_setPoint(triangle, 2, sfVector2f_create(X3, Y3));
  sfConvexShape_setFillColor(triangle, AColor);
  sfRenderWindow_drawConvexShape(AWindow.Handle, triangle, nil);
  sfConvexShape_destroy(triangle);
end;

procedure sfRenderWindow_drawPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor, AOutlineColor: sfColor);
var
  polygon: PsfConvexShape;
  i: Integer;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  polygon := sfConvexShape_create();
  sfConvexShape_setPointCount(polygon, Length(APoints));
  for i := 0 to Length(APoints) - 1 do
    sfConvexShape_setPoint(polygon, i, APoints[i]);
  sfConvexShape_setFillColor(polygon, Transparent);
  sfConvexShape_setOutlineThickness(polygon, AThickness);
  sfConvexShape_setOutlineColor(polygon, AOutlineColor);
  sfRenderWindow_drawConvexShape(AWindow.Handle, polygon, nil);
  sfConvexShape_destroy(polygon);
end;

procedure sfRenderWindow_drawFilledPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AColor: sfColor);
var
  polygon: PsfConvexShape;
  i: Integer;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  polygon := sfConvexShape_create();
  sfConvexShape_setPointCount(polygon, Length(APoints));
  for i := 0 to Length(APoints) - 1 do
    sfConvexShape_setPoint(polygon, i, APoints[i]);
  sfConvexShape_setFillColor(polygon, AColor);
  sfRenderWindow_drawConvexShape(AWindow.Handle, polygon, nil);
  sfConvexShape_destroy(polygon);
end;

procedure sfRenderWindow_drawPolyline(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor: sfColor);
var
  line: PsfVertexArray;
  i: Integer;
  vertex: sfVertex;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  line := sfVertexArray_create();
  sfVertexArray_setPrimitiveType(line, sfLinesStrip);
  for i := 0 to Length(APoints) - 1 do
  begin
    vertex.position := APoints[i];
    vertex.color := AColor;
    vertex.texCoords.x := 0;
    vertex.texCoords.y := 0;
    sfVertexArray_append(line, vertex);
  end;
  sfRenderWindow_drawVertexArray(AWindow.Handle, line, nil);
  sfVertexArray_destroy(line);
end;

procedure sfRenderWindow_drawEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor);
var
  ellipse: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  ellipse := sfCircleShape_create();
  sfCircleShape_setRadius(ellipse, 0.5);
  sfCircleShape_setOutlineThickness(ellipse, AThickness / AWidth);
  sfCircleShape_setFillColor(ellipse, Transparent);
  sfCircleShape_setOutlineColor(ellipse, AColor);
  sfCircleShape_setScale(ellipse, sfVector2f_create(AWidth, AHeight));
  sfCircleShape_setPosition(ellipse, sfVector2f_create(X, Y));
  sfRenderWindow_drawCircleShape(AWindow.Handle, ellipse, nil);
  sfCircleShape_destroy(ellipse);
end;

procedure sfRenderWindow_drawFilledEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor);
var
  ellipse: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  ellipse := sfCircleShape_create();
  sfCircleShape_setRadius(ellipse, 0.5);
  sfCircleShape_setFillColor(ellipse, AColor);
  sfCircleShape_setScale(ellipse, sfVector2f_create(AWidth, AHeight));
  sfCircleShape_setPosition(ellipse, sfVector2f_create(X, Y));
  sfRenderWindow_drawCircleShape(AWindow.Handle, ellipse, nil);
  sfCircleShape_destroy(ellipse);
end;

{ sfView }
procedure sfView_setLetterBox(const AView: PsfView; const AWindowWidth, AWindowHeight: Integer);
var
  LWindowRatio: Single;
  LViewRatio: Single;
  LViewPort: sfFloatRect;
  LHorizontalSpacing: Boolean;
begin
  LWindowRatio:= AWindowWidth / AWindowHeight;
  LViewRatio := sfView_getSize(AView).x / sfView_getSize(AView).y;
  LHorizontalSpacing := True;

  LViewPort.left := 0;
  LViewPort.top := 0;
  LViewPort.width := 1;
  LViewPort.height := 1;

  if LWindowRatio < LViewRatio then
    LHorizontalSpacing := false;

  if LHorizontalSpacing then
    begin
      LViewPort.width := LViewRatio / LWindowRatio;
      LViewPort.left := (1 - LViewPort.width) / 2.0;
    end
  else
    begin
      LViewPort.height := LWindowRatio / LViewRatio;
      LViewPort.top := (1 - LViewPort.height) / 2.0;
    end;

  sfView_setViewport(AView, LViewPort);
end;

function  sfView_createLetterBox(const AWindowWidth, AWindowHeight: Integer): PsfView;
begin
  Result := sfView_create;
  sfView_setSize(Result, sfVector2f_create(AWindowWidth, AWindowHeight));
  sfView_setCenter(Result, sfVector2f_create(sfView_getSize(Result).x/2, sfView_getSize(Result).y/2));
  sfView_setLetterBox(Result, AWindowWidth, AWindowHeight);
end;

{ sfFont }
function sfFont_createFromRes(const AInstance: HINST; const AResName: string): PsfFont;
var
  LResStream: TResourceStream;
begin
  Result := nil;
  if not ResourceExist(AInstance, AResName) then Exit;
  LResStream := TResourceStream.Create(AInstance, AResName, RT_RCDATA);
  try
    Result := sfFont_createFromMemory(LResStream.Memory, LResStream.Size);
  finally
    LResStream.Free;
  end;
end;

function sfFont_createDefaultFont: PsfFont;
begin
  Result := sfFont_createFromRes(HInstance, '0b0039416ae04dedaad41588e3751295');
end;

function sfFont_createFromStream(stream: PsfInputStream): PsfFont;
begin
  Result := psfml.sfFont_createFromStream(@stream.Base);
end;

{ sfText }
procedure sfText_setCharacterSize(const AWindow: PsfRenderWindow; const AText: PsfText; const ASize: Cardinal);
var
  LSize: Cardinal;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  if not Assigned(AText) then Exit;

  LSize := Round(ASize * AWindow.Scale);
  psfml.sfText_setCharacterSize(AText, LSize);
end;

procedure sfText_setUnicodeString(const AText: PsfText; const AString: string);
begin
  if not Assigned(AText) then Exit;
  psfml.sfText_setUnicodeString(AText, PsfUint32(WideStringToUCS4String(AString)));
end;



{ sfTexture }
function sfTexture_createFromRes(const AInstance: HINST; const AResName: string; const AArea: PsfIntRect): PsfTexture;
var
  LResStream: TResourceStream;
begin
  Result := nil;
  if not ResourceExist(AInstance, AResName) then Exit;
  LResStream := TResourceStream.Create(AInstance, AResName, RT_RCDATA);
  try
    Result := sfTexture_createFromMemory(LResStream.Memory, LResStream.Size, AArea);
  finally
    LResStream.Free;
  end;
end;

function sfTexture_createFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture;
begin
  Result := psfml.sfTexture_createFromStream(@stream.Base, area);
end;

function sfTexture_createSrgbFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture;
begin
  Result := psfml.sfTexture_createSrgbFromStream(@stream.Base, area);
end;

{ sfImage }
function sfImage_createFromStream(stream: PsfInputStream): PsfImage;
begin
  Result := psfml.sfImage_createFromStream(@stream.Base);
end;

{ sfMusic }
function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic;
begin
  Result := psfml.sfMusic_createFromStream(@stream.Base);
end;

{ sfSoundBuffer }
function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer;
begin
  Result := psfml.sfSoundBuffer_createFromStream(@stream.Base);
end;

{ sfShader }
function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader;
begin
  Result := psfml.sfShader_createFromStream(@vertexShaderStream.Base, @geometryShaderStream.Base, @fragmentShaderStream.Base);
end;

{ sfVideo }
type
  PsfVideo = ^TsfVideo;
  TsfVideo = record
  public const
    CPlmBufferSize = 1024*1;
    CSampleBuffSize  = 2304;
    Channels = 2;
    BufferSize = 44100 * Channels * sizeof(SmallInt);
  public
    DataBuffer: array[0..CPlmBufferSize-1] of Byte;
    SampleBuffer: array[0..CSampleBuffSize-1] of Byte;
    AudioDecodeBuffer1: array[0..CSampleBuffSize-1] of smallint;
    AudioDecodeBuffer2: array[0..(CSampleBuffSize*sizeof(smallint))-1] of Byte;
    Handle: Pplm_t;
    RingBuffer: TRingBuffer<Byte>;
    TextureWidth,TextureHeight: integer;
    Image: PsfImage;
    Texture: PsfTexture;
    Sprite: PsfSprite;
    AudioStream:  PsfSoundStream;
    InputStream: PsfInputStream;
    Loop: Boolean;
    SampleRate: Integer;
    FrameRate: Integer;
    Volume: Single;
    Status: sfVideoStatus;
    StopFlag: Boolean;
    Sender: Pointer;
    Handler: sfVideoStatusCallback;
    Name: string;
  end;

var
  sfVideo: TsfVideo;

procedure Video_OnGetVideoData(buffer: Pplm_buffer_t; user: Pointer); cdecl;
var
  LVideo: PsfVideo;

  LBytesRead: Int64;
begin
  LVideo := user;

  LBytesRead := sfInputStream_read(LVideo.InputStream, @LVideo.DataBuffer[0], LVideo.CPlmBufferSize);
  if LBytesRead > 0 then
    begin
      plm_buffer_write(Buffer, @LVideo.DataBuffer[0], LBytesRead);
    end
  else
    begin
      LVideo.StopFlag := True;
    end;
end;

function Video_OnGetSampleData(Data: PsfSoundStreamChunk; UserData: Pointer): sfBool; cdecl;
var
  LVideo: PsfVideo;
  LReadCount: Int64;
begin
  LVideo := UserData;
  Data.samples := @LVideo.SampleBuffer;
  //LReadCount := LVideo.RingBuffer.Read(LVideo.SampleBuffer, 1024*2);
  LReadCount := LVideo.RingBuffer.Read(LVideo.SampleBuffer, LVideo.CSampleBuffSize);
  Data.sampleCount := LReadcount div LVideo.Channels;
  Result := sfTrue;
end;

procedure Video_OnDecodeAudio(plm: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;
var
  LVideo: PsfVideo;
  i: Integer;
begin
  LVideo := user;

  for i := 0 to LVideo.CSampleBuffSize-1 do
  begin
    LVideo.AudioDecodeBuffer1[i] := FloatToSmallInt(samples.interleaved[i]);
  end;

  Move(LVideo.AudioDecodeBuffer1, LVideo.AudioDecodeBuffer2, Sizeof(LVideo.AudioDecodeBuffer1));
  LVideo.ringBuffer.Write(LVideo.AudioDecodeBuffer2, LVideo.CSampleBuffSize*sizeof(smallint));
end;

procedure Video_OnDecodeVideo(plm: pplm_t; frame: pplm_frame_t; user: pointer); cdecl;
var
  LVideo: PsfVideo;
begin
  LVideo := user;

  plm_frame_to_rgba(Frame, PUInt8(sfImage_getPixelsPtr(LVideo.Image)), 4*LVideo.Texturewidth);
  sfTexture_updateFromImage(LVideo.Texture, LVideo.Image, 0, 0);
end;

function  sfVideo_playFromStream(const AStream: PsfInputStream; const AVolume: Single; const ALoop: Boolean; const AName: string; const ASender: Pointer; const AHandler: sfVideoStatusCallback): Boolean;
var
  LDataBuffer: Pplm_buffer_t;
begin
  Result := False;

  sfVideo_destroy;

  sfVideo.Volume := AVolume;
  sfVideo.Loop := ALoop;
  sfVideo.Status := vsStopped;
  sfVideo.InputStream := AStream;

  LDataBuffer := plm_buffer_create_with_capacity(sfVideo.CPlmBufferSize);
  if not Assigned(LDataBuffer) then Exit;

  plm_buffer_set_load_callback(LDataBuffer, Video_OnGetVideoData, @sfVideo);

  sfVideo.Handle := plm_create_with_buffer(LDataBuffer, 1);
  if not Assigned(sfVideo.Handle) then
  begin
    plm_buffer_destroy(LDataBuffer);
    Exit;
  end;

  plm_set_loop(sfVideo.Handle, 0);

  sfVideo.TextureWidth := plm_get_width(sfVideo.Handle);
  sfVideo.TextureHeight := plm_get_height(sfVideo.Handle);

  sfVideo.SampleRate := plm_get_samplerate(sfVideo.Handle);

  plm_set_audio_decode_callback(sfVideo.Handle, @Video_OnDecodeAudio, @sfVideo);
  plm_set_video_decode_callback(sfVideo.Handle, @Video_OnDecodeVideo, @sfVideo);
  plm_set_audio_lead_time(sfVideo.Handle, sfVideo.CSampleBuffSize/sfVideo.SampleRate);

  sfVideo.Image := sfImage_createFromColor(sfVideo.TextureWidth, sfVideo.TextureHeight, WHITE);
  if not Assigned(sfVideo.Image) then
  begin
    plm_destroy(sfVideo.Handle);
    Exit;
  end;

  sfVideo.Texture := sfTexture_create(sfVideo.TextureWidth, sfVideo.TextureHeight);
  if not Assigned(sfVideo.Texture) then
  begin
    sfImage_destroy(sfVideo.Image);
    plm_destroy(sfVideo.Handle);
  end;

  sfVideo.Sprite := sfSprite_create;
  if not Assigned(sfVideo.Sprite) then
  begin
    sfTexture_destroy(sfVideo.Texture);
    sfImage_destroy(sfVideo.Image);
    plm_destroy(sfVideo.Handle);
    Exit;
  end;

  sfSprite_setTexture(sfVideo.Sprite, sfVideo.Texture, sfTrue);

  sfVideo.RingBuffer := TRingBuffer<byte>.Create(sfVideo.BufferSize);
  if not Assigned(sfVideo.RingBuffer) then
  begin
    sfSprite_destroy(sfVideo.Sprite);
    sfTexture_destroy(sfVideo.Texture);
    sfImage_destroy(sfVideo.Image);
    plm_destroy(sfVideo.Handle);
  end;

  sfVideo.AudioStream := sfSoundStream_create(Video_OnGetSampleData, nil, 2, 44100, @sfVideo);
  if not Assigned(sfVideo.AudioStream) then
  begin
    FreeNilObject(sfVideo.RingBuffer);
    sfSprite_destroy(sfVideo.Sprite);
    sfTexture_destroy(sfVideo.Texture);
    sfImage_destroy(sfVideo.Image);
    plm_destroy(sfVideo.Handle);
  end;

  sfVideo.Sender := ASender;
  sfVideo.Handler := AHandler;
  sfVideo.Name := AName;
  sfVideo.Status := vsPlaying;

  if Assigned(sfVideo.Handler) then
  begin
    sfVideo.Handler(sfVideo.Sender, sfVideo.Status, sfVideo.Name);
  end;

  sfSoundStream_play(sfVideo.AudioStream);
  sfVideo_setVolume(AVolume);

  Result := True;
end;

function  sfVideo_playFromFile(const AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer; const AHandler: sfVideoStatusCallback): Boolean;
var
  LStream: PsfInputStream;
begin
  Result := False;
  LStream := sfInputStream_createFromFile(AFilename);
  if not Assigned(LStream) then Exit;

  Result := sfVideo_playFromStream(LStream, AVolume, ALoop, AFilename, ASender, aHandler);
end;

function  sfVideo_playFromZipFile(const AZipFilename, AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer; const AHandler: sfVideoStatusCallback; const APassword: string): Boolean;
var
  LStream: PsfInputStream;
begin
  Result := False;
  LStream := sfInputStream_createFromZipFile(AZipFilename, AFilename, APassword);
  if not Assigned(LStream) then Exit;

  Result := sfVideo_playFromStream(LStream, AVolume, ALoop, AFilename, ASender, aHandler);
end;


procedure sfVideo_destroy();
begin
  if Assigned(sfVideo.AudioStream) then
  begin
    sfSoundStream_stop(sfVideo.AudioStream);
    sfSoundStream_destroy(sfVideo.AudioStream);
    sfVideo.RingBuffer.Clear;
  end;

  if Assigned(sfVideo.Sprite) then
    sfSprite_destroy(sfVideo.Sprite);

  if Assigned(sfVideo.Texture) then
    sfTexture_destroy(sfVideo.Texture);

  if Assigned(sfVideo.Image) then
    sfImage_destroy(sfVideo.Image);

  if Assigned(sfVideo.RingBuffer) then
    sfVideo.RingBuffer.Free;

  if Assigned(sfVideo.Handle) then
    plm_destroy(sfVideo.Handle);

  if Assigned(sfVideo.InputStream) then
    sfInputStream_close(sfVideo.InputStream);

  sfVideo := Default(TsfVideo);
end;

function sfVideo_Update(const AWindow: PsfRenderWindow): sfVideoStatus;
begin
  Result := sfVideo.Status;

  if not Assigned(sfVideo.Handle) then Exit;
  if not Assigned(sfVideo.AudioStream) then Exit;
  if not Assigned(sfVideo.InputStream) then Exit;
  if sfVideo.Status <> vsPlaying then Exit;

  if sfVideo.StopFlag then
    begin
      if sfVideo.Loop then
        begin
          sfSoundStream_stop(sfVideo.AudioStream);
          sfVideo.RingBuffer.Clear;
          plm_rewind(sfVideo.Handle);
          sfInputStream_seek(sfVideo.InputStream, 0);
          sfSoundStream_play(sfVideo.AudioStream);
          sfVideo.Status := vsPlaying;
          sfVideo.StopFlag := False;
        end
      else
        begin
          sfVideo.Status := vsStopped;
          sfSoundStream_stop(sfVideo.AudioStream);
          sfVideo.RingBuffer.Clear;
          if Assigned(sfVideo.Handler) then
          begin
            sfVideo.Handler(sfVideo.Sender, sfVideo.Status, sfVideo.Name);
          end;
        end;
    end
  else
    begin
      plm_decode(sfVideo.Handle, 1.0/AWindow.Timing.Limit);
    end;

  Result := sfVideo.Status;
end;

procedure sfVideo_render(const AWindow: PsfRenderWindow; const X, Y, AScale: Single);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  if not Assigned(sfVideo.Handle) then Exit;
  if sfVideo.Status <> vsPlaying then Exit;
  sfSprite_setScale(sfVideo.Sprite, sfVector2f_create(AScale, AScale));
  sfRenderWindow_drawSprite(AWindow, sfVideo.Sprite, nil);
end;

function  sfVideo_getStatus(): sfVideoStatus;
begin
  Result := sfVideo.Status;
end;

function  sfVideo_getLoop(): Boolean;
begin
  Result := sfVideo.Loop;
end;

procedure sfVideo_setLoop(const ALoop: Boolean);
begin
  sfVideo.Loop := ALoop;
end;

function  sfVideo_getVolume(): Single;
begin
  Result := sfVideo.Volume;
end;

procedure sfVideo_setVolume(const AVolume: Single);
begin
  if not Assigned(sfVideo.AudioStream) then Exit;
  sfVideo.Volume := EnsureRange(AVolume, 0, 1);
  sfSoundStream_setVolume(sfVideo.AudioStream, UnitToScalarValue(sfVideo.Volume, 100));
end;

//=== IMGUI ==================================================================
function ImFontAtlas_AddFontFromResTTF(self: PImFontAtlas; const AInstance: HINST; const AResName: string; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont;
type
  TImWchar = Word;
var
  LResStream: TResourceStream;
  LConfig: ImFontConfig;
begin
  Result := nil;
  if not ResourceExist(AInstance, AResName) then Exit;
  LResStream := TResourceStream.Create(AInstance, AResName, RT_RCDATA);
  try
    FillChar(LConfig, SizeOf(LConfig), 0);
    LConfig.FontData := LResStream.Memory;
    LConfig.FontDataSize := LResStream.Size;
    LConfig.SizePixels := size_pixels;
    LConfig.FontDataOwnedByAtlas := False;
    LConfig.OversampleH := 2;
    LConfig.OversampleV := 1;
    LConfig.GlyphMaxAdvanceX := MaxSingle;
    LConfig.RasterizerMultiply := 1.0;
    LConfig.RasterizerDensity := 1.0;
    LConfig.EllipsisChar := TImWchar(-1);

    Result := ImFontAtlas_AddFontFromMemoryTTF(self, LResStream.Memory, LResStream.Size, size_pixels, @LConfig, glyph_ranges);
  finally
    LResStream.Free;
  end;
end;

function ImFontAtlas_AddDefaultFontTTF(self: PImFontAtlas; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont;
begin
  Result := ImFontAtlas_AddFontFromResTTF(self, HInstance, '0b0039416ae04dedaad41588e3751295', size_pixels, font_cfg, glyph_ranges);
end;

//=== IMGUI-SFML =============================================================
function ImGui_SFML_Init_RenderWindow(window: PsfRenderWindow; loadDefaultFont: Boolean): Boolean;
begin
  Result := psfml.ImGui_SFML_Init_RenderWindow(window.Handle, loadDefaultFont);
end;

procedure ImGui_SFML_ProcessEvent_Window(window: PsfRenderWindow; event: PsfEvent);
begin
  psfml.ImGui_SFML_ProcessEvent_Window(window.Handle, event)
end;

procedure ImGui_SFML_Render_RenderWindow(window: PsfRenderWindow);
begin
  psfml.ImGui_SFML_Render_RenderWindow(window.Handle);
end;


{$REGION ' UNIT INIT '}
initialization
begin
  sfVideo := Default(TsfVideo);
end;

finalization
begin
end;
{$ENDREGION}

end.
