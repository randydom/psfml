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

unit psfml.utils;

{$I psfml.defines.inc}

interface

uses
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.SyncObjs,
  System.Math,
  WinApi.Messages,
  WinApi.Windows,
  psfml;

const
  LF   = #10;
  CR   = #13;
  CRLF = LF+CR;

  CONBRIGHTYELLOW = FOREGROUND_RED OR FOREGROUND_GREEN OR
    FOREGROUND_INTENSITY;
  CONYELLOW       = FOREGROUND_RED OR FOREGROUND_GREEN;
  CONWHITE        = FOREGROUND_RED OR FOREGROUND_GREEN OR FOREGROUND_BLUE;
  CONBRIGHTWHITE  = FOREGROUND_RED OR FOREGROUND_GREEN OR FOREGROUND_BLUE OR
    FOREGROUND_INTENSITY;
  CONDARKGREEN    = FOREGROUND_GREEN;
  CONDARKGRAY     = FOREGROUND_INTENSITY;
  CONCYAN         = FOREGROUND_GREEN OR FOREGROUND_BLUE;
  CONMAGENTA      = FOREGROUND_RED OR FOREGROUND_BLUE;
  CONRED          = FOREGROUND_RED;

procedure ClearConsole();
function  ClearConsoleScreen(const hConsole: THandle): Boolean;
procedure SetTextColor(aColor: Word);
procedure ClearLine(aColor: Word);
procedure ClearLineFromCursor(aColor: Word);
function  GetConsoleWidth(): Integer;
procedure SetConsoleTitle(const ATitle: string);
function  HasConsoleOutput(): Boolean;
function  WasRunFromConsole() : Boolean;
function  IsStartedFromDelphiIDE(): Boolean;
procedure WaitForAnyKey();
function  AnyKeyPressed: Boolean;
procedure ClearKeyStates();
function  IsKeyPressed(AKey: Byte): Boolean;
function  WasKeyReleased(AKey: Byte): Boolean;
function  WasKeyPressed(AKey: Byte): Boolean;
procedure Pause(aColor: DWORD=ConWhite; const aMsg: string='');
procedure ClearKeyboardBuffer();
function  ReadKey(): Char;
function  ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer): string;
function  WrapTextEx(const aLine: string; aMaxCol: Integer; const aBreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
procedure Print(const aMsg: string; const aArgs: array of const; const aColor: DWORD=CONWHITE); overload;
procedure Print(const aMsg: string; const aColor: DWORD=CONWHITE); overload;
procedure PrintLn(const aMsg: string; const aArgs: array of const; const aColor: DWORD=CONWHITE); overload;
procedure PrintLn(const aMsg: string; const aColor: DWORD=CONWHITE); overload;
procedure PrintLn(); overload;
procedure Print(); overload;
function  RandomBool(): Boolean; overload;
procedure Teletype(const aText: string; const aColor: DWORD; const aMargin: Integer; const aMinDelay: Integer; const aMaxDelay: Integer; const ABreakKey: Byte);
function  UnitToScalarValue(const aValue, aMaxValue: Double): Double;
procedure FreeNilObject(const [ref] AObject: TObject);
procedure SetDefaultIcon(AWindow: HWND); overload;
function  ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
procedure EnterCriticalSection();
procedure LeaveCriticalSection();
function  AsUTF8(const AText: string): Pointer;
function  GetTempStaticBuffer(): PByte;
function  GetTempStaticBufferSize(): Integer;
function  GetScreenWorkAreaSize(): sfVector2i;
function  SampleTimeToPosition(SampleRate: Integer; TimeInSeconds: Double; Channels: Integer; SampleSizeInBits: Integer): Int64;
function  FloatToSmallInt(Value: Single): SmallInt; inline;

{ =========================================================================== }

type
  { TVirtualBuffer }
  TVirtualBuffer = class(TCustomMemoryStream)
  protected
    FHandle: THandle;
    FName: string;
    procedure Clear;
  public
    constructor Create(aSize: Cardinal);
    destructor Destroy; override;
    function Write(const aBuffer; aCount: Longint): Longint; override;
    function Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint; override;
    procedure SaveToFile(aFilename: string);
    property Name: string read FName;
    function  Eob: Boolean;
    function  ReadString: WideString;
    class function LoadFromFile(const aFilename: string): TVirtualBuffer;
  end;

{ TRingBuffer }
  TRingBuffer<T> = class
  private type
    PType = ^T;
  private
    FBuffer: array of T;
    FReadIndex, FWriteIndex, FCapacity: Integer;
  public
    constructor Create(ACapacity: Integer);
    function Write(const AData: array of T; ACount: Integer): Integer;
    function Read(var AData: array of T; ACount: Integer): Integer;
    function DirectReadPointer(ACount: Integer): Pointer;
    function AvailableBytes: Integer;
    procedure Clear;
  end;

  { TVirtualRingBuffer }
  TVirtualRingBuffer<T> = class
  private type
    PType = ^T;
  private
    FBuffer: TVirtualBuffer;
    FReadIndex, FWriteIndex, FCapacity: Integer;
    function GetArrayValue(AIndex: Integer): T;
    procedure SetArrayValue(AIndex: Integer; AValue: T);
  public
    constructor Create(ACapacity: Integer);
    destructor Destroy; override;
    function Write(const AData: array of T; ACount: Integer): Integer;
    function Read(var AData: array of T; ACount: Integer): Integer;
    function DirectReadPointer(ACount: Integer): Pointer;
    function AvailableBytes: Integer;
    procedure Clear;
  end;

implementation

const
  CTempStaticBufferSize = 4096;

var
  KeyState: array [0..1, 0..255] of Boolean;
  CriticalSection: TCriticalSection;
  Marshaller: TMarshaller;
  TempStaticBuffer: array[0..CTempStaticBufferSize - 1] of Byte;

procedure ClearConsole();
begin
  // Clear the console screen
  Win32Check(ClearConsoleScreen(GetStdHandle(STD_OUTPUT_HANDLE)));
end;

function ClearConsoleScreen(const hConsole: THandle): Boolean;
var
  csbi: TConsoleScreenBufferInfo;
  ConsoleSize: DWORD;
  Coord: TCoord;
  CharsWritten: DWORD;
begin
  Result := False;
  if GetConsoleScreenBufferInfo(hConsole, csbi) then
  begin
    ConsoleSize := csbi.dwSize.X * csbi.dwSize.Y;
    Coord.X := 0;
    Coord.Y := 0;

    if FillConsoleOutputCharacter(hConsole, ' ', ConsoleSize, Coord, CharsWritten) then
      if FillConsoleOutputAttribute(hConsole, csbi.wAttributes, ConsoleSize, Coord, CharsWritten) then
        Result := SetConsoleCursorPosition(hConsole, Coord);
  end;
end;

procedure SetTextColor(aColor: Word);
var
  LConsoleHandle: THandle;
begin
  LConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  SetConsoleTextAttribute(LConsoleHandle, aColor);
end;

procedure ClearLine(aColor: Word);
var
  LConsoleOutput: THandle;
  LConsoleInfo: TConsoleScreenBufferInfo;
  LNumCharsWritten: DWORD;
  LCoord: TCoord;
begin
  LConsoleOutput := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(LConsoleOutput, LConsoleInfo) then
  begin
    LCoord.X := 0;
    LCoord.Y := LConsoleInfo.dwCursorPosition.Y;

    SetTextColor(aColor);
    FillConsoleOutputCharacter(LConsoleOutput, ' ', LConsoleInfo.dwSize.X,
      LCoord, LNumCharsWritten);
    SetConsoleCursorPosition(LConsoleOutput, LCoord);
  end;
end;

procedure ClearLineFromCursor(aColor: Word);
var
  LConsoleOutput: THandle;
  LConsoleInfo: TConsoleScreenBufferInfo;
  LNumCharsWritten: DWORD;
  LCoord: TCoord;
begin
  LConsoleOutput := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(LConsoleOutput, LConsoleInfo) then
  begin
    LCoord.X := 0;
    LCoord.Y := LConsoleInfo.dwCursorPosition.Y;

    SetTextColor(aColor);
    FillConsoleOutputCharacter(LConsoleOutput, ' ', LConsoleInfo.dwSize.X
      - LConsoleInfo.dwCursorPosition.X, LCoord, LNumCharsWritten);
    SetConsoleCursorPosition(LConsoleOutput, LCoord);
  end;
end;

function  GetConsoleWidth(): Integer;
var
  LConsoleInfo: TConsoleScreenBufferInfo;
begin
  // Get the console screen buffer information
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), LConsoleInfo);

  // Return the width of the console window
  Result := LConsoleInfo.dwSize.X;
