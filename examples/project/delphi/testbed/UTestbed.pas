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
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

unit UTestbed;

interface

uses
  System.SysUtils,
  WinApi.Windows,
  psfml,
  psfml.ext,
  psfml.utils;

const
  CZipFilename = 'Data.zip';

type

  { TTestbed }
  TTestbed = class
  public
    constructor Create(); virtual;
    destructor Destroy(); override;
    procedure Run(); virtual;
    procedure BuildZipFile();
    procedure StreamMusicFromZipFile();
    procedure HiDPIWindow();
    procedure OnVideoStatus(const AStatus: sfVideoStatus; const AFilename: string);
    procedure MPEG1VideoPlayback();
    procedure ParallaxTexture();
    procedure ImGUI();

  end;

procedure RunTestbed();

implementation

procedure RunTestbed();
var
  LTestbed: TTestbed;
begin
  LTestbed := TTestbed.Create();
  try
    LTestbed.Run();
  finally
    LTestbed.Free();
  end;
end;

{ TTestbed }
constructor TTestbed.Create();
begin
  inherited;
end;

destructor TTestbed.Destroy();
begin
  inherited;
end;

procedure TTestbed.Run();
var
  LOption: string;
  LDone: Boolean;
begin
  LDone := False;
  repeat
    ClearConsole();
    PrintLn('>>>>>>> MENU <<<<<<<<');
    PrintLn();
    PrintLn('1. Build ZipFile');
    PrintLn('2. Stream Music from ZipFile');
    PrintLn('3. HiDPI Window');
    PrintLn('4. MPEG1 Video Playback');
    PrintLn('5. Parallax Texture');
    PrintLn('6. ImGUI');
    PrintLn('Q. Quit');
    PrintLn();
    Print('Select: ');
    LOption := ReadLnX(['q', 'Q', '1', '2', '3', '4', '5', '6'], 1).ToLower;
    if LOption.Length = 0 then continue;
    case Ord(LOption[1]) of
      Ord('1'): BuildZipFile();
      Ord('2'): StreamMusicFromZipFile();
      Ord('3'): HiDPIWindow();
      Ord('4'): MPEG1VideoPlayback();
      Ord('5'): ParallaxTexture();
      Ord('6'): ImGUI();
      Ord('q'): LDone := True;
    end;
  until LDone;
end;

procedure TTestbed.BuildZipFile();
begin
  PrintLn(CRLF+'Building %s...', [CZipFilename], CONBRIGHTWHITE);

  if sfZipFile_build(CZipFilename, 'res') then
    PrintLn(#10#10+'Success!', CONMAGENTA)
  else
    PrintLn(#10#10+'Failed!', CONRED);

  Pause();
end;

procedure TTestbed.StreamMusicFromZipFile();
const
  CMusicFilename = 'res/music/song01.ogg';
var
  LStream: PsfInputStream;
  LMusic: PsfMusic;
begin
  Print(CRLF+'Playing "%s" in real-time from "%s"...', [CMusicFilename, CZipFilename], CONYELLOW);
  LStream := sfInputStream_createFromZipFile(CZipFilename, CMusicFilename);
  if not Assigned(LStream) then Exit;
  try
    LMusic := sfMusic_createFromStream(LStream);
    if not Assigned(LMusic) then Exit;
    try
      sfMusic_play(LMusic);
      while sfMusic_getStatus(LMusic) = sfPlaying do
      begin
        Sleep(0);
      end;
    finally
      sfMusic_stop(LMusic);
      sfMusic_destroy(LMusic);
    end;
  finally
    sfInputStream_close(LStream);
  end;
end;

procedure TTestbed.HiDPIWindow();
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

procedure TTestbed_VideoStatusEvent(const ASender: Pointer; const AStatus: sfVideoStatus; const AFilename: string);
begin
  // if sender is not nil, pass on to TTestbed.OnVideoStatus method
  if Assigned(ASender) then
  begin
    TTestbed(ASender).OnVideoStatus(AStatus, AFilename);
  end;
end;

procedure TTestbed.OnVideoStatus(const AStatus: sfVideoStatus; const AFilename: string);
begin
  // check if video has stopped, then start next video playing
  if AStatus = vsStopped then
  begin
    if AFilename = 'res/videos/sample01.mpg' then
      sfVideo_playFromZipFile(CZipFilename, 'res/videos/tinyBigGAMES.mpg', 1.0, False, Self, TTestbed_VideoStatusEvent)
    else
    if AFilename = 'res/videos/tinyBigGAMES.mpg' then
      sfVideo_playFromZipFile(CZipFilename, 'res/videos/sample01.mpg', 1.0, False, Self, TTestbed_VideoStatusEvent);
  end;
end;

procedure TTestbed.MPEG1VideoPlayback();
var
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: PsfFont;
  LText: PsfText;
begin
  // create window
  LRenderWindow := sfRenderWindow_create('SFML: MPEG1 Video Playback');

  // init default font
  LFont := sfFont_createDefaultFont;

  // init text
  LText := sfText_create;
  sfText_setFont(LText, LFont);
  sfText_setCharacterSize(LRenderWindow, LText, 12);

  // start video playback
  sfVideo_playFromZipFile(CZipFilename, 'res/videos/tinyBigGAMES.mpg', 1.0, False, Self, TTestbed_VideoStatusEvent);

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

    // update video
    if sfVideo_Update(LRenderWindow) = vsStopped then Break;

    // clear window
    sfRenderWindow_clear(LRenderWindow, DARKSLATEBROWN);

    // render video
    sfVideo_render(LRenderWindow, 0, 0, 0.5);

    // display fps
    sfRenderWindow_drawText(LRenderWindow, LText, 3, 3, WHITE, '%d fps', [sfRenderWindow_getFrameRate(LRenderWindow)]);

    // display rendering
    sfRenderWindow_display(LRenderWindow);
  end;

  // destroy video
  sfVideo_destroy();

  // destroy text
  sfText_destroy(LText);

  // destroy font
  sfFont_destroy(LFont);

  // destroy window
  sfRenderWindow_destroy(LRenderWindow);
end;

procedure TTestbed.ParallaxTexture();
const
  //SCREEN_WIDTH  = 720  div 2;
  //SCREEN_HEIGHT = 1080 div 2;

  //SCREEN_WIDTH  = 1080 div 2;
  //SCREEN_HEIGHT = 1920 div 2;

  SCREEN_WIDTH  = 480;
  SCREEN_HEIGHT = 720;
var
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: PsfFont;
  LText: PsfText;
  LTexture: array[0..3] of PsfTexture;
  LSprite: array[0..3] of PsfSprite;
  LRect: sfIntRect;
  LOffset: array[0..3] of Single;
  LScrollSpeed: array[0..3] of Single;
  LStream: PsfInputStream;
  LStates: sfRenderStates;
begin
  // create window
  LRenderWindow := sfRenderWindow_create('SFML: Parallax Texture', SCREEN_WIDTH, SCREEN_HEIGHT);

  // init default font
  LFont := sfFont_createDefaultFont;

  // init text
  LText := sfText_create;
  sfText_setFont(LText, LFont);
  sfText_setCharacterSize(LRenderWindow, LText, 12);

  // init texture #1
  LStream := sfInputStream_createFromZipFile(CZipFilename, 'res/backgrounds/space.png');
  LTexture[0] := sfTexture_createFromStream(LStream, nil);
  sfInputStream_close(LStream);
  sfTexture_setRepeated(LTexture[0], sfTrue);
  LSprite[0] := sfSprite_create();
  sfSprite_setTexture(LSprite[0], LTexture[0], sfFalse);

  // init texture #2
  LStream := sfInputStream_createFromZipFile(CZipFilename, 'res/backgrounds/nebula1.png');
  LTexture[1] := sfTexture_createFromStream(LStream, nil);
  sfInputStream_close(LStream);
  sfTexture_setRepeated(LTexture[1], sfTrue);
  LSprite[1] := sfSprite_create();
  sfSprite_setTexture(LSprite[1], LTexture[1], sfFalse);

  // init texture #3
  LStream := sfInputStream_createFromZipFile(CZipFilename, 'res/backgrounds/spacelayer1.png');
  LTexture[2] := sfTexture_createFromStream(LStream, nil);
  sfInputStream_close(LStream);
  sfTexture_setRepeated(LTexture[2], sfTrue);
  LSprite[2] := sfSprite_create();
  sfSprite_setTexture(LSprite[2], LTexture[2], sfFalse);

  // init texture #4
  LStream := sfInputStream_createFromZipFile(CZipFilename, 'res/backgrounds/spacelayer2.png');
  LTexture[3] := sfTexture_createFromStream(LStream, nil);
  sfInputStream_close(LStream);
  sfTexture_setRepeated(LTexture[3], sfTrue);
  LSprite[3] := sfSprite_create();
  sfSprite_setTexture(LSprite[3], LTexture[3], sfFalse);

  // init texture rects
  LRect.left := 0;
  LRect.top := 0;
  LRect.width := SCREEN_WIDTH;
  LRect.height := SCREEN_HEIGHT;

  // init texture offsets
  LOffset[0] := 0;
  LOffset[1] := 0;
  LOffset[2] := 0;
  LOffset[3] := 0;

  // i nit texture scroll speeds
  LScrollSpeed[0] := -0.4;
  LScrollSpeed[1] := -0.6;
  LScrollSpeed[2] := -0.8;
  LScrollSpeed[3] := -1.0;


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

    LOffset[0] := LOffset[0] + LScrollSpeed[0];
    LRect.top := Round(LOffset[0]);
    sfSprite_setTextureRect(LSprite[0], LRect);

    LOffset[1] := LOffset[1] + LScrollSpeed[1];
    LRect.top := Round(LOffset[1]);
    sfSprite_setTextureRect(LSprite[1], LRect);

    LOffset[2] := LOffset[2] + LScrollSpeed[2];
    LRect.top := Round(LOffset[2]);
    sfSprite_setTextureRect(LSprite[2], LRect);

    LOffset[3] := LOffset[3] + LScrollSpeed[3];
    LRect.top := Round(LOffset[3]);
    sfSprite_setTextureRect(LSprite[3], LRect);

    // clear window
    sfRenderWindow_clear(LRenderWindow, DARKSLATEBROWN);

    // render video
    sfVideo_render(LRenderWindow, 0, 0, 0.5);

    // render texture #1 with no alpha blending
    sfRenderWindow_drawSprite(LRenderWindow, LSprite[0], nil);

    // render all other textures using alpha blending
    LStates.blendMode := sfBlendAdd;
    LStates.transform := sfTransform_Identity;
    LStates.texture := nil;
    LStates.shader := nil;
    sfRenderWindow_drawSprite(LRenderWindow, LSprite[1], @LStates);
    sfRenderWindow_drawSprite(LRenderWindow, LSprite[2], @LStates);
    sfRenderWindow_drawSprite(LRenderWindow, LSprite[3], @LStates);

    // display fps
    sfRenderWindow_drawText(LRenderWindow, LText, 3, 3, WHITE, '%d fps', [sfRenderWindow_getFrameRate(LRenderWindow)]);

    // display rendering
    sfRenderWindow_display(LRenderWindow);
  end;

  // destroyo sprites/textures
  sfSprite_destroy(LSprite[3]);
  sfTexture_destroy(LTexture[3]);

  sfSprite_destroy(LSprite[2]);
  sfTexture_destroy(LTexture[2]);

  sfSprite_destroy(LSprite[1]);
  sfTexture_destroy(LTexture[1]);

  sfSprite_destroy(LSprite[0]);
  sfTexture_destroy(LTexture[0]);

  // destroy text
  sfText_destroy(LText);

  // destroy font
  sfFont_destroy(LFont);

  // destroy window
  sfRenderWindow_destroy(LRenderWindow);
end;

procedure TTestbed.ImGUI();
var
  LRenderWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: PsfFont;
  LText: PsfText;
  LIO: PImGuiIO;
  LShowDemoWindow: Boolean;
  LShowAnotherWindow: Boolean;
  LFloatValue: Single;
  LCounter: Integer;
  LClearColor: ImVec4;
  LButtonSize: ImVec2;
  LColor: sfColor;

  procedure ResizeFont();
  begin
    ImFontAtlas_Clear(LIO.Fonts);
    ImFontAtlas_AddDefaultFontTTF(LIO.Fonts, Round(16*LRenderWindow.Scale), nil, nil);
    ImGui_SFML_UpdateFontTexture();
  end;

begin
  // init GUI variables
  LShowDemoWindow := True;
  LShowAnotherWindow := False;
  LFloatValue := 0;
  LCounter := 0;
  LClearColor.x := 0.45;
  LClearColor.y := 0.55;
  LClearColor.z := 0.60;
  LClearColor.w := 1.00;

  // create window
  LRenderWindow := sfRenderWindow_create('SFML: ImGUI');

  // init default font
  LFont := sfFont_createDefaultFont;

  // init text
  LText := sfText_create;
  sfText_setFont(LText, LFont);
  sfText_setCharacterSize(LRenderWindow, LText, 10);

  // init imgui
  ImGui_SFML_Init_RenderWindow(LRenderWindow, True);
  LIO := igGetIO();
  LIO.MouseDrawCursor := True;
  LIO.ConfigFlags := LIO.ConfigFlags or Ord(ImGuiConfigFlags_NavEnableKeyboard);
  LIO.ConfigFlags := LIO.ConfigFlags or Ord(ImGuiConfigFlags_DockingEnable);
  LIO.ConfigFlags := LIO.ConfigFlags or Ord(ImGuiConfigFlags_ViewportsEnable);
  LIO.ConfigFlags := LIO.ConfigFlags or Ord(ImGuiConfigFlags_DpiEnableScaleViewports);
  LIO.ConfigFlags := LIO.ConfigFlags or Ord(ImGuiConfigFlags_DpiEnableScaleFonts);

  // resize font base on DPI
  ResizeFont();

  // start game loop
  while sfRenderWindow_isOpen(LRenderWindow) = sfTrue do
  begin

    // process events
    while sfRenderWindow_pollEvent(LRenderWindow, @LEvent) = sfTrue do
    begin
      // process imgui events
      ImGui_SFML_ProcessEvent_Window(LRenderWindow, @LEvent);

      // close window
      if LEvent.&type = sfEvtClosed then
        sfRenderWindow_close(LRenderWindow);
    end;

    // process DPI/monitor changes
    if sfRenderWindow_scaleOnDPIChange(LRenderWindow) then
    begin
      // on dpi change, resize font
      ResizeFont();
    end;

    // new imgui frame
    igNewFrame();

    // check to show demo window
    if LShowDemoWindow then
      igShowDemoWindow(@LShowDemoWindow);

    // process window #1
    igBegin('Hello, world!', nil, Ord(ImGuiWindowFlags_AlwaysAutoResize));
      igText('This is some useful text');
      igCheckbox('Demo window', @LShowDemoWindow);
      igCheckbox('Another window', @LShowAnotherWindow);

      igSliderFloat('Float', @LFloatValue, 0.0, 1.0, '%.3f', 0);
      igColorEdit3('clear color', @LClearColor, 0);

      LButtonSize.x := 0;
      LButtonSize.y := 0;
      if igButton('Button', LButtonSize) then
        LCounter := LCounter + 1;
      igSameLine(0.0, -1.0);
      igText('counter = %d', LCounter);

      igText('Application average %.3f ms/frame (%.1f FPS)', 1000.0 / igGetIO().Framerate, igGetIO().Framerate);
    igEnd();

    // process window #2
    if LShowAnotherWindow then
    begin
      igBegin('imgui Another Window', @LshowAnotherWindow, Ord(ImGuiWindowFlags_AlwaysAutoResize));
      igText('Hello from imgui');
      LButtonSize.x := 0; LButtonSize.y := 0;
      if igButton('Close me', LButtonSize) then
        LShowAnotherWindow := false;
      igEnd();
    end;

    // render imgui
    igRender();

    // end imgui frame
    igEndFrame();

    // clear window
    LColor.r := Round(LClearColor.x * 255);
    LColor.g := Round(LClearColor.y * 255);
    LColor.b := Round(LClearColor.z * 255);
    LColor.a := Round(LClearColor.w * 255);
    sfRenderWindow_clear(LRenderWindow, LColor);

    // display fps
    sfRenderWindow_drawText(LRenderWindow, LText, 3, 23, WHITE, '%d fps', [sfRenderWindow_getFrameRate(LRenderWindow)]);

    // render imgui
    ImGui_SFML_Render_RenderWindow(LRenderWindow);

    // display rendering
    sfRenderWindow_display(LRenderWindow);
  end;

  // destroy text
  sfText_destroy(LText);

  // destroy font
  sfFont_destroy(LFont);

  // destroy window
  sfRenderWindow_destroy(LRenderWindow);

  // shutdown imgui
  ImGui_SFML_Shutdown();
end;

end.