end;

procedure SetConsoleTitle(const ATitle: string);
begin
  WinApi.Windows.SetConsoleTitle(PChar(ATitle));
end;

function  HasConsoleOutput(): Boolean;
var
  hStdOut: THandle;
  dwMode: DWORD;
begin
  hStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
  Result := (hStdOut <> INVALID_HANDLE_VALUE) and
            GetConsoleMode(hStdOut, dwMode);
end;

function WasRunFromConsole() : Boolean;
var
  SI: TStartupInfo;
begin
  SI.cb := SizeOf(TStartupInfo);
  GetStartupInfo(SI);
  Result := ((SI.dwFlags and STARTF_USESHOWWINDOW) = 0);
end;

function IsStartedFromDelphiIDE: Boolean;
begin
  // Check if the IDE environment variable is present
  Result := (GetEnvironmentVariable('BDS') <> '');
end;

procedure WaitForAnyKey();
var
  LInputRec: TInputRecord;
  LNumRead: Cardinal;
  LOldMode: DWORD;
  LStdIn: THandle;
begin
  LStdIn := GetStdHandle(STD_INPUT_HANDLE);
  GetConsoleMode(LStdIn, LOldMode);
  SetConsoleMode(LStdIn, 0);
  repeat
    ReadConsoleInput(LStdIn, LInputRec, 1, LNumRead);
  until (LInputRec.EventType and KEY_EVENT <> 0) and
    LInputRec.Event.KeyEvent.bKeyDown;
  SetConsoleMode(LStdIn, LOldMode);
end;

function AnyKeyPressed(): Boolean;
var
  lpNumberOfEvents     : DWORD;
  lpBuffer             : TInputRecord;
  lpNumberOfEventsRead : DWORD;
  nStdHandle           : THandle;
begin
  Result:=false;
  //get the console handle
  nStdHandle := GetStdHandle(STD_INPUT_HANDLE);
  lpNumberOfEvents:=0;
  //get the number of events
  GetNumberOfConsoleInputEvents(nStdHandle,lpNumberOfEvents);
  if lpNumberOfEvents<> 0 then
  begin
    //retrieve the event
    PeekConsoleInput(nStdHandle,lpBuffer,1,lpNumberOfEventsRead);
    if lpNumberOfEventsRead <> 0 then
    begin
      if lpBuffer.EventType = KEY_EVENT then //is a Keyboard event?
      begin
        if lpBuffer.Event.KeyEvent.bKeyDown then //the key was pressed?
          Result:=true
        else
          FlushConsoleInputBuffer(nStdHandle); //flush the buffer
      end
      else
      FlushConsoleInputBuffer(nStdHandle);//flush the buffer
    end;
  end;
end;

procedure ClearKeyStates();
begin
  FillChar(KeyState, SizeOf(KeyState), 0);
  ClearKeyboardBuffer;
end;

function IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := (GetAsyncKeyState(AKey) and $8000) <> 0;
end;

function WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := False;
  if IsKeyPressed(AKey) and (not KeyState[1, AKey]) then
  begin
    KeyState[1, AKey] := True;
    Result := True;
  end
  else if (not IsKeyPressed(AKey)) and (KeyState[1, AKey]) then
  begin
    KeyState[1, AKey] := False;
    Result := False;
  end;
end;

function WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := False;
  if IsKeyPressed(AKey) and (not KeyState[1, AKey]) then
  begin
    KeyState[1, AKey] := True;
    Result := False;
  end
  else if (not IsKeyPressed(AKey)) and (KeyState[1, AKey]) then
  begin
    KeyState[1, AKey] := False;
    Result := True;
  end;
end;

procedure Pause(aColor: DWORD=ConWhite; const aMsg: string='');
var
  LDoPause: Boolean;
begin
  if not HasConsoleOutput then Exit;

  ClearKeyboardBuffer;
  ClearKeyStates;

  LDoPause := True;
  if WasRunFromConsole then LDoPause := False;
  if IsStartedFromDelphiIDE then LDoPause := True;
  if not LDoPause then Exit;

  SetTextColor(Ord(aColor));
  WriteLn;
  if aMsg.IsEmpty then
    Write('Press any key to continue... ')
  else
    Write(aMsg);
  WaitForAnyKey;
  WriteLn;
end;

procedure ClearKeyboardBuffer();
var
  inputRecord: TInputRecord;
  eventsRead: DWORD;
begin
  // Flush the keyboard buffer by reading all pending input events
  while PeekConsoleInput(GetStdHandle(STD_INPUT_HANDLE), inputRecord, 1,
    eventsRead) and (eventsRead > 0) do
  begin
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), inputRecord, 1,
      eventsRead);
    // Optionally, you can process the input events if needed
  end;
end;

function ReadKey(): Char;
var
  InputRecord: TInputRecord;
  EventsRead: DWORD;
begin
  repeat
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), InputRecord, 1,
      EventsRead);
  until (InputRecord.EventType = KEY_EVENT) and
    InputRecord.Event.KeyEvent.bKeyDown;

  Result := InputRecord.Event.KeyEvent.UnicodeChar;
end;

function ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer): string;
var
  InputChar: Char;
begin
  Result := '';

  repeat
    InputChar := ReadKey;

    if CharInSet(InputChar, AAllowedChars) then
    begin
      if Length(Result) < AMaxLength then
      begin
        Write(InputChar);
        Result := Result + InputChar;
      end;
    end
    else if InputChar = #8 then // Backspace
    begin
      if Length(Result) > 0 then
      begin
        // erase the last character on the screen
        Write(#8 + ' ' + #8);
        // remove the last character from the result
        Delete(Result, Length(Result), 1);
      end;
    end;
  // exit the loop when Enter key is pressed or max length is reached
  until (InputChar = #13);

  // move to the next line after input is complete
  Writeln;
end;


function WrapTextEx(const aLine: string; aMaxCol: Integer; const aBreakChars: TSysCharSet): string;
var
  LText: string;
  LPos: integer;
  LChar: Char;
  LLen: Integer;
  I: Integer;
begin
  // cache line
  LText := aLine;

  // reset pos and len
  LPos := 0;
  LLen := 0;

  // loop over line
  while LPos < LText.Length do
  begin
    // inc position
    Inc(LPos);

    // get current char
    LChar := LText[LPos];

    // check for linefed
    if LChar = #10 then
    begin
      // reset length for next wrap pos
      LLen := 0;

      // continue looping
      continue;
    end;

    // inc length to next wrap pos
    Inc(LLen);

    // check if len is past wrap length
    if LLen >= aMaxCol then
    begin

      // find break char
      for I := LPos downto 1 do
      begin
        // get char
        LChar := LText[I];

        // check if a break char
        if CharInSet(LChar, aBreakChars) then
        begin
          // insert line break
          LText.Insert(I, #10);

          // exit backchar loop
          Break;
        end;
      end;

      // reset lengh for next wrap pos
      LLen := 0;
    end;
  end;

  Result := LText;
end;

procedure Print(const aMsg: string; const aArgs: array of const; const aColor: DWORD);
begin
  if not HasConsoleOutput then Exit;
  SetTextColor(Ord(aColor));
  Write(Format(aMsg, aArgs));
  SetTextColor(ConWhite);
end;

procedure Print(const aMsg: string; const aColor: DWORD);
begin
  Print(aMsg, [], aColor);
end;

procedure PrintLn(const aMsg: string; const aArgs: array of const;
  const aColor: DWORD);
begin
  if not HasConsoleOutput then Exit;
  SetTextColor(Ord(aColor));
  WriteLn(Format(aMsg, aArgs));
  SetTextColor(conWhite);
end;

procedure PrintLn(const aMsg: string; const aColor: DWORD);
begin
  PrintLn(aMsg, [], aColor);
end;

procedure PrintLn();
begin
  PrintLn('');
end;

procedure Print();
begin
  Print('');
end;

function  RandomBool(): Boolean;
begin
  Result := Boolean(RandomRange(0, 2) = 1);
end;

procedure Teletype(const aText: string; const aColor: DWORD; const aMargin: Integer; const aMinDelay: Integer; const aMaxDelay: Integer; const ABreakKey: Byte);
const
  {$J+}
  LDelay: Integer = 0;
  {$J-}
var
  LText: string;
  LMaxCol: Integer;
  LChar: Char;
begin
  LMaxCol := GetConsoleWidth - aMargin;

  LText := WrapTextEx(aText, LMaxCol);

  for LChar in LText do
  begin
    Print(LChar, [], aColor);
    if not RandomBool then
      LDelay := RandomRange(aMinDelay, aMaxDelay);
    Sleep(LDelay);
    if IsKeyPressed(ABreakKey) then
    begin
      ClearKeyboardBuffer;
      Break;
    end;
  end;
end;

function  UnitToScalarValue(const aValue, aMaxValue: Double): Double;
var
  LGain: Double;
  LFactor: Double;
  LVolume: Double;
begin
  LGain := (EnsureRange(aValue, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGain * 0.05);
  LVolume := EnsureRange(aMaxValue * LFactor, 0, aMaxValue);
  Result := LVolume;
end;

procedure FreeNilObject(const [ref] AObject: TObject);
var
  LTemp: TObject;
begin
  if not Assigned(AObject) then Exit;
  try
    CriticalSection.Enter;
    LTemp := AObject;
    TObject(Pointer(@AObject)^) := nil;
    LTemp.Free;
  finally
    CriticalSection.Leave;
  end;
end;

function ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
begin
  Result := Boolean((FindResource(HInstance, PChar(AResName), RT_RCDATA) <> 0));
end;

procedure SetDefaultIcon(AWindow: HWND);
var
  IconHandle: HICON;
begin
  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(aWindow, WM_SETICON, ICON_BIG, IconHandle);
  end;
end;


procedure EnterCriticalSection();
begin
  CriticalSection.Enter;
end;

procedure LeaveCriticalSection();
begin
  CriticalSection.Leave;
end;

function  AsUTF8(const AText: string): Pointer;
begin
  Result := Marshaller.AsUtf8(AText).ToPointer;
end;

function  GetTempStaticBuffer: PByte;
begin
  Result := @TempStaticBuffer[0];
end;

function  GetTempStaticBufferSize(): Integer;
begin
  Result := CTempStaticBufferSize;
end;


function  GetScreenWorkAreaSize(): sfVector2i;
var
  LRect: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, LRect, 0);
  Result.X := LRect.Width;
  Result.Y := LRect.Height;
end;

function SampleTimeToPosition(SampleRate: Integer; TimeInSeconds: Double; Channels: Integer; SampleSizeInBits: Integer): Int64;
begin
  Result := Round(SampleRate * TimeInSeconds * Channels * (SampleSizeInBits div 8));
end;

function FloatToSmallInt(Value: Single): SmallInt; inline;
begin
  Result := Round(EnsureRange(Value, -1.0, 1.0) * 32767);
end;

{ =========================================================================== }

{ TBuffer }
procedure TVirtualBuffer.Clear;
begin
  if (Memory <> nil) then
  begin
    if not UnmapViewOfFile(Memory) then
      raise Exception.Create('Error deallocating mapped memory');
  end;

  if (FHandle <> 0) then
  begin
    if not CloseHandle(FHandle) then
      raise Exception.Create('Error freeing memory mapping handle');
  end;
end;

constructor TVirtualBuffer.Create(aSize: Cardinal);
var
  P: Pointer;
begin
  inherited Create;
  FName := TPath.GetGUIDFileName;
  FHandle := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, aSize, PChar(FName));
  if FHandle = 0 then
    begin
      Clear;
      raise Exception.Create('Error creating memory mapping');
      FHandle := 0;
    end
  else
    begin
      P := MapViewOfFile(FHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      if P = nil then
        begin
          Clear;
          raise Exception.Create('Error creating memory mapping');
        end
      else
        begin
          Self.SetPointer(P, aSize);
          Position := 0;
        end;
    end;
end;

destructor TVirtualBuffer.Destroy;
begin
  Clear;
  inherited;
end;

function TVirtualBuffer.Write(const aBuffer; aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer, (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

function TVirtualBuffer.Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer[aOffset], (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

procedure TVirtualBuffer.SaveToFile(aFilename: string);
var
  LStream: TFileStream;
begin
  LStream := TFile.Create(aFilename);
  try
    LStream.Write(Memory^, Size);
  finally
    LStream.Free;
  end;
end;

class function TVirtualBuffer.LoadFromFile(const aFilename: string): TVirtualBuffer;
var
  LStream: TStream;
  LBuffer: TVirtualBuffer;
begin
  Result := nil;
  if aFilename.IsEmpty then Exit;
  if not TFile.Exists(aFilename) then Exit;
  LStream := TFile.OpenRead(aFilename);
  try
    LBuffer := TVirtualBuffer.Create(LStream.Size);
    if LBuffer <> nil then
    begin
      LBuffer.CopyFrom(LStream);
    end;
  finally
    FreeAndNil(LStream);
  end;
  Result := LBuffer;
end;

function  TVirtualBuffer.Eob: Boolean;
begin
  Result := Boolean(Position >= Size);
end;

function  TVirtualBuffer.ReadString: WideString;
var
  LLength: LongInt;
begin
  Read(LLength, SizeOf(LLength));
  SetLength(Result, LLength);
  if LLength > 0 then Read(Result[1], LLength * SizeOf(Char));
end;

{ TRingBuffer }
constructor TRingBuffer<T>.Create(ACapacity: Integer);
begin
  SetLength(FBuffer, ACapacity);
  FReadIndex := 0;
  FWriteIndex := 0;
  FCapacity := ACapacity;
  Clear;
end;

function TRingBuffer<T>.Write(const AData: array of T;
  ACount: Integer): Integer;
var
  i, WritePos: Integer;
begin
  EnterCriticalSection;
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      FBuffer[WritePos] := AData[i];
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    LeaveCriticalSection;
  end;
end;

function TRingBuffer<T>.Read(var AData: array of T; ACount: Integer): Integer;
var
  i, ReadPos: Integer;
begin
  for i := 0 to ACount - 1 do
  begin
    ReadPos := (FReadIndex + i) mod FCapacity;
    AData[i] := FBuffer[ReadPos];
  end;
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
  Result := ACount;
end;

function TRingBuffer<T>.DirectReadPointer(ACount: Integer): Pointer;
begin
  Result := @FBuffer[FReadIndex mod FCapacity];
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
end;

function TRingBuffer<T>.AvailableBytes: Integer;
begin
  Result := (FCapacity + FWriteIndex - FReadIndex) mod FCapacity;
end;

procedure TRingBuffer<T>.Clear;
var
  I: Integer;
begin

  EnterCriticalSection;
  try
    for I := Low(FBuffer) to High(FBuffer) do
    begin
     FBuffer[i] := Default(T);
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    LeaveCriticalSection;
  end;
end;

{ TVirtualRingBuffer }
function TVirtualRingBuffer<T>.GetArrayValue(AIndex: Integer): T;
begin
  Result := PType(PByte(FBuffer.Memory) + AIndex * SizeOf(T))^;
end;

procedure TVirtualRingBuffer<T>.SetArrayValue(AIndex: Integer; AValue: T);
begin
  PType(PByte(FBuffer.Memory) + AIndex * SizeOf(T))^ := AValue;
end;

constructor TVirtualRingBuffer<T>.Create(ACapacity: Integer);
begin
  FBuffer := TVirtualBuffer.Create(ACapacity*SizeOf(T));
  FReadIndex := 0;
  FWriteIndex := 0;
  FCapacity := ACapacity;
  Clear;
end;

destructor TVirtualRingBuffer<T>.Destroy;
begin
  FBuffer.Free;
  inherited;
end;

function TVirtualRingBuffer<T>.Write(const AData: array of T;
  ACount: Integer): Integer;
var
  i, WritePos: Integer;
begin
  EnterCriticalSection;
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      SetArrayValue(WritePos, AData[i]);
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    LeaveCriticalSection;
  end;
end;

function TVirtualRingBuffer<T>.Read(var AData: array of T; ACount: Integer): Integer;
var
  i, ReadPos: Integer;
begin
  for i := 0 to ACount - 1 do
  begin
    ReadPos := (FReadIndex + i) mod FCapacity;
    AData[i] := GetArrayValue(ReadPos);
  end;
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
  Result := ACount;
end;

function TVirtualRingBuffer<T>.DirectReadPointer(ACount: Integer): Pointer;
begin
  Result := PType(PByte(FBuffer.Memory) + (FReadIndex mod FCapacity) * SizeOf(T));
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
end;

function TVirtualRingBuffer<T>.AvailableBytes: Integer;
begin
  Result := (FCapacity + FWriteIndex - FReadIndex) mod FCapacity;
end;

procedure TVirtualRingBuffer<T>.Clear;
var
  I: Integer;
begin

  EnterCriticalSection;
  try
    for I := 0 to FCapacity-1 do
    begin
     SetArrayValue(I, Default(T));
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    LeaveCriticalSection;
  end;
end;

{ =========================================================================== }
var
  InputCodePage: Cardinal;
  OutputCodePage: Cardinal;

initialization
begin
  // save current console codepage
  InputCodePage := GetConsoleCP();
  OutputCodePage := GetConsoleOutputCP();

  // set code page to UTF8
  SetConsoleCP(CP_UTF8);
  SetConsoleOutputCP(CP_UTF8);

  // clear console key buffer
  ClearKeyStates;

  // init critical section
  CriticalSection := TCriticalSection.Create;
end;

finalization
begin
  // free critical section
  FreeAndNil(CriticalSection);

  // restore code page
  SetConsoleCP(InputCodePage);
  SetConsoleOutputCP(OutputCodePage);
end;

end.
