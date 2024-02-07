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
  + cimgui         - https://github.com/cimgui/cimgui
  + imgui-sfml     - https://github.com/SFML/imgui-sfml  
  + pl_mpeg        - https://github.com/phoboslab/pl_mpeg
  + CSFML          - https://github.com/SFML/CSFML
  + zlib           - https://github.com/madler/zlib
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

unit psfml;

{$I psfml.defines.inc}
    
interface

const
  {$IF Defined(WIN64)}
  PSFML_DLL = 'psfml.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

const
  CIMGUI_DEFINE_ENUMS_AND_STRUCTS = 1;
  CSFML_VERSION_MAJOR = 2;
  CSFML_VERSION_MINOR = 6;
  CSFML_VERSION_PATCH = 0;
  sfFalse = 0;
  sfTrue  = 1;
  PLM_PACKET_INVALID_TS = -1;
  PLM_AUDIO_SAMPLES_PER_FRAME = 1152;
  PLM_BUFFER_DEFAULT_SIZE = (128*1024);
  Z_ERRNO = -1;
  Z_OK = 0;
  Z_DEFLATED = 8;
  Z_DEFAULT_STRATEGY = 0;
  ZIP_OK = (0);
  ZIP_EOF = (0);
  ZIP_ERRNO = (Z_ERRNO);
  ZIP_PARAMERROR = (-102);
  ZIP_BADZIPFILE = (-103);
  ZIP_INTERNALERROR = (-104);
  UNZ_OK = (0);
  UNZ_END_OF_LIST_OF_FILE = (-100);
  UNZ_ERRNO = (Z_ERRNO);
  UNZ_EOF = (0);
  UNZ_PARAMERROR = (-102);
  UNZ_BADZIPFILE = (-103);
  UNZ_INTERNALERROR = (-104);
  UNZ_CRCERROR = (-105);
  APPEND_STATUS_CREATE = (0);
  APPEND_STATUS_CREATEAFTER = (1);
  APPEND_STATUS_ADDINZIP = (2);
  IMGUI_HAS_DOCK = 1;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PPByte = ^PByte;
  PUInt8 = ^UInt8;
  PWideChar = ^WideChar;
  PPointer = ^Pointer;
  PNativeUInt = ^NativeUInt;
  PHWND__ = Pointer;
  PPHWND__ = ^PHWND__;
  PVkInstance_T = Pointer;
  PPVkInstance_T = ^PVkInstance_T;
  PVkSurfaceKHR_T = Pointer;
  PPVkSurfaceKHR_T = ^PVkSurfaceKHR_T;
  PsfTime = ^sfTime;
  PsfInputStream = ^sfInputStream;
  PsfVector2i = ^sfVector2i;
  PsfVector2u = ^sfVector2u;
  PsfVector2f = ^sfVector2f;
  PsfVector3f = ^sfVector3f;
  PsfTimeSpan = ^sfTimeSpan;
  PsfSoundStreamChunk = ^sfSoundStreamChunk;
  PsfJoystickIdentification = ^sfJoystickIdentification;
  PsfKeyEvent = ^sfKeyEvent;
  PsfTextEvent = ^sfTextEvent;
  PsfMouseMoveEvent = ^sfMouseMoveEvent;
  PsfMouseButtonEvent = ^sfMouseButtonEvent;
  PsfMouseWheelEvent = ^sfMouseWheelEvent;
  PsfMouseWheelScrollEvent = ^sfMouseWheelScrollEvent;
  PsfJoystickMoveEvent = ^sfJoystickMoveEvent;
  PsfJoystickButtonEvent = ^sfJoystickButtonEvent;
  PsfJoystickConnectEvent = ^sfJoystickConnectEvent;
  PsfSizeEvent = ^sfSizeEvent;
  PsfTouchEvent = ^sfTouchEvent;
  PsfSensorEvent = ^sfSensorEvent;
  PsfVideoMode = ^sfVideoMode;
  PsfContextSettings = ^sfContextSettings;
  PsfBlendMode = ^sfBlendMode;
  PsfColor = ^sfColor;
  PsfFloatRect = ^sfFloatRect;
  PsfIntRect = ^sfIntRect;
  PsfTransform = ^sfTransform;
  PsfFontInfo = ^sfFontInfo;
  PsfGlyph = ^sfGlyph;
  PsfRenderStates = ^sfRenderStates;
  PsfVertex = ^sfVertex;
  PsfGlslBvec2 = ^sfGlslBvec2;
  PsfGlslIvec3 = ^sfGlslIvec3;
  PsfGlslBvec3 = ^sfGlslBvec3;
  PsfGlslVec4 = ^sfGlslVec4;
  PsfGlslIvec4 = ^sfGlslIvec4;
  PsfGlslBvec4 = ^sfGlslBvec4;
  PsfGlslMat3 = ^sfGlslMat3;
  PsfGlslMat4 = ^sfGlslMat4;
  PsfIpAddress = ^sfIpAddress;
  P_sfEvent = ^_sfEvent;
  Pplm_packet_t = ^plm_packet_t;
  Pplm_plane_t = ^plm_plane_t;
  Pplm_frame_t = ^plm_frame_t;
  Pplm_samples_t = ^plm_samples_t;
  Ptm_zip_s = ^tm_zip_s;
  Pzip_fileinfo = ^zip_fileinfo;
  Ptm_unz_s = ^tm_unz_s;
  Punz_file_info64_s = ^unz_file_info64_s;
  PImVector_const_charPtr = ^ImVector_const_charPtr;
  PImVec2 = ^ImVec2;
  PImVec4 = ^ImVec4;
  PImGuiTableSortSpecs = ^ImGuiTableSortSpecs;
  PImGuiTableColumnSortSpecs = ^ImGuiTableColumnSortSpecs;
  PImGuiStyle = ^ImGuiStyle;
  PImGuiKeyData = ^ImGuiKeyData;
  PImVector_ImWchar = ^ImVector_ImWchar;
  PImGuiIO = ^ImGuiIO;
  PImGuiInputTextCallbackData = ^ImGuiInputTextCallbackData;
  PImGuiSizeCallbackData = ^ImGuiSizeCallbackData;
  PImGuiWindowClass = ^ImGuiWindowClass;
  PImGuiPayload = ^ImGuiPayload;
  PImGuiOnceUponAFrame = ^ImGuiOnceUponAFrame;
  PImGuiTextRange = ^ImGuiTextRange;
  PImVector_ImGuiTextRange = ^ImVector_ImGuiTextRange;
  PImGuiTextFilter = ^ImGuiTextFilter;
  PImVector_char = ^ImVector_char;
  PImGuiTextBuffer = ^ImGuiTextBuffer;
  PImGuiStoragePair = ^ImGuiStoragePair;
  PImVector_ImGuiStoragePair = ^ImVector_ImGuiStoragePair;
  PImGuiStorage = ^ImGuiStorage;
  PImGuiListClipper = ^ImGuiListClipper;
  PImColor = ^ImColor;
  PImDrawCmd = ^ImDrawCmd;
  PImDrawVert = ^ImDrawVert;
  PImDrawCmdHeader = ^ImDrawCmdHeader;
  PImVector_ImDrawCmd = ^ImVector_ImDrawCmd;
  PImVector_ImDrawIdx = ^ImVector_ImDrawIdx;
  PImDrawChannel = ^ImDrawChannel;
  PImVector_ImDrawChannel = ^ImVector_ImDrawChannel;
  PImDrawListSplitter = ^ImDrawListSplitter;
  PImVector_ImDrawVert = ^ImVector_ImDrawVert;
  PImVector_ImVec4 = ^ImVector_ImVec4;
  PImVector_ImTextureID = ^ImVector_ImTextureID;
  PImVector_ImVec2 = ^ImVector_ImVec2;
  PImDrawList = ^ImDrawList;
  PPImDrawList = ^PImDrawList;
  PImVector_ImDrawListPtr = ^ImVector_ImDrawListPtr;
  PImDrawData = ^ImDrawData;
  PImFontConfig = ^ImFontConfig;
  PImFontGlyph = ^ImFontGlyph;
  PImVector_ImU32 = ^ImVector_ImU32;
  PImFontGlyphRangesBuilder = ^ImFontGlyphRangesBuilder;
  PImFontAtlasCustomRect = ^ImFontAtlasCustomRect;
  PImVector_ImFontPtr = ^ImVector_ImFontPtr;
  PImVector_ImFontAtlasCustomRect = ^ImVector_ImFontAtlasCustomRect;
  PImVector_ImFontConfig = ^ImVector_ImFontConfig;
  PImFontAtlas = ^ImFontAtlas;
  PImVector_float = ^ImVector_float;
  PImVector_ImFontGlyph = ^ImVector_ImFontGlyph;
  PImFont = ^ImFont;
  PPImFont = ^PImFont;
  PImGuiViewport = ^ImGuiViewport;
  PPImGuiViewport = ^PImGuiViewport;
  PImVector_ImGuiPlatformMonitor = ^ImVector_ImGuiPlatformMonitor;
  PImVector_ImGuiViewportPtr = ^ImVector_ImGuiViewportPtr;
  PImGuiPlatformIO = ^ImGuiPlatformIO;
  PImGuiPlatformMonitor = ^ImGuiPlatformMonitor;
  PImGuiPlatformImeData = ^ImGuiPlatformImeData;
  PStbUndoRecord = ^StbUndoRecord;
  PStbUndoState = ^StbUndoState;
  PSTB_TexteditState = ^STB_TexteditState;
  PStbTexteditRow = ^StbTexteditRow;
  PImVec1 = ^ImVec1;
  PImVec2ih = ^ImVec2ih;
  PImRect = ^ImRect;
  PImBitVector = ^ImBitVector;
  PImVector_int = ^ImVector_int;
  PImGuiTextIndex = ^ImGuiTextIndex;
  PImDrawListSharedData = ^ImDrawListSharedData;
  PImDrawDataBuilder = ^ImDrawDataBuilder;
  PImGuiDataVarInfo = ^ImGuiDataVarInfo;
  PImGuiDataTypeTempStorage = ^ImGuiDataTypeTempStorage;
  PImGuiDataTypeInfo = ^ImGuiDataTypeInfo;
  PImGuiColorMod = ^ImGuiColorMod;
  PImGuiStyleMod = ^ImGuiStyleMod;
  PImGuiComboPreviewData = ^ImGuiComboPreviewData;
  PImGuiGroupData = ^ImGuiGroupData;
  PImGuiMenuColumns = ^ImGuiMenuColumns;
  PImGuiInputTextDeactivatedState = ^ImGuiInputTextDeactivatedState;
  PImGuiInputTextState = ^ImGuiInputTextState;
  PImGuiPopupData = ^ImGuiPopupData;
  PImGuiNextWindowData = ^ImGuiNextWindowData;
  PImGuiNextItemData = ^ImGuiNextItemData;
  PImGuiLastItemData = ^ImGuiLastItemData;
  PImGuiNavTreeNodeData = ^ImGuiNavTreeNodeData;
  PImGuiStackSizes = ^ImGuiStackSizes;
  PImGuiWindowStackData = ^ImGuiWindowStackData;
  PImGuiShrinkWidthItem = ^ImGuiShrinkWidthItem;
  PImGuiPtrOrIndex = ^ImGuiPtrOrIndex;
  PImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN = ^ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;
  PImGuiInputEventMousePos = ^ImGuiInputEventMousePos;
  PImGuiInputEventMouseWheel = ^ImGuiInputEventMouseWheel;
  PImGuiInputEventMouseButton = ^ImGuiInputEventMouseButton;
  PImGuiInputEventMouseViewport = ^ImGuiInputEventMouseViewport;
  PImGuiInputEventKey = ^ImGuiInputEventKey;
  PImGuiInputEventText = ^ImGuiInputEventText;
  PImGuiInputEventAppFocused = ^ImGuiInputEventAppFocused;
  PImGuiInputEvent = ^ImGuiInputEvent;
  PImGuiKeyRoutingData = ^ImGuiKeyRoutingData;
  PImVector_ImGuiKeyRoutingData = ^ImVector_ImGuiKeyRoutingData;
  PImGuiKeyRoutingTable = ^ImGuiKeyRoutingTable;
  PImGuiKeyOwnerData = ^ImGuiKeyOwnerData;
  PImGuiListClipperRange = ^ImGuiListClipperRange;
  PImVector_ImGuiListClipperRange = ^ImVector_ImGuiListClipperRange;
  PImGuiListClipperData = ^ImGuiListClipperData;
  PImGuiNavItemData = ^ImGuiNavItemData;
  PImGuiTypingSelectRequest = ^ImGuiTypingSelectRequest;
  PImGuiTypingSelectState = ^ImGuiTypingSelectState;
  PImGuiOldColumnData = ^ImGuiOldColumnData;
  PImVector_ImGuiOldColumnData = ^ImVector_ImGuiOldColumnData;
  PImGuiOldColumns = ^ImGuiOldColumns;
  PImVector_ImGuiWindowPtr = ^ImVector_ImGuiWindowPtr;
  PImGuiDockNode = ^ImGuiDockNode;
  PImGuiWindowDockStyle = ^ImGuiWindowDockStyle;
  PImVector_ImGuiDockRequest = ^ImVector_ImGuiDockRequest;
  PImVector_ImGuiDockNodeSettings = ^ImVector_ImGuiDockNodeSettings;
  PImGuiDockContext = ^ImGuiDockContext;
  PImGuiViewportP = ^ImGuiViewportP;
  PPImGuiViewportP = ^PImGuiViewportP;
  PImGuiWindowSettings = ^ImGuiWindowSettings;
  PImGuiSettingsHandler = ^ImGuiSettingsHandler;
  PImGuiLocEntry = ^ImGuiLocEntry;
  PImGuiDebugAllocEntry = ^ImGuiDebugAllocEntry;
  PImGuiDebugAllocInfo = ^ImGuiDebugAllocInfo;
  PImGuiMetricsConfig = ^ImGuiMetricsConfig;
  PImGuiStackLevelInfo = ^ImGuiStackLevelInfo;
  PImVector_ImGuiStackLevelInfo = ^ImVector_ImGuiStackLevelInfo;
  PImGuiIDStackTool = ^ImGuiIDStackTool;
  PImGuiContextHook = ^ImGuiContextHook;
  PImVector_ImGuiInputEvent = ^ImVector_ImGuiInputEvent;
  PImVector_ImGuiWindowStackData = ^ImVector_ImGuiWindowStackData;
  PImVector_ImGuiColorMod = ^ImVector_ImGuiColorMod;
  PImVector_ImGuiStyleMod = ^ImVector_ImGuiStyleMod;
  PImVector_ImGuiID = ^ImVector_ImGuiID;
  PImVector_ImGuiItemFlags = ^ImVector_ImGuiItemFlags;
  PImVector_ImGuiGroupData = ^ImVector_ImGuiGroupData;
  PImVector_ImGuiPopupData = ^ImVector_ImGuiPopupData;
  PImVector_ImGuiNavTreeNodeData = ^ImVector_ImGuiNavTreeNodeData;
  PImVector_ImGuiViewportPPtr = ^ImVector_ImGuiViewportPPtr;
  PImVector_unsigned_char = ^ImVector_unsigned_char;
  PImVector_ImGuiListClipperData = ^ImVector_ImGuiListClipperData;
  PImVector_ImGuiTableTempData = ^ImVector_ImGuiTableTempData;
  PImVector_ImGuiTable = ^ImVector_ImGuiTable;
  PImPool_ImGuiTable = ^ImPool_ImGuiTable;
  PImVector_ImGuiTabBar = ^ImVector_ImGuiTabBar;
  PImPool_ImGuiTabBar = ^ImPool_ImGuiTabBar;
  PImVector_ImGuiPtrOrIndex = ^ImVector_ImGuiPtrOrIndex;
  PImVector_ImGuiShrinkWidthItem = ^ImVector_ImGuiShrinkWidthItem;
  PImVector_ImGuiSettingsHandler = ^ImVector_ImGuiSettingsHandler;
  PImChunkStream_ImGuiWindowSettings = ^ImChunkStream_ImGuiWindowSettings;
  PImChunkStream_ImGuiTableSettings = ^ImChunkStream_ImGuiTableSettings;
  PImVector_ImGuiContextHook = ^ImVector_ImGuiContextHook;
  PImGuiContext = ^ImGuiContext;
  PImGuiWindowTempData = ^ImGuiWindowTempData;
  PImVector_ImGuiOldColumns = ^ImVector_ImGuiOldColumns;
  PImGuiWindow = ^ImGuiWindow;
  PPImGuiWindow = ^PImGuiWindow;
  PImGuiTabItem = ^ImGuiTabItem;
  PImVector_ImGuiTabItem = ^ImVector_ImGuiTabItem;
  PImGuiTabBar = ^ImGuiTabBar;
  PImGuiTableColumn = ^ImGuiTableColumn;
  PImGuiTableCellData = ^ImGuiTableCellData;
  PImGuiTableInstanceData = ^ImGuiTableInstanceData;
  PImSpan_ImGuiTableColumn = ^ImSpan_ImGuiTableColumn;
  PImSpan_ImGuiTableColumnIdx = ^ImSpan_ImGuiTableColumnIdx;
  PImSpan_ImGuiTableCellData = ^ImSpan_ImGuiTableCellData;
  PImVector_ImGuiTableInstanceData = ^ImVector_ImGuiTableInstanceData;
  PImVector_ImGuiTableColumnSortSpecs = ^ImVector_ImGuiTableColumnSortSpecs;
  PImGuiTable = ^ImGuiTable;
  PImGuiTableTempData = ^ImGuiTableTempData;
  PImGuiTableColumnSettings = ^ImGuiTableColumnSettings;
  PImGuiTableSettings = ^ImGuiTableSettings;
  PImFontBuilderIO = ^ImFontBuilderIO;

  ////////////////////////////////////////////////////////////
  sfBool = Integer;
  ////////////////////////////////////////////////////////////
  sfInt8 = UTF8Char;
  sfUint8 = Byte;
  PsfUint8 = ^sfUint8;
  sfInt16 = Smallint;
  PsfInt16 = ^sfInt16;
  sfUint16 = Word;
  sfInt32 = Integer;
  sfUint32 = Cardinal;
  PsfUint32 = ^sfUint32;
  sfInt64 = Int64;
  sfUint64 = UInt64;
  PsfBuffer = Pointer;
  PPsfBuffer = ^PsfBuffer;
  PsfClock = Pointer;
  PPsfClock = ^PsfClock;
  PsfMutex = Pointer;
  PPsfMutex = ^PsfMutex;
  PsfThread = Pointer;
  PPsfThread = ^PsfThread;

  ////////////////////////////////////////////////////////////
  /// \brief Represents a time value
  ///
  ////////////////////////////////////////////////////////////
  sfTime = record
    microseconds: sfInt64;
  end;

  sfInputStreamReadFunc = function(data: Pointer; size: sfInt64; userData: Pointer): sfInt64; cdecl;

  sfInputStreamSeekFunc = function(position: sfInt64; userData: Pointer): sfInt64; cdecl;

  sfInputStreamTellFunc = function(userData: Pointer): sfInt64; cdecl;

  sfInputStreamGetSizeFunc = function(userData: Pointer): sfInt64; cdecl;

  ////////////////////////////////////////////////////////////
  /// \brief Set of callbacks that allow users to define custom file streams
  ///
  ////////////////////////////////////////////////////////////
  sfInputStream = record
    /// Function to read data from the stream
    read: sfInputStreamReadFunc;
    /// Function to set the current read position
    seek: sfInputStreamSeekFunc;
    /// Function to get the current read position
    tell: sfInputStreamTellFunc;
    /// Function to get the total number of bytes in the stream
    getSize: sfInputStreamGetSizeFunc;
    /// User data that will be passed to the callbacks
    userData: Pointer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief 2-component vector of integers
  ///
  ////////////////////////////////////////////////////////////
  sfVector2i = record
    x: Integer;
    y: Integer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief 2-component vector of unsigned integers
  ///
  ////////////////////////////////////////////////////////////
  sfVector2u = record
    x: Cardinal;
    y: Cardinal;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief 2-component vector of floats
  ///
  ////////////////////////////////////////////////////////////
  sfVector2f = record
    x: Single;
    y: Single;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief 3-component vector of floats
  ///
  ////////////////////////////////////////////////////////////
  sfVector3f = record
    x: Single;
    y: Single;
    z: Single;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of statuses for sounds and musics
  ///
  ////////////////////////////////////////////////////////////
  sfSoundStatus = (
    /// Sound / music is not playing
    sfStopped = 0,
    /// Sound / music is paused
    sfPaused = 1,
    /// Sound / music is playing
    sfPlaying = 2);
  PsfSoundStatus = ^sfSoundStatus;
  PsfMusic = Pointer;
  PPsfMusic = ^PsfMusic;
  PsfSound = Pointer;
  PPsfSound = ^PsfSound;
  PsfSoundBuffer = Pointer;
  PPsfSoundBuffer = ^PsfSoundBuffer;
  PsfSoundBufferRecorder = Pointer;
  PPsfSoundBufferRecorder = ^PsfSoundBufferRecorder;
  PsfSoundRecorder = Pointer;
  PPsfSoundRecorder = ^PsfSoundRecorder;
  PsfSoundStream = Pointer;
  PPsfSoundStream = ^PsfSoundStream;

  ////////////////////////////////////////////////////////////
  /// \brief Structure defining a time range
  ///
  ////////////////////////////////////////////////////////////
  sfTimeSpan = record
    /// The beginning offset of the time range
    offset: sfTime;
    /// The length of the time range
    length: sfTime;
  end;

  sfSoundRecorderStartCallback = function(p1: Pointer): sfBool; cdecl;

  sfSoundRecorderProcessCallback = function(const p1: PsfInt16; p2: NativeUInt; p3: Pointer): sfBool; cdecl;

  sfSoundRecorderStopCallback = procedure(p1: Pointer); cdecl;

  ////////////////////////////////////////////////////////////
  /// \brief defines the data to fill by the OnGetData callback
  ///
  ////////////////////////////////////////////////////////////
  sfSoundStreamChunk = record
    /// Pointer to the audio samples
    samples: PsfInt16;
    /// Number of samples pointed by Samples
    sampleCount: Cardinal;
  end;

  sfSoundStreamGetDataCallback = function(p1: PsfSoundStreamChunk; p2: Pointer): sfBool; cdecl;

  sfSoundStreamSeekCallback = procedure(p1: sfTime; p2: Pointer); cdecl;
  PsfContext = Pointer;
  PPsfContext = ^PsfContext;
  PsfCursor = Pointer;
  PPsfCursor = ^PsfCursor;
  PsfWindow = Pointer;
  PPsfWindow = ^PsfWindow;
  PsfWindowBase = Pointer;
  PPsfWindowBase = ^PsfWindowBase;

  ////////////////////////////////////////////////////////////
  /// sfJoystickIdentification holds a joystick's identification
  ////////////////////////////////////////////////////////////
  sfJoystickIdentification = record
    name: PUTF8Char;
    vendorId: Cardinal;
    productId: Cardinal;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Global joysticks capabilities
  ///
  ////////////////////////////////////////////////////////////
  _anonymous_type_1 = (
    /// Maximum number of supported joysticks
    sfJoystickCount = 8,
    /// Maximum number of supported buttons
    sfJoystickButtonCount = 32,
    /// Maximum number of supported axes
    sfJoystickAxisCount = 8);
  P_anonymous_type_1 = ^_anonymous_type_1;

  ////////////////////////////////////////////////////////////
  /// \brief Axes supported by SFML joysticks
  ///
  ////////////////////////////////////////////////////////////
  sfJoystickAxis = (
    /// The X axis
    sfJoystickX = 0,
    /// The Y axis
    sfJoystickY = 1,
    /// The Z axis
    sfJoystickZ = 2,
    /// The R axis
    sfJoystickR = 3,
    /// The U axis
    sfJoystickU = 4,
    /// The V axis
    sfJoystickV = 5,
    /// The X axis of the point-of-view hat
    sfJoystickPovX = 6,
    /// The Y axis of the point-of-view hat
    sfJoystickPovY = 7);
  PsfJoystickAxis = ^sfJoystickAxis;

  ////////////////////////////////////////////////////////////
  /// \brief Key codes
  ///
  /// The enumerators refer to the "localized" key; i.e. depending
  /// on the layout set by the operating system, a key can be mapped
  /// to `Y` or `Z`.
  ///
  ////////////////////////////////////////////////////////////
  sfKeyCode = (
    /// Unhandled key
    sfKeyUnknown = -1,
    /// The A key
    sfKeyA = 0,
    /// The B key
    sfKeyB = 1,
    /// The C key
    sfKeyC = 2,
    /// The D key
    sfKeyD = 3,
    /// The E key
    sfKeyE = 4,
    /// The F key
    sfKeyF = 5,
    /// The G key
    sfKeyG = 6,
    /// The H key
    sfKeyH = 7,
    /// The I key
    sfKeyI = 8,
    /// The J key
    sfKeyJ = 9,
    /// The K key
    sfKeyK = 10,
    /// The L key
    sfKeyL = 11,
    /// The M key
    sfKeyM = 12,
    /// The N key
    sfKeyN = 13,
    /// The O key
    sfKeyO = 14,
    /// The P key
    sfKeyP = 15,
    /// The Q key
    sfKeyQ = 16,
    /// The R key
    sfKeyR = 17,
    /// The S key
    sfKeyS = 18,
    /// The T key
    sfKeyT = 19,
    /// The U key
    sfKeyU = 20,
    /// The V key
    sfKeyV = 21,
    /// The W key
    sfKeyW = 22,
    /// The X key
    sfKeyX = 23,
    /// The Y key
    sfKeyY = 24,
    /// The Z key
    sfKeyZ = 25,
    /// The 0 key
    sfKeyNum0 = 26,
    /// The 1 key
    sfKeyNum1 = 27,
    /// The 2 key
    sfKeyNum2 = 28,
    /// The 3 key
    sfKeyNum3 = 29,
    /// The 4 key
    sfKeyNum4 = 30,
    /// The 5 key
    sfKeyNum5 = 31,
    /// The 6 key
    sfKeyNum6 = 32,
    /// The 7 key
    sfKeyNum7 = 33,
    /// The 8 key
    sfKeyNum8 = 34,
    /// The 9 key
    sfKeyNum9 = 35,
    /// The Escape key
    sfKeyEscape = 36,
    /// The left Control key
    sfKeyLControl = 37,
    /// The left Shift key
    sfKeyLShift = 38,
    /// The left Alt key
    sfKeyLAlt = 39,
    /// The left OS specific key: window (Windows and Linux), apple (macOS), ...
    sfKeyLSystem = 40,
    /// The right Control key
    sfKeyRControl = 41,
    /// The right Shift key
    sfKeyRShift = 42,
    /// The right Alt key
    sfKeyRAlt = 43,
    /// The right OS specific key: window (Windows and Linux), apple (macOS), ...
    sfKeyRSystem = 44,
    /// The Menu key
    sfKeyMenu = 45,
    /// The [ key
    sfKeyLBracket = 46,
    /// The ] key
    sfKeyRBracket = 47,
    /// The ; key
    sfKeySemicolon = 48,
    /// The , key
    sfKeyComma = 49,
    /// The . key
    sfKeyPeriod = 50,
    /// The ' key
    sfKeyApostrophe = 51,
    /// The / key
    sfKeySlash = 52,
    /// The \ key
    sfKeyBackslash = 53,
    /// The ` key
    sfKeyGrave = 54,
    /// The = key
    sfKeyEqual = 55,
    /// The - key (hyphen)
    sfKeyHyphen = 56,
    /// The Space key
    sfKeySpace = 57,
    /// The Enter/Return key
    sfKeyEnter = 58,
    /// The Backspace key
    sfKeyBackspace = 59,
    /// The Tabulation key
    sfKeyTab = 60,
    /// The Page up key
    sfKeyPageUp = 61,
    /// The Page down key
    sfKeyPageDown = 62,
    /// The End key
    sfKeyEnd = 63,
    /// The Home key
    sfKeyHome = 64,
    /// The Insert key
    sfKeyInsert = 65,
    /// The Delete key
    sfKeyDelete = 66,
    /// The + key
    sfKeyAdd = 67,
    /// The - key (minus, usually from numpad)
    sfKeySubtract = 68,
    /// The * key
    sfKeyMultiply = 69,
    /// The / key
    sfKeyDivide = 70,
    /// Left arrow
    sfKeyLeft = 71,
    /// Right arrow
    sfKeyRight = 72,
    /// Up arrow
    sfKeyUp = 73,
    /// Down arrow
    sfKeyDown = 74,
    /// The numpad 0 key
    sfKeyNumpad0 = 75,
    /// The numpad 1 key
    sfKeyNumpad1 = 76,
    /// The numpad 2 key
    sfKeyNumpad2 = 77,
    /// The numpad 3 key
    sfKeyNumpad3 = 78,
    /// The numpad 4 key
    sfKeyNumpad4 = 79,
    /// The numpad 5 key
    sfKeyNumpad5 = 80,
    /// The numpad 6 key
    sfKeyNumpad6 = 81,
    /// The numpad 7 key
    sfKeyNumpad7 = 82,
    /// The numpad 8 key
    sfKeyNumpad8 = 83,
    /// The numpad 9 key
    sfKeyNumpad9 = 84,
    /// The F1 key
    sfKeyF1 = 85,
    /// The F2 key
    sfKeyF2 = 86,
    /// The F3 key
    sfKeyF3 = 87,
    /// The F4 key
    sfKeyF4 = 88,
    /// The F5 key
    sfKeyF5 = 89,
    /// The F6 key
    sfKeyF6 = 90,
    /// The F7 key
    sfKeyF7 = 91,
    /// The F8 key
    sfKeyF8 = 92,
    /// The F8 key
    sfKeyF9 = 93,
    /// The F10 key
    sfKeyF10 = 94,
    /// The F11 key
    sfKeyF11 = 95,
    /// The F12 key
    sfKeyF12 = 96,
    /// The F13 key
    sfKeyF13 = 97,
    /// The F14 key
    sfKeyF14 = 98,
    /// The F15 key
    sfKeyF15 = 99,
    /// The Pause key
    sfKeyPause = 100,
    /// Keep last -- the total number of keyboard keys
    sfKeyCount = 101,
    /// \deprecated Use Grave instead
    sfKeyTilde = 54,
    /// \deprecated Use Hyphen instead
    sfKeyDash = 56,
    /// \deprecated Use Backspace instead
    sfKeyBack = 59,
    /// \deprecated Use Enter instead
    sfKeyReturn = 58,
    /// \deprecated Use Apostrophe instead
    sfKeyQuote = 51);
  PsfKeyCode = ^sfKeyCode;

  ////////////////////////////////////////////////////////////
  /// \brief Scancodes
  ///
  /// The enumerators are bound to a physical key and do not depend on
  /// the keyboard layout used by the operating system. Usually, the AT-101
  /// keyboard can be used as reference for the physical position of the keys.
  ///
  ////////////////////////////////////////////////////////////
  sfScancode = (
    //! Represents any scancode not present in this enum
    sfScanUnknown = -1,
    //! Keyboard a and A key
    sfScanA = 0,
    //! Keyboard b and B key
    sfScanB = 1,
    //! Keyboard c and C key
    sfScanC = 2,
    //! Keyboard d and D key
    sfScanD = 3,
    //! Keyboard e and E key
    sfScanE = 4,
    //! Keyboard f and F key
    sfScanF = 5,
    //! Keyboard g and G key
    sfScanG = 6,
    //! Keyboard h and H key
    sfScanH = 7,
    //! Keyboard i and I key
    sfScanI = 8,
    //! Keyboard j and J key
    sfScanJ = 9,
    //! Keyboard k and K key
    sfScanK = 10,
    //! Keyboard l and L key
    sfScanL = 11,
    //! Keyboard m and M key
    sfScanM = 12,
    //! Keyboard n and N key
    sfScanN = 13,
    //! Keyboard o and O key
    sfScanO = 14,
    //! Keyboard p and P key
    sfScanP = 15,
    //! Keyboard q and Q key
    sfScanQ = 16,
    //! Keyboard r and R key
    sfScanR = 17,
    //! Keyboard s and S key
    sfScanS = 18,
    //! Keyboard t and T key
    sfScanT = 19,
    //! Keyboard u and U key
    sfScanU = 20,
    //! Keyboard v and V key
    sfScanV = 21,
    //! Keyboard w and W key
    sfScanW = 22,
    //! Keyboard x and X key
    sfScanX = 23,
    //! Keyboard y and Y key
    sfScanY = 24,
    //! Keyboard z and Z key
    sfScanZ = 25,
    //! Keyboard 1 and ! key
    sfScanNum1 = 26,
    //! Keyboard 2 and @ key
    sfScanNum2 = 27,
    //! Keyboard 3 and # key
    sfScanNum3 = 28,
    //! Keyboard 4 and $ key
    sfScanNum4 = 29,
    //! Keyboard 5 and % key
    sfScanNum5 = 30,
    //! Keyboard 6 and ^ key
    sfScanNum6 = 31,
    //! Keyboard 7 and & key
    sfScanNum7 = 32,
    //! Keyboard 8 and * key
    sfScanNum8 = 33,
    //! Keyboard 9 and ) key
    sfScanNum9 = 34,
    //! Keyboard 0 and ) key
    sfScanNum0 = 35,
    //! Keyboard Enter/Return key
    sfScanEnter = 36,
    //! Keyboard Escape key
    sfScanEscape = 37,
    //! Keyboard Backspace key
    sfScanBackspace = 38,
    //! Keyboard Tab key
    sfScanTab = 39,
    //! Keyboard Space key
    sfScanSpace = 40,
    //! Keyboard - and _ key
    sfScanHyphen = 41,
    //! Keyboard = and +
    sfScanEqual = 42,
    //! Keyboard [ and { key
    sfScanLBracket = 43,
    //! Keyboard ] and } key
    sfScanRBracket = 44,
    //! Keyboard \ and | key OR various keys for Non-US keyboards
    sfScanBackslash = 45,
    //! Keyboard ; and : key
    sfScanSemicolon = 46,
    //! Keyboard ' and " key
    sfScanApostrophe = 47,
    //! Keyboard ` and ~ key
    sfScanGrave = 48,
    //! Keyboard , and < key
    sfScanComma = 49,
    //! Keyboard . and > key
    sfScanPeriod = 50,
    //! Keyboard / and ? key
    sfScanSlash = 51,
    //! Keyboard F1 key
    sfScanF1 = 52,
    //! Keyboard F2 key
    sfScanF2 = 53,
    //! Keyboard F3 key
    sfScanF3 = 54,
    //! Keyboard F4 key
    sfScanF4 = 55,
    //! Keyboard F5 key
    sfScanF5 = 56,
    //! Keyboard F6 key
    sfScanF6 = 57,
    //! Keyboard F7 key
    sfScanF7 = 58,
    //! Keyboard F8 key
    sfScanF8 = 59,
    //! Keyboard F9 key
    sfScanF9 = 60,
    //! Keyboard F10 key
    sfScanF10 = 61,
    //! Keyboard F11 key
    sfScanF11 = 62,
    //! Keyboard F12 key
    sfScanF12 = 63,
    //! Keyboard F13 key
    sfScanF13 = 64,
    //! Keyboard F14 key
    sfScanF14 = 65,
    //! Keyboard F15 key
    sfScanF15 = 66,
    //! Keyboard F16 key
    sfScanF16 = 67,
    //! Keyboard F17 key
    sfScanF17 = 68,
    //! Keyboard F18 key
    sfScanF18 = 69,
    //! Keyboard F19 key
    sfScanF19 = 70,
    //! Keyboard F20 key
    sfScanF20 = 71,
    //! Keyboard F21 key
    sfScanF21 = 72,
    //! Keyboard F22 key
    sfScanF22 = 73,
    //! Keyboard F23 key
    sfScanF23 = 74,
    //! Keyboard F24 key
    sfScanF24 = 75,
    //! Keyboard Caps %Lock key
    sfScanCapsLock = 76,
    //! Keyboard Print Screen key
    sfScanPrintScreen = 77,
    //! Keyboard Scroll %Lock key
    sfScanScrollLock = 78,
    //! Keyboard Pause key
    sfScanPause = 79,
    //! Keyboard Insert key
    sfScanInsert = 80,
    //! Keyboard Home key
    sfScanHome = 81,
    //! Keyboard Page Up key
    sfScanPageUp = 82,
    //! Keyboard Delete Forward key
    sfScanDelete = 83,
    //! Keyboard End key
    sfScanEnd = 84,
    //! Keyboard Page Down key
    sfScanPageDown = 85,
    //! Keyboard Right Arrow key
    sfScanRight = 86,
    //! Keyboard Left Arrow key
    sfScanLeft = 87,
    //! Keyboard Down Arrow key
    sfScanDown = 88,
    //! Keyboard Up Arrow key
    sfScanUp = 89,
    //! Keypad Num %Lock and Clear key
    sfScanNumLock = 90,
    //! Keypad / key
    sfScanNumpadDivide = 91,
    //! Keypad * key
    sfScanNumpadMultiply = 92,
    //! Keypad - key
    sfScanNumpadMinus = 93,
    //! Keypad + key
    sfScanNumpadPlus = 94,
    //! keypad = key
    sfScanNumpadEqual = 95,
    //! Keypad Enter/Return key
    sfScanNumpadEnter = 96,
    //! Keypad . and Delete key
    sfScanNumpadDecimal = 97,
    //! Keypad 1 and End key
    sfScanNumpad1 = 98,
    //! Keypad 2 and Down Arrow key
    sfScanNumpad2 = 99,
    //! Keypad 3 and Page Down key
    sfScanNumpad3 = 100,
    //! Keypad 4 and Left Arrow key
    sfScanNumpad4 = 101,
    //! Keypad 5 key
    sfScanNumpad5 = 102,
    //! Keypad 6 and Right Arrow key
    sfScanNumpad6 = 103,
    //! Keypad 7 and Home key
    sfScanNumpad7 = 104,
    //! Keypad 8 and Up Arrow key
    sfScanNumpad8 = 105,
    //! Keypad 9 and Page Up key
    sfScanNumpad9 = 106,
    //! Keypad 0 and Insert key
    sfScanNumpad0 = 107,
    //! Keyboard Non-US \ and | key
    sfScanNonUsBackslash = 108,
    //! Keyboard Application key
    sfScanApplication = 109,
    //! Keyboard Execute key
    sfScanExecute = 110,
    //! Keyboard Mode Change key
    sfScanModeChange = 111,
    //! Keyboard Help key
    sfScanHelp = 112,
    //! Keyboard Menu key
    sfScanMenu = 113,
    //! Keyboard Select key
    sfScanSelect = 114,
    //! Keyboard Redo key
    sfScanRedo = 115,
    //! Keyboard Undo key
    sfScanUndo = 116,
    //! Keyboard Cut key
    sfScanCut = 117,
    //! Keyboard Copy key
    sfScanCopy = 118,
    //! Keyboard Paste key
    sfScanPaste = 119,
    //! Keyboard Volume Mute key
    sfScanVolumeMute = 120,
    //! Keyboard Volume Up key
    sfScanVolumeUp = 121,
    //! Keyboard Volume Down key
    sfScanVolumeDown = 122,
    //! Keyboard Media Play Pause key
    sfScanMediaPlayPause = 123,
    //! Keyboard Media Stop key
    sfScanMediaStop = 124,
    //! Keyboard Media Next Track key
    sfScanMediaNextTrack = 125,
    //! Keyboard Media Previous Track key
    sfScanMediaPreviousTrack = 126,
    //! Keyboard Left Control key
    sfScanLControl = 127,
    //! Keyboard Left Shift key
    sfScanLShift = 128,
    //! Keyboard Left Alt key
    sfScanLAlt = 129,
    //! Keyboard Left System key
    sfScanLSystem = 130,
    //! Keyboard Right Control key
    sfScanRControl = 131,
    //! Keyboard Right Shift key
    sfScanRShift = 132,
    //! Keyboard Right Alt key
    sfScanRAlt = 133,
    //! Keyboard Right System key
    sfScanRSystem = 134,
    //! Keyboard Back key
    sfScanBack = 135,
    //! Keyboard Forward key
    sfScanForward = 136,
    //! Keyboard Refresh key
    sfScanRefresh = 137,
    //! Keyboard Stop key
    sfScanStop = 138,
    //! Keyboard Search key
    sfScanSearch = 139,
    //! Keyboard Favorites key
    sfScanFavorites = 140,
    //! Keyboard Home Page key
    sfScanHomePage = 141,
    //! Keyboard Launch Application 1 key
    sfScanLaunchApplication1 = 142,
    //! Keyboard Launch Application 2 key
    sfScanLaunchApplication2 = 143,
    //! Keyboard Launch Mail key
    sfScanLaunchMail = 144,
    //! Keyboard Launch Media Select key
    sfScanLaunchMediaSelect = 145,
    //! Keep last -- the total number of scancodes
    sfScancodeCount = 146);
  PsfScancode = ^sfScancode;

  ////////////////////////////////////////////////////////////
  /// \brief Mouse buttons
  ///
  ////////////////////////////////////////////////////////////
  sfMouseButton = (
    /// The left mouse button
    sfMouseLeft = 0,
    /// The right mouse button
    sfMouseRight = 1,
    /// The middle (wheel) mouse button
    sfMouseMiddle = 2,
    /// The first extra mouse button
    sfMouseXButton1 = 3,
    /// The second extra mouse button
    sfMouseXButton2 = 4,
    /// Keep last -- the total number of mouse buttons
    sfMouseButtonCount = 5);
  PsfMouseButton = ^sfMouseButton;

  ////////////////////////////////////////////////////////////
  /// \brief Mouse wheels
  ///
  ////////////////////////////////////////////////////////////
  sfMouseWheel = (
    /// The vertical mouse wheel
    sfMouseVerticalWheel = 0,
    /// The horizontal mouse wheel
    sfMouseHorizontalWheel = 1);
  PsfMouseWheel = ^sfMouseWheel;

  ////////////////////////////////////////////////////////////
  /// \brief Sensor Types
  ///
  ////////////////////////////////////////////////////////////
  sfSensorType = (
    /// Measures the raw acceleration (m/s^2)
    sfSensorAccelerometer = 0,
    /// Measures the raw rotation rates (degrees/s)
    sfSensorGyroscope = 1,
    /// Measures the ambient magnetic field (micro-teslas)
    sfSensorMagnetometer = 2,
    /// Measures the direction and intensity of gravity, independent of device acceleration (m/s^2)
    sfSensorGravity = 3,
    /// Measures the direction and intensity of device acceleration, independent of the gravity (m/s^2)
    sfSensorUserAcceleration = 4,
    /// Measures the absolute 3D orientation (degrees)
    sfSensorOrientation = 5,
    /// Keep last -- the total number of sensor types
    sfSensorCount = 6);
  PsfSensorType = ^sfSensorType;

  ////////////////////////////////////////////////////////////
  /// \brief Definition of all the event types
  ///
  ////////////////////////////////////////////////////////////
  sfEventType = (
    /// The window requested to be closed (no data)
    sfEvtClosed = 0,
    /// The window was resized (data in event.size)
    sfEvtResized = 1,
    /// The window lost the focus (no data)
    sfEvtLostFocus = 2,
    /// The window gained the focus (no data)
    sfEvtGainedFocus = 3,
    /// A character was entered (data in event.text)
    sfEvtTextEntered = 4,
    /// A key was pressed (data in event.key)
    sfEvtKeyPressed = 5,
    /// A key was released (data in event.key)
    sfEvtKeyReleased = 6,
    /// The mouse wheel was scrolled (data in event.mouseWheel) (deprecated)
    sfEvtMouseWheelMoved = 7,
    /// The mouse wheel was scrolled (data in event.mouseWheelScroll)
    sfEvtMouseWheelScrolled = 8,
    /// A mouse button was pressed (data in event.mouseButton)
    sfEvtMouseButtonPressed = 9,
    /// A mouse button was released (data in event.mouseButton)
    sfEvtMouseButtonReleased = 10,
    /// The mouse cursor moved (data in event.mouseMove)
    sfEvtMouseMoved = 11,
    /// The mouse cursor entered the area of the window (no data)
    sfEvtMouseEntered = 12,
    /// The mouse cursor left the area of the window (no data)
    sfEvtMouseLeft = 13,
    /// A joystick button was pressed (data in event.joystickButton)
    sfEvtJoystickButtonPressed = 14,
    /// A joystick button was released (data in event.joystickButton)
    sfEvtJoystickButtonReleased = 15,
    /// The joystick moved along an axis (data in event.joystickMove)
    sfEvtJoystickMoved = 16,
    /// A joystick was connected (data in event.joystickConnect)
    sfEvtJoystickConnected = 17,
    /// A joystick was disconnected (data in event.joystickConnect)
    sfEvtJoystickDisconnected = 18,
    /// A touch event began (data in event.touch)
    sfEvtTouchBegan = 19,
    /// A touch moved (data in event.touch)
    sfEvtTouchMoved = 20,
    /// A touch event ended (data in event.touch)
    sfEvtTouchEnded = 21,
    /// A sensor value changed (data in event.sensor)
    sfEvtSensorChanged = 22,
    /// Keep last -- the total number of event types
    sfEvtCount = 23);
  PsfEventType = ^sfEventType;

  ////////////////////////////////////////////////////////////
  /// \brief Keyboard event parameters
  ///
  ////////////////////////////////////////////////////////////
  sfKeyEvent = record
    &type: sfEventType;
    code: sfKeyCode;
    scancode: sfScancode;
    alt: sfBool;
    control: sfBool;
    shift: sfBool;
    system: sfBool;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Text event parameters
  ///
  ////////////////////////////////////////////////////////////
  sfTextEvent = record
    &type: sfEventType;
    unicode: sfUint32;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Mouse move event parameters
  ///
  ////////////////////////////////////////////////////////////
  sfMouseMoveEvent = record
    &type: sfEventType;
    x: Integer;
    y: Integer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Mouse buttons events parameters
  ///
  ////////////////////////////////////////////////////////////
  sfMouseButtonEvent = record
    &type: sfEventType;
    button: sfMouseButton;
    x: Integer;
    y: Integer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Mouse wheel events parameters
  ///
  /// \deprecated
  /// Use sfMouseWheelScrollEvent instead.
  ///
  ////////////////////////////////////////////////////////////
  sfMouseWheelEvent = record
    &type: sfEventType;
    delta: Integer;
    x: Integer;
    y: Integer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Mouse wheel events parameters
  ///
  ////////////////////////////////////////////////////////////
  sfMouseWheelScrollEvent = record
    &type: sfEventType;
    wheel: sfMouseWheel;
    delta: Single;
    x: Integer;
    y: Integer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Joystick axis move event parameters
  ///
  ////////////////////////////////////////////////////////////
  sfJoystickMoveEvent = record
    &type: sfEventType;
    joystickId: Cardinal;
    axis: sfJoystickAxis;
    position: Single;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Joystick buttons events parameters
  ///
  ////////////////////////////////////////////////////////////
  sfJoystickButtonEvent = record
    &type: sfEventType;
    joystickId: Cardinal;
    button: Cardinal;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Joystick connection/disconnection event parameters
  ///
  ////////////////////////////////////////////////////////////
  sfJoystickConnectEvent = record
    &type: sfEventType;
    joystickId: Cardinal;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Size events parameters
  ///
  ////////////////////////////////////////////////////////////
  sfSizeEvent = record
    &type: sfEventType;
    width: Cardinal;
    height: Cardinal;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Touch events parameters
  ///
  ////////////////////////////////////////////////////////////
  sfTouchEvent = record
    &type: sfEventType;
    finger: Cardinal;
    x: Integer;
    y: Integer;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Sensor event parameters
  ///
  ////////////////////////////////////////////////////////////
  sfSensorEvent = record
    &type: sfEventType;
    sensorType: sfSensorType;
    x: Single;
    y: Single;
    z: Single;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief sfEvent defines a system event and its parameters
  ///
  ////////////////////////////////////////////////////////////
  sfEvent = record
    case Integer of
      0: (/// Type of the event
    &type: sfEventType);
      1: (/// Size event parameters
    size: sfSizeEvent);
      2: (/// Key event parameters
    key: sfKeyEvent);
      3: (/// Text event parameters
    text: sfTextEvent);
      4: (/// Mouse move event parameters
    mouseMove: sfMouseMoveEvent);
      5: (/// Mouse button event parameters
    mouseButton: sfMouseButtonEvent);
      6: (/// Mouse wheel event parameters (deprecated)
    mouseWheel: sfMouseWheelEvent);
      7: (/// Mouse wheel event parameters
    mouseWheelScroll: sfMouseWheelScrollEvent);
      8: (/// Joystick move event parameters
    joystickMove: sfJoystickMoveEvent);
      9: (/// Joystick button event parameters
    joystickButton: sfJoystickButtonEvent);
      10: (/// Joystick (dis)connect event parameters
    joystickConnect: sfJoystickConnectEvent);
      11: (/// Touch events parameters
    touch: sfTouchEvent);
      12: (/// Sensor event parameters
    sensor: sfSensorEvent);
  end;

  ////////////////////////////////////////////////////////////
  /// \brief sfVideoMode defines a video mode (width, height, bpp, frequency)
  ///        and provides functions for getting modes supported
  ///        by the display device
  ///
  ////////////////////////////////////////////////////////////
  sfVideoMode = record
    /// Video mode width, in pixels
    width: Cardinal;
    /// Video mode height, in pixels
    height: Cardinal;
    /// Video mode pixel depth, in bits per pixels
    bitsPerPixel: Cardinal;
  end;

  sfWindowHandle = Pointer;
  PsfWindowHandle = ^sfWindowHandle;
  VkInstance = Pointer;
  PVkInstance = ^VkInstance;
  VkSurfaceKHR = Pointer;
  PVkSurfaceKHR = ^VkSurfaceKHR;
  PVkAllocationCallbacks = Pointer;
  PPVkAllocationCallbacks = ^PVkAllocationCallbacks;

  sfVulkanFunctionPointer = procedure(); cdecl;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of window creation styles
  ///
  ////////////////////////////////////////////////////////////
  sfWindowStyle = (
    /// No border / title bar (this flag and all others are mutually exclusive)
    sfNone = 0,
    /// Title bar + fixed border
    sfTitlebar = 1,
    /// Titlebar + resizable border + maximize button
    sfResize = 2,
    /// Titlebar + close button
    sfClose = 4,
    /// Fullscreen mode (this flag and all others are mutually exclusive)
    sfFullscreen = 8,
    /// Default window style
    sfDefaultStyle = 7);
  PsfWindowStyle = ^sfWindowStyle;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of the context attribute flags
  ///
  ////////////////////////////////////////////////////////////
  sfContextAttribute = (
    /// Non-debug, compatibility context (this and the core attribute are mutually exclusive)
    sfContextDefault = 0,
    /// Core attribute
    sfContextCore = 1,
    /// Debug attribute
    sfContextDebug = 4);
  PsfContextAttribute = ^sfContextAttribute;

  ////////////////////////////////////////////////////////////
  /// \brief Structure defining the window's creation settings
  ///
  ////////////////////////////////////////////////////////////
  sfContextSettings = record
    /// Bits of the depth buffer
    depthBits: Cardinal;
    /// Bits of the stencil buffer
    stencilBits: Cardinal;
    /// Level of antialiasing
    antialiasingLevel: Cardinal;
    /// Major number of the context version to create
    majorVersion: Cardinal;
    /// Minor number of the context version to create
    minorVersion: Cardinal;
    /// The attribute flags to create the context with
    attributeFlags: sfUint32;
    /// Whether the context framebuffer is sRGB capable
    sRgbCapable: sfBool;
  end;

  GlFunctionPointer = procedure(); cdecl;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of the native system cursor types
  ///
  /// Refer to the following table to determine which cursor
  /// is available on which platform.
  ///
  ///  Type                               | Linux | Mac OS X | Windows
  /// ------------------------------------|:-----:|:--------:|:--------:
  ///  sfCursorArrow                  |  yes  |    yes   |   yes
  ///  sfCursorArrowWait              |  no   |    no    |   yes
  ///  sfCursorWait                   |  yes  |    no    |   yes
  ///  sfCursorText                   |  yes  |    yes   |   yes
  ///  sfCursorHand                   |  yes  |    yes   |   yes
  ///  sfCursorSizeHorizontal         |  yes  |    yes   |   yes
  ///  sfCursorSizeVertical           |  yes  |    yes   |   yes
  ///  sfCursorSizeTopLeftBottomRight |  no   |    no    |   yes
  ///  sfCursorSizeBottomLeftTopRight |  no   |    no    |   yes
  ///  sfCursorSizeLeft               |  yes  |    yes   |   yes
  ///  sfCursorSizeRight              |  yes  |    yes   |   yes
  ///  sfCursorSizeTop                |  yes  |    yes   |   yes
  ///  sfCursorSizeBottom             |  yes  |    yes   |   yes
  ///  sfCursorSizeTopLeft            |  yes  |    yes   |   yes
  ///  sfCursorSizeTopRight           |  yes  |    yes   |   yes
  ///  sfCursorSizeBottomLeft         |  yes  |    yes   |   yes
  ///  sfCursorSizeBottomRight        |  yes  |    yes   |   yes
  ///  sfCursorSizeAll                |  yes  |    no    |   yes
  ///  sfCursorCross                  |  yes  |    yes   |   yes
  ///  sfCursorHelp                   |  yes  |    no    |   yes
  ///  sfCursorNotAllowed             |  yes  |    yes   |   yes
  ///
  ////////////////////////////////////////////////////////////
  sfCursorType = (
    /// Arrow cursor (default)
    sfCursorArrow = 0,
    /// Busy arrow cursor
    sfCursorArrowWait = 1,
    /// Busy cursor
    sfCursorWait = 2,
    /// I-beam, cursor when hovering over a field allowing text entry
    sfCursorText = 3,
    /// Pointing hand cursor
    sfCursorHand = 4,
    /// Horizontal double arrow cursor
    sfCursorSizeHorizontal = 5,
    /// Vertical double arrow cursor
    sfCursorSizeVertical = 6,
    /// Double arrow cursor going from top-left to bottom-right
    sfCursorSizeTopLeftBottomRight = 7,
    /// Double arrow cursor going from bottom-left to top-right
    sfCursorSizeBottomLeftTopRight = 8,
    /// Left arrow cursor on Linux, same as SizeHorizontal on other platforms
    sfCursorSizeLeft = 9,
    /// Right arrow cursor on Linux, same as SizeHorizontal on other platforms
    sfCursorSizeRight = 10,
    /// Up arrow cursor on Linux, same as SizeVertical on other platforms
    sfCursorSizeTop = 11,
    /// Down arrow cursor on Linux, same as SizeVertical on other platforms
    sfCursorSizeBottom = 12,
    /// Top-left arrow cursor on Linux, same as SizeTopLeftBottomRight on other platforms
    sfCursorSizeTopLeft = 13,
    /// Bottom-right arrow cursor on Linux, same as SizeTopLeftBottomRight on other platforms
    sfCursorSizeBottomRight = 14,
    /// Bottom-left arrow cursor on Linux, same as SizeBottomLeftTopRight on other platforms
    sfCursorSizeBottomLeft = 15,
    /// Top-right arrow cursor on Linux, same as SizeBottomLeftTopRight on other platforms
    sfCursorSizeTopRight = 16,
    /// Combination of SizeHorizontal and SizeVertical
    sfCursorSizeAll = 17,
    /// Crosshair cursor
    sfCursorCross = 18,
    /// Help cursor
    sfCursorHelp = 19,
    /// Action not allowed cursor
    sfCursorNotAllowed = 20);
  PsfCursorType = ^sfCursorType;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of the blending factors
  ///
  ////////////////////////////////////////////////////////////
  sfBlendFactor = (
    /// (0, 0, 0, 0)
    sfBlendFactorZero = 0,
    /// (1, 1, 1, 1)
    sfBlendFactorOne = 1,
    /// (src.r, src.g, src.b, src.a)
    sfBlendFactorSrcColor = 2,
    /// (1, 1, 1, 1) - (src.r, src.g, src.b, src.a)
    sfBlendFactorOneMinusSrcColor = 3,
    /// (dst.r, dst.g, dst.b, dst.a)
    sfBlendFactorDstColor = 4,
    /// (1, 1, 1, 1) - (dst.r, dst.g, dst.b, dst.a)
    sfBlendFactorOneMinusDstColor = 5,
    /// (src.a, src.a, src.a, src.a)
    sfBlendFactorSrcAlpha = 6,
    /// (1, 1, 1, 1) - (src.a, src.a, src.a, src.a)
    sfBlendFactorOneMinusSrcAlpha = 7,
    /// (dst.a, dst.a, dst.a, dst.a)
    sfBlendFactorDstAlpha = 8,
    /// (1, 1, 1, 1) - (dst.a, dst.a, dst.a, dst.a)
    sfBlendFactorOneMinusDstAlpha = 9);
  PsfBlendFactor = ^sfBlendFactor;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of the blending equations
  ///
  ////////////////////////////////////////////////////////////
  sfBlendEquation = (
    /// Pixel = Src * SrcFactor + Dst * DstFactor
    sfBlendEquationAdd = 0,
    /// Pixel = Src * SrcFactor - Dst * DstFactor
    sfBlendEquationSubtract = 1,
    /// Pixel = Dst * DstFactor - Src * SrcFactor
    sfBlendEquationReverseSubtract = 2,
    /// Pixel = min(Dst, Src)
    sfBlendEquationMin = 3,
    /// Pixel = max(Dst, Src)
    sfBlendEquationMax = 4);
  PsfBlendEquation = ^sfBlendEquation;

  ////////////////////////////////////////////////////////////
  /// \brief Blending mode for drawing
  ///
  ////////////////////////////////////////////////////////////
  sfBlendMode = record
    /// Source blending factor for the color channels
    colorSrcFactor: sfBlendFactor;
    /// Destination blending factor for the color channels
    colorDstFactor: sfBlendFactor;
    /// Blending equation for the color channels
    colorEquation: sfBlendEquation;
    /// Source blending factor for the alpha channel
    alphaSrcFactor: sfBlendFactor;
    /// Destination blending factor for the alpha channel
    alphaDstFactor: sfBlendFactor;
    /// Blending equation for the alpha channel
    alphaEquation: sfBlendEquation;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Utility class for manpulating RGBA colors
  ///
  ////////////////////////////////////////////////////////////
  sfColor = record
    r: sfUint8;
    g: sfUint8;
    b: sfUint8;
    a: sfUint8;
  end;

  ////////////////////////////////////////////////////////////
  /// sfFloatRect and sfIntRect are utility classes for
  /// manipulating rectangles.
  ////////////////////////////////////////////////////////////
  sfFloatRect = record
    left: Single;
    top: Single;
    width: Single;
    height: Single;
  end;

  sfIntRect = record
    left: Integer;
    top: Integer;
    width: Integer;
    height: Integer;
  end;

  PsfCircleShape = Pointer;
  PPsfCircleShape = ^PsfCircleShape;
  PsfConvexShape = Pointer;
  PPsfConvexShape = ^PsfConvexShape;
  PsfFont = Pointer;
  PPsfFont = ^PsfFont;
  PsfImage = Pointer;
  PPsfImage = ^PsfImage;
  PsfShader = Pointer;
  PPsfShader = ^PsfShader;
  PsfRectangleShape = Pointer;
  PPsfRectangleShape = ^PsfRectangleShape;
  PsfRenderTexture = Pointer;
  PPsfRenderTexture = ^PsfRenderTexture;
  PsfRenderWindow = Pointer;
  PPsfRenderWindow = ^PsfRenderWindow;
  PsfShape = Pointer;
  PPsfShape = ^PsfShape;
  PsfSprite = Pointer;
  PPsfSprite = ^PsfSprite;
  PsfText = Pointer;
  PPsfText = ^PsfText;
  PsfTexture = Pointer;
  PPsfTexture = ^PsfTexture;
  PsfTransformable = Pointer;
  PPsfTransformable = ^PsfTransformable;
  PsfVertexArray = Pointer;
  PPsfVertexArray = ^PsfVertexArray;
  PsfVertexBuffer = Pointer;
  PPsfVertexBuffer = ^PsfVertexBuffer;
  PsfView = Pointer;
  PPsfView = ^PsfView;

  ////////////////////////////////////////////////////////////
  /// \brief Encapsulate a 3x3 transform matrix
  ///
  ////////////////////////////////////////////////////////////
  sfTransform = record
    matrix: array [0..8] of Single;
  end;

  ////////////////////////////////////////////////////////////
  /// sfFontInfo holds various information about a font
  ////////////////////////////////////////////////////////////
  sfFontInfo = record
    family: PUTF8Char;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief sfGlyph describes a glyph (a visual character)
  ///
  ////////////////////////////////////////////////////////////
  sfGlyph = record
    /// Offset to move horizontically to the next character
    advance: Single;
    /// Bounding rectangle of the glyph, in coordinates relative to the baseline
    bounds: sfFloatRect;
    /// Texture coordinates of the glyph inside the font's image
    textureRect: sfIntRect;
  end;

  ////////////////////////////////////////////////////////////
  /// \brief Types of primitives that a sf::VertexArray can render
  ///
  /// Points and lines have no area, therefore their thickness
  /// will always be 1 pixel, regardless the current transform
  /// and view.
  ///
  ////////////////////////////////////////////////////////////
  sfPrimitiveType = (
    /// List of individual points
    sfPoints = 0,
    /// List of individual lines
    sfLines = 1,
    /// List of connected lines, a point uses the previous point to form a line
    sfLineStrip = 2,
    /// List of individual triangles
    sfTriangles = 3,
    /// List of connected triangles, a point uses the two previous points to form a triangle
    sfTriangleStrip = 4,
    /// List of connected triangles, a point uses the common center and the previous point to form a triangle
    sfTriangleFan = 5,
    /// List of individual quads
    sfQuads = 6,
    /// \deprecated Use sfLineStrip instead
    sfLinesStrip = 2,
    /// \deprecated Use sfTriangleStrip instead
    sfTrianglesStrip = 4,
    /// \deprecated Use sfTriangleFan instead
    sfTrianglesFan = 5);
  PsfPrimitiveType = ^sfPrimitiveType;

  ////////////////////////////////////////////////////////////
  /// \brief Define the states used for drawing to a RenderTarget
  ///
  ////////////////////////////////////////////////////////////
  sfRenderStates = record
    /// Blending mode
    blendMode: sfBlendMode;
    /// Transform
    transform: sfTransform;
    /// Texture
    texture: PsfTexture;
    /// Shader
    shader: PsfShader;
  end;

  ////////////////////////////////////////////////////////////
  /// Define a point with color and texture coordinates
  ////////////////////////////////////////////////////////////
  sfVertex = record
    /// Position of the vertex
    position: sfVector2f;
    /// Color of the vertex
    color: sfColor;
    /// Coordinates of the texture's pixel to map to the vertex
    texCoords: sfVector2f;
  end;

  sfGlslVec2 = sfVector2f;
  PsfGlslVec2 = ^sfGlslVec2;
  sfGlslIvec2 = sfVector2i;

  sfGlslBvec2 = record
    x: sfBool;
    y: sfBool;
  end;

  sfGlslVec3 = sfVector3f;
  PsfGlslVec3 = ^sfGlslVec3;

  sfGlslIvec3 = record
    x: Integer;
    y: Integer;
    z: Integer;
  end;

  sfGlslBvec3 = record
    x: sfBool;
    y: sfBool;
    z: sfBool;
  end;

  sfGlslVec4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  sfGlslIvec4 = record
    x: Integer;
    y: Integer;
    z: Integer;
    w: Integer;
  end;

  sfGlslBvec4 = record
    x: sfBool;
    y: sfBool;
    z: sfBool;
    w: sfBool;
  end;

  sfGlslMat3 = record
    &array: array [0..8] of Single;
  end;

  sfGlslMat4 = record
    &array: array [0..15] of Single;
  end;

  sfShapeGetPointCountCallback = function(p1: Pointer): NativeUInt; cdecl;

  sfShapeGetPointCallback = function(p1: NativeUInt; p2: Pointer): sfVector2f; cdecl;

  ////////////////////////////////////////////////////////////
  /// sfText styles
  ////////////////////////////////////////////////////////////
  sfTextStyle = (
    /// Regular characters, no style
    sfTextRegular = 0,
    /// Bold characters
    sfTextBold = 1,
    /// Italic characters
    sfTextItalic = 2,
    /// Underlined characters
    sfTextUnderlined = 4,
    /// Strike through characters
    sfTextStrikeThrough = 8);
  PsfTextStyle = ^sfTextStyle;

  ////////////////////////////////////////////////////////////
  /// \brief Types of texture coordinates that can be used for rendering.
  ///
  ////////////////////////////////////////////////////////////
  sfTextureCoordinateType = (
    /// sfTexture coordinates in range [0 .. 1].
    sfTextureNormalized = 0,
    /// sfTexture coordinates in range [0 .. size].
    sfTexturePixels = 1);
  PsfTextureCoordinateType = ^sfTextureCoordinateType;

  ////////////////////////////////////////////////////////////
  /// \brief Usage specifiers
  ///
  /// If data is going to be updated once or more every frame,
  /// set the usage to sfVertexBufferStream. If data is going
  /// to be set once and used for a long time without being
  /// modified, set the usage to sfVertexBufferUsageStatic.
  /// For everything else sfVertexBufferUsageDynamic should
  /// be a good compromise.
  ///
  ////////////////////////////////////////////////////////////
  sfVertexBufferUsage = (
    /// Constantly changing data
    sfVertexBufferStream = 0,
    /// Occasionally changing data
    sfVertexBufferDynamic = 1,
    /// Rarely changing data
    sfVertexBufferStatic = 2);
  PsfVertexBufferUsage = ^sfVertexBufferUsage;

  ////////////////////////////////////////////////////////////
  /// \brief Encapsulate an IPv4 network address
  ///
  ////////////////////////////////////////////////////////////
  sfIpAddress = record
    address: array [0..15] of UTF8Char;
  end;

  PsfFtpDirectoryResponse = Pointer;
  PPsfFtpDirectoryResponse = ^PsfFtpDirectoryResponse;
  PsfFtpListingResponse = Pointer;
  PPsfFtpListingResponse = ^PsfFtpListingResponse;
  PsfFtpResponse = Pointer;
  PPsfFtpResponse = ^PsfFtpResponse;
  PsfFtp = Pointer;
  PPsfFtp = ^PsfFtp;
  PsfHttpRequest = Pointer;
  PPsfHttpRequest = ^PsfHttpRequest;
  PsfHttpResponse = Pointer;
  PPsfHttpResponse = ^PsfHttpResponse;
  PsfHttp = Pointer;
  PPsfHttp = ^PsfHttp;
  PsfPacket = Pointer;
  PPsfPacket = ^PsfPacket;
  PsfSocketSelector = Pointer;
  PPsfSocketSelector = ^PsfSocketSelector;
  PsfTcpListener = Pointer;
  PPsfTcpListener = ^PsfTcpListener;
  PsfTcpSocket = Pointer;
  PPsfTcpSocket = ^PsfTcpSocket;
  PsfUdpSocket = Pointer;
  PPsfUdpSocket = ^PsfUdpSocket;

  ////////////////////////////////////////////////////////////
  /// \brief Enumeration of transfer modes
  ///
  ////////////////////////////////////////////////////////////
  sfFtpTransferMode = (
    /// Binary mode (file is transfered as a sequence of bytes)
    sfFtpBinary = 0,
    /// Text mode using ASCII encoding
    sfFtpAscii = 1,
    /// Text mode using EBCDIC encoding
    sfFtpEbcdic = 2);
  PsfFtpTransferMode = ^sfFtpTransferMode;

  ////////////////////////////////////////////////////////////
  /// \brief Status codes possibly returned by a FTP response
  ///
  ////////////////////////////////////////////////////////////
  sfFtpStatus = (
    /// Restart marker reply
    sfFtpRestartMarkerReply = 110,
    /// Service ready in N minutes
    sfFtpServiceReadySoon = 120,
    /// Data connection already opened, transfer starting
    sfFtpDataConnectionAlreadyOpened = 125,
    /// File status ok, about to open data connection
    sfFtpOpeningDataConnection = 150,
    /// Command ok
    sfFtpOk = 200,
    /// Command not implemented
    sfFtpPointlessCommand = 202,
    /// System status, or system help reply
    sfFtpSystemStatus = 211,
    /// Directory status
    sfFtpDirectoryStatus = 212,
    /// File status
    sfFtpFileStatus = 213,
    /// Help message
    sfFtpHelpMessage = 214,
    /// NAME system type, where NAME is an official system name from the list in the Assigned Numbers document
    sfFtpSystemType = 215,
    /// Service ready for new user
    sfFtpServiceReady = 220,
    /// Service closing control connection
    sfFtpClosingConnection = 221,
    /// Data connection open, no transfer in progress
    sfFtpDataConnectionOpened = 225,
    /// Closing data connection, requested file action successful
    sfFtpClosingDataConnection = 226,
    /// Entering passive mode
    sfFtpEnteringPassiveMode = 227,
    /// User logged in, proceed. Logged out if appropriate
    sfFtpLoggedIn = 230,
    /// Requested file action ok
    sfFtpFileActionOk = 250,
    /// PATHNAME created
    sfFtpDirectoryOk = 257,
    /// User name ok, need password
    sfFtpNeedPassword = 331,
    /// Need account for login
    sfFtpNeedAccountToLogIn = 332,
    /// Requested file action pending further information
    sfFtpNeedInformation = 350,
    /// Service not available, closing control connection
    sfFtpServiceUnavailable = 421,
    /// Can't open data connection
    sfFtpDataConnectionUnavailable = 425,
    /// Connection closed, transfer aborted
    sfFtpTransferAborted = 426,
    /// Requested file action not taken
    sfFtpFileActionAborted = 450,
    /// Requested action aborted, local error in processing
    sfFtpLocalError = 451,
    /// Requested action not taken; insufficient storage space in system, file unavailable
    sfFtpInsufficientStorageSpace = 452,
    /// Syntax error, command unrecognized
    sfFtpCommandUnknown = 500,
    /// Syntax error in parameters or arguments
    sfFtpParametersUnknown = 501,
    /// Command not implemented
    sfFtpCommandNotImplemented = 502,
    /// Bad sequence of commands
    sfFtpBadCommandSequence = 503,
    /// Command not implemented for that parameter
    sfFtpParameterNotImplemented = 504,
    /// Not logged in
    sfFtpNotLoggedIn = 530,
    /// Need account for storing files
    sfFtpNeedAccountToStore = 532,
    /// Requested action not taken, file unavailable
    sfFtpFileUnavailable = 550,
    /// Requested action aborted, page type unknown
    sfFtpPageTypeUnknown = 551,
    /// Requested file action aborted, exceeded storage allocation
    sfFtpNotEnoughMemory = 552,
    /// Requested action not taken, file name not allowed
    sfFtpFilenameNotAllowed = 553,
    /// Response is not a valid FTP one
    sfFtpInvalidResponse = 1000,
    /// Connection with server failed
    sfFtpConnectionFailed = 1001,
    /// Connection with server closed
    sfFtpConnectionClosed = 1002,
    /// Invalid file to upload / download
    sfFtpInvalidFile = 1003);
  PsfFtpStatus = ^sfFtpStatus;

  ////////////////////////////////////////////////////////////
  /// \brief Enumerate the available HTTP methods for a request
  ///
  ////////////////////////////////////////////////////////////
  sfHttpMethod = (
    /// Request in get mode, standard method to retrieve a page
    sfHttpGet = 0,
    /// Request in post mode, usually to send data to a page
    sfHttpPost = 1,
    /// Request a page's header only
    sfHttpHead = 2,
    /// Request in put mode, useful for a REST API
    sfHttpPut = 3,
    /// Request in delete mode, useful for a REST API
    sfHttpDelete = 4);
  PsfHttpMethod = ^sfHttpMethod;

  ////////////////////////////////////////////////////////////
  /// \brief Enumerate all the valid status codes for a response
  ///
  ////////////////////////////////////////////////////////////
  sfHttpStatus = (
    /// Most common code returned when operation was successful
    sfHttpOk = 200,
    /// The resource has successfully been created
    sfHttpCreated = 201,
    /// The request has been accepted, but will be processed later by the server
    sfHttpAccepted = 202,
    /// Sent when the server didn't send any data in return
    sfHttpNoContent = 204,
    /// The server informs the client that it should clear the view (form) that caused the request to be sent
    sfHttpResetContent = 205,
    /// The server has sent a part of the resource, as a response to a partial GET request
    sfHttpPartialContent = 206,
    /// The requested page can be accessed from several locations
    sfHttpMultipleChoices = 300,
    /// The requested page has permanently moved to a new location
    sfHttpMovedPermanently = 301,
    /// The requested page has temporarily moved to a new location
    sfHttpMovedTemporarily = 302,
    /// For conditional requests, means the requested page hasn't changed and doesn't need to be refreshed
    sfHttpNotModified = 304,
    /// The server couldn't understand the request (syntax error)
    sfHttpBadRequest = 400,
    /// The requested page needs an authentication to be accessed
    sfHttpUnauthorized = 401,
    /// The requested page cannot be accessed at all, even with authentication
    sfHttpForbidden = 403,
    /// The requested page doesn't exist
    sfHttpNotFound = 404,
    /// The server can't satisfy the partial GET request (with a "Range" header field)
    sfHttpRangeNotSatisfiable = 407,
    /// The server encountered an unexpected error
    sfHttpInternalServerError = 500,
    /// The server doesn't implement a requested feature
    sfHttpNotImplemented = 501,
    /// The gateway server has received an error from the source server
    sfHttpBadGateway = 502,
    /// The server is temporarily unavailable (overloaded, in maintenance, ...)
    sfHttpServiceNotAvailable = 503,
    /// The gateway server couldn't receive a response from the source server
    sfHttpGatewayTimeout = 504,
    /// The server doesn't support the requested HTTP version
    sfHttpVersionNotSupported = 505,
    /// Response is not a valid HTTP one
    sfHttpInvalidResponse = 1000,
    /// Connection with server failed
    sfHttpConnectionFailed = 1001);
  PsfHttpStatus = ^sfHttpStatus;

  ////////////////////////////////////////////////////////////
  /// \brief Define the status that can be returned by the socket functions
  ///
  ////////////////////////////////////////////////////////////
  sfSocketStatus = (
    /// The socket has sent / received the data
    sfSocketDone = 0,
    /// The socket is not ready to send / receive data yet
    sfSocketNotReady = 1,
    /// The socket sent a part of the data
    sfSocketPartial = 2,
    /// The TCP socket has been disconnected
    sfSocketDisconnected = 3,
    /// An unexpected error happened
    sfSocketError = 4);
  PsfSocketStatus = ^sfSocketStatus;

  _sfEvent = record
  end;

  PsfEvent = P_sfEvent;
  Pplm_t = Pointer;
  PPplm_t = ^Pplm_t;
  Pplm_buffer_t = Pointer;
  PPplm_buffer_t = ^Pplm_buffer_t;
  Pplm_demux_t = Pointer;
  PPplm_demux_t = ^Pplm_demux_t;
  Pplm_video_t = Pointer;
  PPplm_video_t = ^Pplm_video_t;
  Pplm_audio_t = Pointer;
  PPplm_audio_t = ^Pplm_audio_t;

  plm_packet_t = record
    &type: Integer;
    pts: Double;
    length: NativeUInt;
    data: PUInt8;
  end;

  plm_plane_t = record
    width: Cardinal;
    height: Cardinal;
    data: PUInt8;
  end;

  plm_frame_t = record
    time: Double;
    width: Cardinal;
    height: Cardinal;
    y: plm_plane_t;
    cr: plm_plane_t;
    cb: plm_plane_t;
  end;

  plm_video_decode_callback = procedure(self: Pplm_t; frame: Pplm_frame_t; user: Pointer); cdecl;

  plm_samples_t = record
    time: Double;
    count: Cardinal;
    interleaved: array [0..2303] of Single;
  end;

  plm_audio_decode_callback = procedure(self: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;

  plm_buffer_load_callback = procedure(self: Pplm_buffer_t; user: Pointer); cdecl;
  voidp = Pointer;
  unzFile = voidp;
  zipFile = voidp;
  uInt = Cardinal;
  uLong = Cardinal;
  Bytef = &Byte;
  PBytef = ^Bytef;

  tm_zip_s = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
  end;

  tm_zip = tm_zip_s;

  zip_fileinfo = record
    tmz_date: tm_zip;
    dosDate: uLong;
    internal_fa: uLong;
    external_fa: uLong;
  end;

  tm_unz_s = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
  end;

  tm_unz = tm_unz_s;

  unz_file_info64_s = record
    version: uLong;
    version_needed: uLong;
    flag: uLong;
    compression_method: uLong;
    dosDate: uLong;
    crc: uLong;
    compressed_size: UInt64;
    uncompressed_size: UInt64;
    size_filename: uLong;
    size_file_extra: uLong;
    size_file_comment: uLong;
    disk_num_start: uLong;
    internal_fa: uLong;
    external_fa: uLong;
    tmu_date: tm_unz;
  end;

  unz_file_info64 = unz_file_info64_s;
  Punz_file_info64 = ^unz_file_info64;
  ImU64 = UInt64;
  PImU64 = ^ImU64;
  PImGuiDockRequest = Pointer;
  PPImGuiDockRequest = ^PImGuiDockRequest;
  PImGuiDockNodeSettings = Pointer;
  PPImGuiDockNodeSettings = ^PImGuiDockNodeSettings;
  PImGuiInputTextDeactivateData = Pointer;
  PPImGuiInputTextDeactivateData = ^PImGuiInputTextDeactivateData;
  PImGuiTableColumnsSettings = Pointer;
  PPImGuiTableColumnsSettings = ^PImGuiTableColumnsSettings;

  ImVector_const_charPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPUTF8Char;
  end;

  ImGuiCol = Integer;
  ImGuiCond = Integer;
  ImGuiDataType = Integer;
  ImGuiDir = Integer;
  PImGuiDir = ^ImGuiDir;
  ImGuiMouseButton = Integer;
  ImGuiMouseCursor = Integer;
  ImGuiSortDirection = Integer;
  ImGuiStyleVar = Integer;
  ImGuiTableBgTarget = Integer;
  ImDrawFlags = Integer;
  ImDrawListFlags = Integer;
  ImFontAtlasFlags = Integer;
  ImGuiBackendFlags = Integer;
  ImGuiButtonFlags = Integer;
  ImGuiChildFlags = Integer;
  ImGuiColorEditFlags = Integer;
  ImGuiConfigFlags = Integer;
  ImGuiComboFlags = Integer;
  ImGuiDockNodeFlags = Integer;
  ImGuiDragDropFlags = Integer;
  ImGuiFocusedFlags = Integer;
  ImGuiHoveredFlags = Integer;
  ImGuiInputTextFlags = Integer;
  ImGuiKeyChord = Integer;
  ImGuiPopupFlags = Integer;
  ImGuiSelectableFlags = Integer;
  ImGuiSliderFlags = Integer;
  ImGuiTabBarFlags = Integer;
  ImGuiTabItemFlags = Integer;
  ImGuiTableFlags = Integer;
  ImGuiTableColumnFlags = Integer;
  ImGuiTableRowFlags = Integer;
  ImGuiTreeNodeFlags = Integer;
  ImGuiViewportFlags = Integer;
  ImGuiWindowFlags = Integer;
  ImTextureID = Pointer;
  PImTextureID = ^ImTextureID;
  ImDrawIdx = Word;
  PImDrawIdx = ^ImDrawIdx;
  ImGuiID = Cardinal;
  PImGuiID = ^ImGuiID;
  ImS8 = UTF8Char;
  ImU8 = Byte;
  ImS16 = Smallint;
  ImU16 = Word;
  ImS32 = Integer;
  ImU32 = Cardinal;
  PImU32 = ^ImU32;
  ImS64 = Int64;
  PImS64 = ^ImS64;
  ImWchar32 = Cardinal;
  ImWchar16 = Word;
  ImWchar = ImWchar16;
  PImWchar = ^ImWchar;

  ImGuiInputTextCallback = function(data: PImGuiInputTextCallbackData): Integer; cdecl;

  ImGuiSizeCallback = procedure(data: PImGuiSizeCallbackData); cdecl;

  ImGuiMemAllocFunc = function(sz: NativeUInt; user_data: Pointer): Pointer; cdecl;
  PImGuiMemAllocFunc = ^ImGuiMemAllocFunc;

  ImGuiMemFreeFunc = procedure(ptr: Pointer; user_data: Pointer); cdecl;
  PImGuiMemFreeFunc = ^ImGuiMemFreeFunc;

  ImVec2 = record
    x: Single;
    y: Single;
  end;

  ImVec4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  ImGuiWindowFlags_ = (
    ImGuiWindowFlags_None = 0,
    ImGuiWindowFlags_NoTitleBar = 1,
    ImGuiWindowFlags_NoResize = 2,
    ImGuiWindowFlags_NoMove = 4,
    ImGuiWindowFlags_NoScrollbar = 8,
    ImGuiWindowFlags_NoScrollWithMouse = 16,
    ImGuiWindowFlags_NoCollapse = 32,
    ImGuiWindowFlags_AlwaysAutoResize = 64,
    ImGuiWindowFlags_NoBackground = 128,
    ImGuiWindowFlags_NoSavedSettings = 256,
    ImGuiWindowFlags_NoMouseInputs = 512,
    ImGuiWindowFlags_MenuBar = 1024,
    ImGuiWindowFlags_HorizontalScrollbar = 2048,
    ImGuiWindowFlags_NoFocusOnAppearing = 4096,
    ImGuiWindowFlags_NoBringToFrontOnFocus = 8192,
    ImGuiWindowFlags_AlwaysVerticalScrollbar = 16384,
    ImGuiWindowFlags_AlwaysHorizontalScrollbar = 32768,
    ImGuiWindowFlags_NoNavInputs = 65536,
    ImGuiWindowFlags_NoNavFocus = 131072,
    ImGuiWindowFlags_UnsavedDocument = 262144,
    ImGuiWindowFlags_NoDocking = 524288,
    ImGuiWindowFlags_NoNav = 196608,
    ImGuiWindowFlags_NoDecoration = 43,
    ImGuiWindowFlags_NoInputs = 197120,
    ImGuiWindowFlags_NavFlattened = 8388608,
    ImGuiWindowFlags_ChildWindow = 16777216,
    ImGuiWindowFlags_Tooltip = 33554432,
    ImGuiWindowFlags_Popup = 67108864,
    ImGuiWindowFlags_Modal = 134217728,
    ImGuiWindowFlags_ChildMenu = 268435456,
    ImGuiWindowFlags_DockNodeHost = 536870912);
  PImGuiWindowFlags_ = ^ImGuiWindowFlags_;

  ImGuiChildFlags_ = (
    ImGuiChildFlags_None = 0,
    ImGuiChildFlags_Border = 1,
    ImGuiChildFlags_AlwaysUseWindowPadding = 2,
    ImGuiChildFlags_ResizeX = 4,
    ImGuiChildFlags_ResizeY = 8,
    ImGuiChildFlags_AutoResizeX = 16,
    ImGuiChildFlags_AutoResizeY = 32,
    ImGuiChildFlags_AlwaysAutoResize = 64,
    ImGuiChildFlags_FrameStyle = 128);
  PImGuiChildFlags_ = ^ImGuiChildFlags_;

  ImGuiInputTextFlags_ = (
    ImGuiInputTextFlags_None = 0,
    ImGuiInputTextFlags_CharsDecimal = 1,
    ImGuiInputTextFlags_CharsHexadecimal = 2,
    ImGuiInputTextFlags_CharsUppercase = 4,
    ImGuiInputTextFlags_CharsNoBlank = 8,
    ImGuiInputTextFlags_AutoSelectAll = 16,
    ImGuiInputTextFlags_EnterReturnsTrue = 32,
    ImGuiInputTextFlags_CallbackCompletion = 64,
    ImGuiInputTextFlags_CallbackHistory = 128,
    ImGuiInputTextFlags_CallbackAlways = 256,
    ImGuiInputTextFlags_CallbackCharFilter = 512,
    ImGuiInputTextFlags_AllowTabInput = 1024,
    ImGuiInputTextFlags_CtrlEnterForNewLine = 2048,
    ImGuiInputTextFlags_NoHorizontalScroll = 4096,
    ImGuiInputTextFlags_AlwaysOverwrite = 8192,
    ImGuiInputTextFlags_ReadOnly = 16384,
    ImGuiInputTextFlags_Password = 32768,
    ImGuiInputTextFlags_NoUndoRedo = 65536,
    ImGuiInputTextFlags_CharsScientific = 131072,
    ImGuiInputTextFlags_CallbackResize = 262144,
    ImGuiInputTextFlags_CallbackEdit = 524288,
    ImGuiInputTextFlags_EscapeClearsAll = 1048576);
  PImGuiInputTextFlags_ = ^ImGuiInputTextFlags_;

  ImGuiTreeNodeFlags_ = (
    ImGuiTreeNodeFlags_None = 0,
    ImGuiTreeNodeFlags_Selected = 1,
    ImGuiTreeNodeFlags_Framed = 2,
    ImGuiTreeNodeFlags_AllowOverlap = 4,
    ImGuiTreeNodeFlags_NoTreePushOnOpen = 8,
    ImGuiTreeNodeFlags_NoAutoOpenOnLog = 16,
    ImGuiTreeNodeFlags_DefaultOpen = 32,
    ImGuiTreeNodeFlags_OpenOnDoubleClick = 64,
    ImGuiTreeNodeFlags_OpenOnArrow = 128,
    ImGuiTreeNodeFlags_Leaf = 256,
    ImGuiTreeNodeFlags_Bullet = 512,
    ImGuiTreeNodeFlags_FramePadding = 1024,
    ImGuiTreeNodeFlags_SpanAvailWidth = 2048,
    ImGuiTreeNodeFlags_SpanFullWidth = 4096,
    ImGuiTreeNodeFlags_SpanAllColumns = 8192,
    ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 16384,
    ImGuiTreeNodeFlags_CollapsingHeader = 26);
  PImGuiTreeNodeFlags_ = ^ImGuiTreeNodeFlags_;

  ImGuiPopupFlags_ = (
    ImGuiPopupFlags_None = 0,
    ImGuiPopupFlags_MouseButtonLeft = 0,
    ImGuiPopupFlags_MouseButtonRight = 1,
    ImGuiPopupFlags_MouseButtonMiddle = 2,
    ImGuiPopupFlags_MouseButtonMask_ = 31,
    ImGuiPopupFlags_MouseButtonDefault_ = 1,
    ImGuiPopupFlags_NoOpenOverExistingPopup = 32,
    ImGuiPopupFlags_NoOpenOverItems = 64,
    ImGuiPopupFlags_AnyPopupId = 128,
    ImGuiPopupFlags_AnyPopupLevel = 256,
    ImGuiPopupFlags_AnyPopup = 384);
  PImGuiPopupFlags_ = ^ImGuiPopupFlags_;

  ImGuiSelectableFlags_ = (
    ImGuiSelectableFlags_None = 0,
    ImGuiSelectableFlags_DontClosePopups = 1,
    ImGuiSelectableFlags_SpanAllColumns = 2,
    ImGuiSelectableFlags_AllowDoubleClick = 4,
    ImGuiSelectableFlags_Disabled = 8,
    ImGuiSelectableFlags_AllowOverlap = 16);
  PImGuiSelectableFlags_ = ^ImGuiSelectableFlags_;

  ImGuiComboFlags_ = (
    ImGuiComboFlags_None = 0,
    ImGuiComboFlags_PopupAlignLeft = 1,
    ImGuiComboFlags_HeightSmall = 2,
    ImGuiComboFlags_HeightRegular = 4,
    ImGuiComboFlags_HeightLarge = 8,
    ImGuiComboFlags_HeightLargest = 16,
    ImGuiComboFlags_NoArrowButton = 32,
    ImGuiComboFlags_NoPreview = 64,
    ImGuiComboFlags_WidthFitPreview = 128,
    ImGuiComboFlags_HeightMask_ = 30);
  PImGuiComboFlags_ = ^ImGuiComboFlags_;

  ImGuiTabBarFlags_ = (
    ImGuiTabBarFlags_None = 0,
    ImGuiTabBarFlags_Reorderable = 1,
    ImGuiTabBarFlags_AutoSelectNewTabs = 2,
    ImGuiTabBarFlags_TabListPopupButton = 4,
    ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 8,
    ImGuiTabBarFlags_NoTabListScrollingButtons = 16,
    ImGuiTabBarFlags_NoTooltip = 32,
    ImGuiTabBarFlags_FittingPolicyResizeDown = 64,
    ImGuiTabBarFlags_FittingPolicyScroll = 128,
    ImGuiTabBarFlags_FittingPolicyMask_ = 192,
    ImGuiTabBarFlags_FittingPolicyDefault_ = 64);
  PImGuiTabBarFlags_ = ^ImGuiTabBarFlags_;

  ImGuiTabItemFlags_ = (
    ImGuiTabItemFlags_None = 0,
    ImGuiTabItemFlags_UnsavedDocument = 1,
    ImGuiTabItemFlags_SetSelected = 2,
    ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 4,
    ImGuiTabItemFlags_NoPushId = 8,
    ImGuiTabItemFlags_NoTooltip = 16,
    ImGuiTabItemFlags_NoReorder = 32,
    ImGuiTabItemFlags_Leading = 64,
    ImGuiTabItemFlags_Trailing = 128,
    ImGuiTabItemFlags_NoAssumedClosure = 256);
  PImGuiTabItemFlags_ = ^ImGuiTabItemFlags_;

  ImGuiFocusedFlags_ = (
    ImGuiFocusedFlags_None = 0,
    ImGuiFocusedFlags_ChildWindows = 1,
    ImGuiFocusedFlags_RootWindow = 2,
    ImGuiFocusedFlags_AnyWindow = 4,
    ImGuiFocusedFlags_NoPopupHierarchy = 8,
    ImGuiFocusedFlags_DockHierarchy = 16,
    ImGuiFocusedFlags_RootAndChildWindows = 3);
  PImGuiFocusedFlags_ = ^ImGuiFocusedFlags_;

  ImGuiHoveredFlags_ = (
    ImGuiHoveredFlags_None = 0,
    ImGuiHoveredFlags_ChildWindows = 1,
    ImGuiHoveredFlags_RootWindow = 2,
    ImGuiHoveredFlags_AnyWindow = 4,
    ImGuiHoveredFlags_NoPopupHierarchy = 8,
    ImGuiHoveredFlags_DockHierarchy = 16,
    ImGuiHoveredFlags_AllowWhenBlockedByPopup = 32,
    ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 128,
    ImGuiHoveredFlags_AllowWhenOverlappedByItem = 256,
    ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 512,
    ImGuiHoveredFlags_AllowWhenDisabled = 1024,
    ImGuiHoveredFlags_NoNavOverride = 2048,
    ImGuiHoveredFlags_AllowWhenOverlapped = 768,
    ImGuiHoveredFlags_RectOnly = 928,
    ImGuiHoveredFlags_RootAndChildWindows = 3,
    ImGuiHoveredFlags_ForTooltip = 4096,
    ImGuiHoveredFlags_Stationary = 8192,
    ImGuiHoveredFlags_DelayNone = 16384,
    ImGuiHoveredFlags_DelayShort = 32768,
    ImGuiHoveredFlags_DelayNormal = 65536,
    ImGuiHoveredFlags_NoSharedDelay = 131072);
  PImGuiHoveredFlags_ = ^ImGuiHoveredFlags_;

  ImGuiDockNodeFlags_ = (
    ImGuiDockNodeFlags_None = 0,
    ImGuiDockNodeFlags_KeepAliveOnly = 1,
    ImGuiDockNodeFlags_NoDockingOverCentralNode = 4,
    ImGuiDockNodeFlags_PassthruCentralNode = 8,
    ImGuiDockNodeFlags_NoDockingSplit = 16,
    ImGuiDockNodeFlags_NoResize = 32,
    ImGuiDockNodeFlags_AutoHideTabBar = 64,
    ImGuiDockNodeFlags_NoUndocking = 128);
  PImGuiDockNodeFlags_ = ^ImGuiDockNodeFlags_;

  ImGuiDragDropFlags_ = (
    ImGuiDragDropFlags_None = 0,
    ImGuiDragDropFlags_SourceNoPreviewTooltip = 1,
    ImGuiDragDropFlags_SourceNoDisableHover = 2,
    ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 4,
    ImGuiDragDropFlags_SourceAllowNullID = 8,
    ImGuiDragDropFlags_SourceExtern = 16,
    ImGuiDragDropFlags_SourceAutoExpirePayload = 32,
    ImGuiDragDropFlags_AcceptBeforeDelivery = 1024,
    ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 2048,
    ImGuiDragDropFlags_AcceptNoPreviewTooltip = 4096,
    ImGuiDragDropFlags_AcceptPeekOnly = 3072);
  PImGuiDragDropFlags_ = ^ImGuiDragDropFlags_;

  ImGuiDataType_ = (
    ImGuiDataType_S8 = 0,
    ImGuiDataType_U8 = 1,
    ImGuiDataType_S16 = 2,
    ImGuiDataType_U16 = 3,
    ImGuiDataType_S32 = 4,
    ImGuiDataType_U32 = 5,
    ImGuiDataType_S64 = 6,
    ImGuiDataType_U64 = 7,
    ImGuiDataType_Float = 8,
    ImGuiDataType_Double = 9,
    ImGuiDataType_COUNT = 10);
  PImGuiDataType_ = ^ImGuiDataType_;

  ImGuiDir_ = (
    ImGuiDir_None = -1,
    ImGuiDir_Left = 0,
    ImGuiDir_Right = 1,
    ImGuiDir_Up = 2,
    ImGuiDir_Down = 3,
    ImGuiDir_COUNT = 4);
  PImGuiDir_ = ^ImGuiDir_;

  ImGuiSortDirection_ = (
    ImGuiSortDirection_None = 0,
    ImGuiSortDirection_Ascending = 1,
    ImGuiSortDirection_Descending = 2);
  PImGuiSortDirection_ = ^ImGuiSortDirection_;

  ImGuiKey = (
    ImGuiKey_None = 0,
    ImGuiKey_Tab = 512,
    ImGuiKey_LeftArrow = 513,
    ImGuiKey_RightArrow = 514,
    ImGuiKey_UpArrow = 515,
    ImGuiKey_DownArrow = 516,
    ImGuiKey_PageUp = 517,
    ImGuiKey_PageDown = 518,
    ImGuiKey_Home = 519,
    ImGuiKey_End = 520,
    ImGuiKey_Insert = 521,
    ImGuiKey_Delete = 522,
    ImGuiKey_Backspace = 523,
    ImGuiKey_Space = 524,
    ImGuiKey_Enter = 525,
    ImGuiKey_Escape = 526,
    ImGuiKey_LeftCtrl = 527,
    ImGuiKey_LeftShift = 528,
    ImGuiKey_LeftAlt = 529,
    ImGuiKey_LeftSuper = 530,
    ImGuiKey_RightCtrl = 531,
    ImGuiKey_RightShift = 532,
    ImGuiKey_RightAlt = 533,
    ImGuiKey_RightSuper = 534,
    ImGuiKey_Menu = 535,
    ImGuiKey_0 = 536,
    ImGuiKey_1 = 537,
    ImGuiKey_2 = 538,
    ImGuiKey_3 = 539,
    ImGuiKey_4 = 540,
    ImGuiKey_5 = 541,
    ImGuiKey_6 = 542,
    ImGuiKey_7 = 543,
    ImGuiKey_8 = 544,
    ImGuiKey_9 = 545,
    ImGuiKey_A = 546,
    ImGuiKey_B = 547,
    ImGuiKey_C = 548,
    ImGuiKey_D = 549,
    ImGuiKey_E = 550,
    ImGuiKey_F = 551,
    ImGuiKey_G = 552,
    ImGuiKey_H = 553,
    ImGuiKey_I = 554,
    ImGuiKey_J = 555,
    ImGuiKey_K = 556,
    ImGuiKey_L = 557,
    ImGuiKey_M = 558,
    ImGuiKey_N = 559,
    ImGuiKey_O = 560,
    ImGuiKey_P = 561,
    ImGuiKey_Q = 562,
    ImGuiKey_R = 563,
    ImGuiKey_S = 564,
    ImGuiKey_T = 565,
    ImGuiKey_U = 566,
    ImGuiKey_V = 567,
    ImGuiKey_W = 568,
    ImGuiKey_X = 569,
    ImGuiKey_Y = 570,
    ImGuiKey_Z = 571,
    ImGuiKey_F1 = 572,
    ImGuiKey_F2 = 573,
    ImGuiKey_F3 = 574,
    ImGuiKey_F4 = 575,
    ImGuiKey_F5 = 576,
    ImGuiKey_F6 = 577,
    ImGuiKey_F7 = 578,
    ImGuiKey_F8 = 579,
    ImGuiKey_F9 = 580,
    ImGuiKey_F10 = 581,
    ImGuiKey_F11 = 582,
    ImGuiKey_F12 = 583,
    ImGuiKey_F13 = 584,
    ImGuiKey_F14 = 585,
    ImGuiKey_F15 = 586,
    ImGuiKey_F16 = 587,
    ImGuiKey_F17 = 588,
    ImGuiKey_F18 = 589,
    ImGuiKey_F19 = 590,
    ImGuiKey_F20 = 591,
    ImGuiKey_F21 = 592,
    ImGuiKey_F22 = 593,
    ImGuiKey_F23 = 594,
    ImGuiKey_F24 = 595,
    ImGuiKey_Apostrophe = 596,
    ImGuiKey_Comma = 597,
    ImGuiKey_Minus = 598,
    ImGuiKey_Period = 599,
    ImGuiKey_Slash = 600,
    ImGuiKey_Semicolon = 601,
    ImGuiKey_Equal = 602,
    ImGuiKey_LeftBracket = 603,
    ImGuiKey_Backslash = 604,
    ImGuiKey_RightBracket = 605,
    ImGuiKey_GraveAccent = 606,
    ImGuiKey_CapsLock = 607,
    ImGuiKey_ScrollLock = 608,
    ImGuiKey_NumLock = 609,
    ImGuiKey_PrintScreen = 610,
    ImGuiKey_Pause = 611,
    ImGuiKey_Keypad0 = 612,
    ImGuiKey_Keypad1 = 613,
    ImGuiKey_Keypad2 = 614,
    ImGuiKey_Keypad3 = 615,
    ImGuiKey_Keypad4 = 616,
    ImGuiKey_Keypad5 = 617,
    ImGuiKey_Keypad6 = 618,
    ImGuiKey_Keypad7 = 619,
    ImGuiKey_Keypad8 = 620,
    ImGuiKey_Keypad9 = 621,
    ImGuiKey_KeypadDecimal = 622,
    ImGuiKey_KeypadDivide = 623,
    ImGuiKey_KeypadMultiply = 624,
    ImGuiKey_KeypadSubtract = 625,
    ImGuiKey_KeypadAdd = 626,
    ImGuiKey_KeypadEnter = 627,
    ImGuiKey_KeypadEqual = 628,
    ImGuiKey_AppBack = 629,
    ImGuiKey_AppForward = 630,
    ImGuiKey_GamepadStart = 631,
    ImGuiKey_GamepadBack = 632,
    ImGuiKey_GamepadFaceLeft = 633,
    ImGuiKey_GamepadFaceRight = 634,
    ImGuiKey_GamepadFaceUp = 635,
    ImGuiKey_GamepadFaceDown = 636,
    ImGuiKey_GamepadDpadLeft = 637,
    ImGuiKey_GamepadDpadRight = 638,
    ImGuiKey_GamepadDpadUp = 639,
    ImGuiKey_GamepadDpadDown = 640,
    ImGuiKey_GamepadL1 = 641,
    ImGuiKey_GamepadR1 = 642,
    ImGuiKey_GamepadL2 = 643,
    ImGuiKey_GamepadR2 = 644,
    ImGuiKey_GamepadL3 = 645,
    ImGuiKey_GamepadR3 = 646,
    ImGuiKey_GamepadLStickLeft = 647,
    ImGuiKey_GamepadLStickRight = 648,
    ImGuiKey_GamepadLStickUp = 649,
    ImGuiKey_GamepadLStickDown = 650,
    ImGuiKey_GamepadRStickLeft = 651,
    ImGuiKey_GamepadRStickRight = 652,
    ImGuiKey_GamepadRStickUp = 653,
    ImGuiKey_GamepadRStickDown = 654,
    ImGuiKey_MouseLeft = 655,
    ImGuiKey_MouseRight = 656,
    ImGuiKey_MouseMiddle = 657,
    ImGuiKey_MouseX1 = 658,
    ImGuiKey_MouseX2 = 659,
    ImGuiKey_MouseWheelX = 660,
    ImGuiKey_MouseWheelY = 661,
    ImGuiKey_ReservedForModCtrl = 662,
    ImGuiKey_ReservedForModShift = 663,
    ImGuiKey_ReservedForModAlt = 664,
    ImGuiKey_ReservedForModSuper = 665,
    ImGuiKey_COUNT = 666,
    ImGuiMod_None = 0,
    ImGuiMod_Ctrl = 4096,
    ImGuiMod_Shift = 8192,
    ImGuiMod_Alt = 16384,
    ImGuiMod_Super = 32768,
    ImGuiMod_Shortcut = 2048,
    ImGuiMod_Mask_ = 63488,
    ImGuiKey_NamedKey_BEGIN = 512,
    ImGuiKey_NamedKey_END = 666,
    ImGuiKey_NamedKey_COUNT = 154,
    ImGuiKey_KeysData_SIZE = 154,
    ImGuiKey_KeysData_OFFSET = 512);
  PImGuiKey = ^ImGuiKey;

  ImGuiConfigFlags_ = (
    ImGuiConfigFlags_None = 0,
    ImGuiConfigFlags_NavEnableKeyboard = 1,
    ImGuiConfigFlags_NavEnableGamepad = 2,
    ImGuiConfigFlags_NavEnableSetMousePos = 4,
    ImGuiConfigFlags_NavNoCaptureKeyboard = 8,
    ImGuiConfigFlags_NoMouse = 16,
    ImGuiConfigFlags_NoMouseCursorChange = 32,
    ImGuiConfigFlags_DockingEnable = 64,
    ImGuiConfigFlags_ViewportsEnable = 1024,
    ImGuiConfigFlags_DpiEnableScaleViewports = 16384,
    ImGuiConfigFlags_DpiEnableScaleFonts = 32768,
    ImGuiConfigFlags_IsSRGB = 1048576,
    ImGuiConfigFlags_IsTouchScreen = 2097152);
  PImGuiConfigFlags_ = ^ImGuiConfigFlags_;

  ImGuiBackendFlags_ = (
    ImGuiBackendFlags_None = 0,
    ImGuiBackendFlags_HasGamepad = 1,
    ImGuiBackendFlags_HasMouseCursors = 2,
    ImGuiBackendFlags_HasSetMousePos = 4,
    ImGuiBackendFlags_RendererHasVtxOffset = 8,
    ImGuiBackendFlags_PlatformHasViewports = 1024,
    ImGuiBackendFlags_HasMouseHoveredViewport = 2048,
    ImGuiBackendFlags_RendererHasViewports = 4096);
  PImGuiBackendFlags_ = ^ImGuiBackendFlags_;

  ImGuiCol_ = (
    ImGuiCol_Text = 0,
    ImGuiCol_TextDisabled = 1,
    ImGuiCol_WindowBg = 2,
    ImGuiCol_ChildBg = 3,
    ImGuiCol_PopupBg = 4,
    ImGuiCol_Border = 5,
    ImGuiCol_BorderShadow = 6,
    ImGuiCol_FrameBg = 7,
    ImGuiCol_FrameBgHovered = 8,
    ImGuiCol_FrameBgActive = 9,
    ImGuiCol_TitleBg = 10,
    ImGuiCol_TitleBgActive = 11,
    ImGuiCol_TitleBgCollapsed = 12,
    ImGuiCol_MenuBarBg = 13,
    ImGuiCol_ScrollbarBg = 14,
    ImGuiCol_ScrollbarGrab = 15,
    ImGuiCol_ScrollbarGrabHovered = 16,
    ImGuiCol_ScrollbarGrabActive = 17,
    ImGuiCol_CheckMark = 18,
    ImGuiCol_SliderGrab = 19,
    ImGuiCol_SliderGrabActive = 20,
    ImGuiCol_Button = 21,
    ImGuiCol_ButtonHovered = 22,
    ImGuiCol_ButtonActive = 23,
    ImGuiCol_Header = 24,
    ImGuiCol_HeaderHovered = 25,
    ImGuiCol_HeaderActive = 26,
    ImGuiCol_Separator = 27,
    ImGuiCol_SeparatorHovered = 28,
    ImGuiCol_SeparatorActive = 29,
    ImGuiCol_ResizeGrip = 30,
    ImGuiCol_ResizeGripHovered = 31,
    ImGuiCol_ResizeGripActive = 32,
    ImGuiCol_Tab = 33,
    ImGuiCol_TabHovered = 34,
    ImGuiCol_TabActive = 35,
    ImGuiCol_TabUnfocused = 36,
    ImGuiCol_TabUnfocusedActive = 37,
    ImGuiCol_DockingPreview = 38,
    ImGuiCol_DockingEmptyBg = 39,
    ImGuiCol_PlotLines = 40,
    ImGuiCol_PlotLinesHovered = 41,
    ImGuiCol_PlotHistogram = 42,
    ImGuiCol_PlotHistogramHovered = 43,
    ImGuiCol_TableHeaderBg = 44,
    ImGuiCol_TableBorderStrong = 45,
    ImGuiCol_TableBorderLight = 46,
    ImGuiCol_TableRowBg = 47,
    ImGuiCol_TableRowBgAlt = 48,
    ImGuiCol_TextSelectedBg = 49,
    ImGuiCol_DragDropTarget = 50,
    ImGuiCol_NavHighlight = 51,
    ImGuiCol_NavWindowingHighlight = 52,
    ImGuiCol_NavWindowingDimBg = 53,
    ImGuiCol_ModalWindowDimBg = 54,
    ImGuiCol_COUNT = 55);
  PImGuiCol_ = ^ImGuiCol_;

  ImGuiStyleVar_ = (
    ImGuiStyleVar_Alpha = 0,
    ImGuiStyleVar_DisabledAlpha = 1,
    ImGuiStyleVar_WindowPadding = 2,
    ImGuiStyleVar_WindowRounding = 3,
    ImGuiStyleVar_WindowBorderSize = 4,
    ImGuiStyleVar_WindowMinSize = 5,
    ImGuiStyleVar_WindowTitleAlign = 6,
    ImGuiStyleVar_ChildRounding = 7,
    ImGuiStyleVar_ChildBorderSize = 8,
    ImGuiStyleVar_PopupRounding = 9,
    ImGuiStyleVar_PopupBorderSize = 10,
    ImGuiStyleVar_FramePadding = 11,
    ImGuiStyleVar_FrameRounding = 12,
    ImGuiStyleVar_FrameBorderSize = 13,
    ImGuiStyleVar_ItemSpacing = 14,
    ImGuiStyleVar_ItemInnerSpacing = 15,
    ImGuiStyleVar_IndentSpacing = 16,
    ImGuiStyleVar_CellPadding = 17,
    ImGuiStyleVar_ScrollbarSize = 18,
    ImGuiStyleVar_ScrollbarRounding = 19,
    ImGuiStyleVar_GrabMinSize = 20,
    ImGuiStyleVar_GrabRounding = 21,
    ImGuiStyleVar_TabRounding = 22,
    ImGuiStyleVar_TabBarBorderSize = 23,
    ImGuiStyleVar_ButtonTextAlign = 24,
    ImGuiStyleVar_SelectableTextAlign = 25,
    ImGuiStyleVar_SeparatorTextBorderSize = 26,
    ImGuiStyleVar_SeparatorTextAlign = 27,
    ImGuiStyleVar_SeparatorTextPadding = 28,
    ImGuiStyleVar_DockingSeparatorSize = 29,
    ImGuiStyleVar_COUNT = 30);
  PImGuiStyleVar_ = ^ImGuiStyleVar_;

  ImGuiButtonFlags_ = (
    ImGuiButtonFlags_None = 0,
    ImGuiButtonFlags_MouseButtonLeft = 1,
    ImGuiButtonFlags_MouseButtonRight = 2,
    ImGuiButtonFlags_MouseButtonMiddle = 4,
    ImGuiButtonFlags_MouseButtonMask_ = 7,
    ImGuiButtonFlags_MouseButtonDefault_ = 1);
  PImGuiButtonFlags_ = ^ImGuiButtonFlags_;

  ImGuiColorEditFlags_ = (
    ImGuiColorEditFlags_None = 0,
    ImGuiColorEditFlags_NoAlpha = 2,
    ImGuiColorEditFlags_NoPicker = 4,
    ImGuiColorEditFlags_NoOptions = 8,
    ImGuiColorEditFlags_NoSmallPreview = 16,
    ImGuiColorEditFlags_NoInputs = 32,
    ImGuiColorEditFlags_NoTooltip = 64,
    ImGuiColorEditFlags_NoLabel = 128,
    ImGuiColorEditFlags_NoSidePreview = 256,
    ImGuiColorEditFlags_NoDragDrop = 512,
    ImGuiColorEditFlags_NoBorder = 1024,
    ImGuiColorEditFlags_AlphaBar = 65536,
    ImGuiColorEditFlags_AlphaPreview = 131072,
    ImGuiColorEditFlags_AlphaPreviewHalf = 262144,
    ImGuiColorEditFlags_HDR = 524288,
    ImGuiColorEditFlags_DisplayRGB = 1048576,
    ImGuiColorEditFlags_DisplayHSV = 2097152,
    ImGuiColorEditFlags_DisplayHex = 4194304,
    ImGuiColorEditFlags_Uint8 = 8388608,
    ImGuiColorEditFlags_Float = 16777216,
    ImGuiColorEditFlags_PickerHueBar = 33554432,
    ImGuiColorEditFlags_PickerHueWheel = 67108864,
    ImGuiColorEditFlags_InputRGB = 134217728,
    ImGuiColorEditFlags_InputHSV = 268435456,
    ImGuiColorEditFlags_DefaultOptions_ = 177209344,
    ImGuiColorEditFlags_DisplayMask_ = 7340032,
    ImGuiColorEditFlags_DataTypeMask_ = 25165824,
    ImGuiColorEditFlags_PickerMask_ = 100663296,
    ImGuiColorEditFlags_InputMask_ = 402653184);
  PImGuiColorEditFlags_ = ^ImGuiColorEditFlags_;

  ImGuiSliderFlags_ = (
    ImGuiSliderFlags_None = 0,
    ImGuiSliderFlags_AlwaysClamp = 16,
    ImGuiSliderFlags_Logarithmic = 32,
    ImGuiSliderFlags_NoRoundToFormat = 64,
    ImGuiSliderFlags_NoInput = 128,
    ImGuiSliderFlags_InvalidMask_ = 1879048207);
  PImGuiSliderFlags_ = ^ImGuiSliderFlags_;

  ImGuiMouseButton_ = (
    ImGuiMouseButton_Left = 0,
    ImGuiMouseButton_Right = 1,
    ImGuiMouseButton_Middle = 2,
    ImGuiMouseButton_COUNT = 5);
  PImGuiMouseButton_ = ^ImGuiMouseButton_;

  ImGuiMouseCursor_ = (
    ImGuiMouseCursor_None = -1,
    ImGuiMouseCursor_Arrow = 0,
    ImGuiMouseCursor_TextInput = 1,
    ImGuiMouseCursor_ResizeAll = 2,
    ImGuiMouseCursor_ResizeNS = 3,
    ImGuiMouseCursor_ResizeEW = 4,
    ImGuiMouseCursor_ResizeNESW = 5,
    ImGuiMouseCursor_ResizeNWSE = 6,
    ImGuiMouseCursor_Hand = 7,
    ImGuiMouseCursor_NotAllowed = 8,
    ImGuiMouseCursor_COUNT = 9);
  PImGuiMouseCursor_ = ^ImGuiMouseCursor_;

  ImGuiMouseSource = (
    ImGuiMouseSource_Mouse = 0,
    ImGuiMouseSource_TouchScreen = 1,
    ImGuiMouseSource_Pen = 2,
    ImGuiMouseSource_COUNT = 3);
  PImGuiMouseSource = ^ImGuiMouseSource;

  ImGuiCond_ = (
    ImGuiCond_None = 0,
    ImGuiCond_Always = 1,
    ImGuiCond_Once = 2,
    ImGuiCond_FirstUseEver = 4,
    ImGuiCond_Appearing = 8);
  PImGuiCond_ = ^ImGuiCond_;

  ImGuiTableFlags_ = (
    ImGuiTableFlags_None = 0,
    ImGuiTableFlags_Resizable = 1,
    ImGuiTableFlags_Reorderable = 2,
    ImGuiTableFlags_Hideable = 4,
    ImGuiTableFlags_Sortable = 8,
    ImGuiTableFlags_NoSavedSettings = 16,
    ImGuiTableFlags_ContextMenuInBody = 32,
    ImGuiTableFlags_RowBg = 64,
    ImGuiTableFlags_BordersInnerH = 128,
    ImGuiTableFlags_BordersOuterH = 256,
    ImGuiTableFlags_BordersInnerV = 512,
    ImGuiTableFlags_BordersOuterV = 1024,
    ImGuiTableFlags_BordersH = 384,
    ImGuiTableFlags_BordersV = 1536,
    ImGuiTableFlags_BordersInner = 640,
    ImGuiTableFlags_BordersOuter = 1280,
    ImGuiTableFlags_Borders = 1920,
    ImGuiTableFlags_NoBordersInBody = 2048,
    ImGuiTableFlags_NoBordersInBodyUntilResize = 4096,
    ImGuiTableFlags_SizingFixedFit = 8192,
    ImGuiTableFlags_SizingFixedSame = 16384,
    ImGuiTableFlags_SizingStretchProp = 24576,
    ImGuiTableFlags_SizingStretchSame = 32768,
    ImGuiTableFlags_NoHostExtendX = 65536,
    ImGuiTableFlags_NoHostExtendY = 131072,
    ImGuiTableFlags_NoKeepColumnsVisible = 262144,
    ImGuiTableFlags_PreciseWidths = 524288,
    ImGuiTableFlags_NoClip = 1048576,
    ImGuiTableFlags_PadOuterX = 2097152,
    ImGuiTableFlags_NoPadOuterX = 4194304,
    ImGuiTableFlags_NoPadInnerX = 8388608,
    ImGuiTableFlags_ScrollX = 16777216,
    ImGuiTableFlags_ScrollY = 33554432,
    ImGuiTableFlags_SortMulti = 67108864,
    ImGuiTableFlags_SortTristate = 134217728,
    ImGuiTableFlags_HighlightHoveredColumn = 268435456,
    ImGuiTableFlags_SizingMask_ = 57344);
  PImGuiTableFlags_ = ^ImGuiTableFlags_;

  ImGuiTableColumnFlags_ = (
    ImGuiTableColumnFlags_None = 0,
    ImGuiTableColumnFlags_Disabled = 1,
    ImGuiTableColumnFlags_DefaultHide = 2,
    ImGuiTableColumnFlags_DefaultSort = 4,
    ImGuiTableColumnFlags_WidthStretch = 8,
    ImGuiTableColumnFlags_WidthFixed = 16,
    ImGuiTableColumnFlags_NoResize = 32,
    ImGuiTableColumnFlags_NoReorder = 64,
    ImGuiTableColumnFlags_NoHide = 128,
    ImGuiTableColumnFlags_NoClip = 256,
    ImGuiTableColumnFlags_NoSort = 512,
    ImGuiTableColumnFlags_NoSortAscending = 1024,
    ImGuiTableColumnFlags_NoSortDescending = 2048,
    ImGuiTableColumnFlags_NoHeaderLabel = 4096,
    ImGuiTableColumnFlags_NoHeaderWidth = 8192,
    ImGuiTableColumnFlags_PreferSortAscending = 16384,
    ImGuiTableColumnFlags_PreferSortDescending = 32768,
    ImGuiTableColumnFlags_IndentEnable = 65536,
    ImGuiTableColumnFlags_IndentDisable = 131072,
    ImGuiTableColumnFlags_AngledHeader = 262144,
    ImGuiTableColumnFlags_IsEnabled = 16777216,
    ImGuiTableColumnFlags_IsVisible = 33554432,
    ImGuiTableColumnFlags_IsSorted = 67108864,
    ImGuiTableColumnFlags_IsHovered = 134217728,
    ImGuiTableColumnFlags_WidthMask_ = 24,
    ImGuiTableColumnFlags_IndentMask_ = 196608,
    ImGuiTableColumnFlags_StatusMask_ = 251658240,
    ImGuiTableColumnFlags_NoDirectResize_ = 1073741824);
  PImGuiTableColumnFlags_ = ^ImGuiTableColumnFlags_;

  ImGuiTableRowFlags_ = (
    ImGuiTableRowFlags_None = 0,
    ImGuiTableRowFlags_Headers = 1);
  PImGuiTableRowFlags_ = ^ImGuiTableRowFlags_;

  ImGuiTableBgTarget_ = (
    ImGuiTableBgTarget_None = 0,
    ImGuiTableBgTarget_RowBg0 = 1,
    ImGuiTableBgTarget_RowBg1 = 2,
    ImGuiTableBgTarget_CellBg = 3);
  PImGuiTableBgTarget_ = ^ImGuiTableBgTarget_;

  ImGuiTableSortSpecs = record
    Specs: PImGuiTableColumnSortSpecs;
    SpecsCount: Integer;
    SpecsDirty: Boolean;
  end;

  ImGuiTableColumnSortSpecs = record
    ColumnUserID: ImGuiID;
    ColumnIndex: ImS16;
    SortOrder: ImS16;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SortDirection: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
  end;

  ImGuiStyle = record
    Alpha: Single;
    DisabledAlpha: Single;
    WindowPadding: ImVec2;
    WindowRounding: Single;
    WindowBorderSize: Single;
    WindowMinSize: ImVec2;
    WindowTitleAlign: ImVec2;
    WindowMenuButtonPosition: ImGuiDir;
    ChildRounding: Single;
    ChildBorderSize: Single;
    PopupRounding: Single;
    PopupBorderSize: Single;
    FramePadding: ImVec2;
    FrameRounding: Single;
    FrameBorderSize: Single;
    ItemSpacing: ImVec2;
    ItemInnerSpacing: ImVec2;
    CellPadding: ImVec2;
    TouchExtraPadding: ImVec2;
    IndentSpacing: Single;
    ColumnsMinSpacing: Single;
    ScrollbarSize: Single;
    ScrollbarRounding: Single;
    GrabMinSize: Single;
    GrabRounding: Single;
    LogSliderDeadzone: Single;
    TabRounding: Single;
    TabBorderSize: Single;
    TabMinWidthForCloseButton: Single;
    TabBarBorderSize: Single;
    TableAngledHeadersAngle: Single;
    ColorButtonPosition: ImGuiDir;
    ButtonTextAlign: ImVec2;
    SelectableTextAlign: ImVec2;
    SeparatorTextBorderSize: Single;
    SeparatorTextAlign: ImVec2;
    SeparatorTextPadding: ImVec2;
    DisplayWindowPadding: ImVec2;
    DisplaySafeAreaPadding: ImVec2;
    DockingSeparatorSize: Single;
    MouseCursorScale: Single;
    AntiAliasedLines: Boolean;
    AntiAliasedLinesUseTex: Boolean;
    AntiAliasedFill: Boolean;
    CurveTessellationTol: Single;
    CircleTessellationMaxError: Single;
    Colors: array [0..54] of ImVec4;
    HoverStationaryDelay: Single;
    HoverDelayShort: Single;
    HoverDelayNormal: Single;
    HoverFlagsForTooltipMouse: ImGuiHoveredFlags;
    HoverFlagsForTooltipNav: ImGuiHoveredFlags;
  end;

  ImGuiKeyData = record
    Down: Boolean;
    DownDuration: Single;
    DownDurationPrev: Single;
    AnalogValue: Single;
  end;

  ImVector_ImWchar = record
    Size: Integer;
    Capacity: Integer;
    Data: PImWchar;
  end;

  ImGuiIO = record
    ConfigFlags: ImGuiConfigFlags;
    BackendFlags: ImGuiBackendFlags;
    DisplaySize: ImVec2;
    DeltaTime: Single;
    IniSavingRate: Single;
    IniFilename: PUTF8Char;
    LogFilename: PUTF8Char;
    UserData: Pointer;
    Fonts: PImFontAtlas;
    FontGlobalScale: Single;
    FontAllowUserScaling: Boolean;
    FontDefault: PImFont;
    DisplayFramebufferScale: ImVec2;
    ConfigDockingNoSplit: Boolean;
    ConfigDockingWithShift: Boolean;
    ConfigDockingAlwaysTabBar: Boolean;
    ConfigDockingTransparentPayload: Boolean;
    ConfigViewportsNoAutoMerge: Boolean;
    ConfigViewportsNoTaskBarIcon: Boolean;
    ConfigViewportsNoDecoration: Boolean;
    ConfigViewportsNoDefaultParent: Boolean;
    MouseDrawCursor: Boolean;
    ConfigMacOSXBehaviors: Boolean;
    ConfigInputTrickleEventQueue: Boolean;
    ConfigInputTextCursorBlink: Boolean;
    ConfigInputTextEnterKeepActive: Boolean;
    ConfigDragClickToInputText: Boolean;
    ConfigWindowsResizeFromEdges: Boolean;
    ConfigWindowsMoveFromTitleBarOnly: Boolean;
    ConfigMemoryCompactTimer: Single;
    MouseDoubleClickTime: Single;
    MouseDoubleClickMaxDist: Single;
    MouseDragThreshold: Single;
    KeyRepeatDelay: Single;
    KeyRepeatRate: Single;
    ConfigDebugIsDebuggerPresent: Boolean;
    ConfigDebugBeginReturnValueOnce: Boolean;
    ConfigDebugBeginReturnValueLoop: Boolean;
    ConfigDebugIgnoreFocusLoss: Boolean;
    ConfigDebugIniSettings: Boolean;
    BackendPlatformName: PUTF8Char;
    BackendRendererName: PUTF8Char;
    BackendPlatformUserData: Pointer;
    BackendRendererUserData: Pointer;
    BackendLanguageUserData: Pointer;
    GetClipboardTextFn: function(user_data: Pointer): PUTF8Char; cdecl;
    SetClipboardTextFn: procedure(user_data: Pointer; const text: PUTF8Char); cdecl;
    ClipboardUserData: Pointer;
    SetPlatformImeDataFn: procedure(viewport: PImGuiViewport; data: PImGuiPlatformImeData); cdecl;
    PlatformLocaleDecimalPoint: ImWchar;
    WantCaptureMouse: Boolean;
    WantCaptureKeyboard: Boolean;
    WantTextInput: Boolean;
    WantSetMousePos: Boolean;
    WantSaveIniSettings: Boolean;
    NavActive: Boolean;
    NavVisible: Boolean;
    Framerate: Single;
    MetricsRenderVertices: Integer;
    MetricsRenderIndices: Integer;
    MetricsRenderWindows: Integer;
    MetricsActiveWindows: Integer;
    MouseDelta: ImVec2;
    _UnusedPadding: Pointer;
    Ctx: PImGuiContext;
    MousePos: ImVec2;
    MouseDown: array [0..4] of Boolean;
    MouseWheel: Single;
    MouseWheelH: Single;
    MouseSource: ImGuiMouseSource;
    MouseHoveredViewport: ImGuiID;
    KeyCtrl: Boolean;
    KeyShift: Boolean;
    KeyAlt: Boolean;
    KeySuper: Boolean;
    KeyMods: ImGuiKeyChord;
    KeysData: array [0..153] of ImGuiKeyData;
    WantCaptureMouseUnlessPopupClose: Boolean;
    MousePosPrev: ImVec2;
    MouseClickedPos: array [0..4] of ImVec2;
    MouseClickedTime: array [0..4] of Double;
    MouseClicked: array [0..4] of Boolean;
    MouseDoubleClicked: array [0..4] of Boolean;
    MouseClickedCount: array [0..4] of ImU16;
    MouseClickedLastCount: array [0..4] of ImU16;
    MouseReleased: array [0..4] of Boolean;
    MouseDownOwned: array [0..4] of Boolean;
    MouseDownOwnedUnlessPopupClose: array [0..4] of Boolean;
    MouseWheelRequestAxisSwap: Boolean;
    MouseDownDuration: array [0..4] of Single;
    MouseDownDurationPrev: array [0..4] of Single;
    MouseDragMaxDistanceAbs: array [0..4] of ImVec2;
    MouseDragMaxDistanceSqr: array [0..4] of Single;
    PenPressure: Single;
    AppFocusLost: Boolean;
    AppAcceptingEvents: Boolean;
    BackendUsingLegacyKeyArrays: ImS8;
    BackendUsingLegacyNavInputArray: Boolean;
    InputQueueSurrogate: ImWchar16;
    InputQueueCharacters: ImVector_ImWchar;
  end;

  ImGuiInputTextCallbackData = record
    Ctx: PImGuiContext;
    EventFlag: ImGuiInputTextFlags;
    Flags: ImGuiInputTextFlags;
    UserData: Pointer;
    EventChar: ImWchar;
    EventKey: ImGuiKey;
    Buf: PUTF8Char;
    BufTextLen: Integer;
    BufSize: Integer;
    BufDirty: Boolean;
    CursorPos: Integer;
    SelectionStart: Integer;
    SelectionEnd: Integer;
  end;

  ImGuiSizeCallbackData = record
    UserData: Pointer;
    Pos: ImVec2;
    CurrentSize: ImVec2;
    DesiredSize: ImVec2;
  end;

  ImGuiWindowClass = record
    ClassId: ImGuiID;
    ParentViewportId: ImGuiID;
    ViewportFlagsOverrideSet: ImGuiViewportFlags;
    ViewportFlagsOverrideClear: ImGuiViewportFlags;
    TabItemFlagsOverrideSet: ImGuiTabItemFlags;
    DockNodeFlagsOverrideSet: ImGuiDockNodeFlags;
    DockingAlwaysTabBar: Boolean;
    DockingAllowUnclassed: Boolean;
  end;

  ImGuiPayload = record
    Data: Pointer;
    DataSize: Integer;
    SourceId: ImGuiID;
    SourceParentId: ImGuiID;
    DataFrameCount: Integer;
    DataType: array [0..32] of UTF8Char;
    Preview: Boolean;
    Delivery: Boolean;
  end;

  ImGuiOnceUponAFrame = record
    RefFrame: Integer;
  end;

  ImGuiTextRange = record
    b: PUTF8Char;
    e: PUTF8Char;
  end;

  ImVector_ImGuiTextRange = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTextRange;
  end;

  ImGuiTextFilter = record
    InputBuf: array [0..255] of UTF8Char;
    Filters: ImVector_ImGuiTextRange;
    CountGrep: Integer;
  end;

  ImVector_char = record
    Size: Integer;
    Capacity: Integer;
    Data: PUTF8Char;
  end;

  ImGuiTextBuffer = record
    Buf: ImVector_char;
  end;

  P_anonymous_type_2 = ^_anonymous_type_2;
  _anonymous_type_2 = record
    case Integer of
      0: (val_i: Integer);
      1: (val_f: Single);
      2: (val_p: Pointer);
  end;

  ImGuiStoragePair = record
    key: ImGuiID;
    f2: _anonymous_type_2;
  end;

  ImVector_ImGuiStoragePair = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStoragePair;
  end;

  ImGuiStorage = record
    Data: ImVector_ImGuiStoragePair;
  end;

  ImGuiListClipper = record
    Ctx: PImGuiContext;
    DisplayStart: Integer;
    DisplayEnd: Integer;
    ItemsCount: Integer;
    ItemsHeight: Single;
    StartPosY: Single;
    TempData: Pointer;
  end;

  ImColor = record
    Value: ImVec4;
  end;

  ImDrawCallback = procedure(const parent_list: PImDrawList; const cmd: PImDrawCmd); cdecl;

  ImDrawCmd = record
    ClipRect: ImVec4;
    TextureId: ImTextureID;
    VtxOffset: Cardinal;
    IdxOffset: Cardinal;
    ElemCount: Cardinal;
    UserCallback: ImDrawCallback;
    UserCallbackData: Pointer;
  end;

  ImDrawVert = record
    pos: ImVec2;
    uv: ImVec2;
    col: ImU32;
  end;

  ImDrawCmdHeader = record
    ClipRect: ImVec4;
    TextureId: ImTextureID;
    VtxOffset: Cardinal;
  end;

  ImVector_ImDrawCmd = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawCmd;
  end;

  ImVector_ImDrawIdx = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawIdx;
  end;

  ImDrawChannel = record
    _CmdBuffer: ImVector_ImDrawCmd;
    _IdxBuffer: ImVector_ImDrawIdx;
  end;

  ImVector_ImDrawChannel = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawChannel;
  end;

  ImDrawListSplitter = record
    _Current: Integer;
    _Count: Integer;
    _Channels: ImVector_ImDrawChannel;
  end;

  ImDrawFlags_ = (
    ImDrawFlags_None = 0,
    ImDrawFlags_Closed = 1,
    ImDrawFlags_RoundCornersTopLeft = 16,
    ImDrawFlags_RoundCornersTopRight = 32,
    ImDrawFlags_RoundCornersBottomLeft = 64,
    ImDrawFlags_RoundCornersBottomRight = 128,
    ImDrawFlags_RoundCornersNone = 256,
    ImDrawFlags_RoundCornersTop = 48,
    ImDrawFlags_RoundCornersBottom = 192,
    ImDrawFlags_RoundCornersLeft = 80,
    ImDrawFlags_RoundCornersRight = 160,
    ImDrawFlags_RoundCornersAll = 240,
    ImDrawFlags_RoundCornersDefault_ = 240,
    ImDrawFlags_RoundCornersMask_ = 496);
  PImDrawFlags_ = ^ImDrawFlags_;

  ImDrawListFlags_ = (
    ImDrawListFlags_None = 0,
    ImDrawListFlags_AntiAliasedLines = 1,
    ImDrawListFlags_AntiAliasedLinesUseTex = 2,
    ImDrawListFlags_AntiAliasedFill = 4,
    ImDrawListFlags_AllowVtxOffset = 8);
  PImDrawListFlags_ = ^ImDrawListFlags_;

  ImVector_ImDrawVert = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawVert;
  end;

  ImVector_ImVec4 = record
    Size: Integer;
    Capacity: Integer;
    Data: PImVec4;
  end;

  ImVector_ImTextureID = record
    Size: Integer;
    Capacity: Integer;
    Data: PImTextureID;
  end;

  ImVector_ImVec2 = record
    Size: Integer;
    Capacity: Integer;
    Data: PImVec2;
  end;

  ImDrawList = record
    CmdBuffer: ImVector_ImDrawCmd;
    IdxBuffer: ImVector_ImDrawIdx;
    VtxBuffer: ImVector_ImDrawVert;
    Flags: ImDrawListFlags;
    _VtxCurrentIdx: Cardinal;
    _Data: PImDrawListSharedData;
    _OwnerName: PUTF8Char;
    _VtxWritePtr: PImDrawVert;
    _IdxWritePtr: PImDrawIdx;
    _ClipRectStack: ImVector_ImVec4;
    _TextureIdStack: ImVector_ImTextureID;
    _Path: ImVector_ImVec2;
    _CmdHeader: ImDrawCmdHeader;
    _Splitter: ImDrawListSplitter;
    _FringeScale: Single;
  end;

  ImVector_ImDrawListPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImDrawList;
  end;

  ImDrawData = record
    Valid: Boolean;
    CmdListsCount: Integer;
    TotalIdxCount: Integer;
    TotalVtxCount: Integer;
    CmdLists: ImVector_ImDrawListPtr;
    DisplayPos: ImVec2;
    DisplaySize: ImVec2;
    FramebufferScale: ImVec2;
    OwnerViewport: PImGuiViewport;
  end;

  ImFontConfig = record
    FontData: Pointer;
    FontDataSize: Integer;
    FontDataOwnedByAtlas: Boolean;
    FontNo: Integer;
    SizePixels: Single;
    OversampleH: Integer;
    OversampleV: Integer;
    PixelSnapH: Boolean;
    GlyphExtraSpacing: ImVec2;
    GlyphOffset: ImVec2;
    GlyphRanges: PImWchar;
    GlyphMinAdvanceX: Single;
    GlyphMaxAdvanceX: Single;
    MergeMode: Boolean;
    FontBuilderFlags: Cardinal;
    RasterizerMultiply: Single;
    RasterizerDensity: Single;
    EllipsisChar: ImWchar;
    Name: array [0..39] of UTF8Char;
    DstFont: PImFont;
  end;

  ImFontGlyph = record
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property Colored: Cardinal index $0001 read GetData0Value write SetData0Value; // 1 bits at offset 0 in Data0
    property Visible: Cardinal index $0101 read GetData0Value write SetData0Value; // 1 bits at offset 1 in Data0
    property Codepoint: Cardinal index $021E read GetData0Value write SetData0Value; // 30 bits at offset 2 in Data0
  var
    AdvanceX: Single;
    X0: Single;
    Y0: Single;
    X1: Single;
    Y1: Single;
    U0: Single;
    V0: Single;
    U1: Single;
    V1: Single;
  end;

  ImVector_ImU32 = record
    Size: Integer;
    Capacity: Integer;
    Data: PImU32;
  end;

  ImFontGlyphRangesBuilder = record
    UsedChars: ImVector_ImU32;
  end;

  ImFontAtlasCustomRect = record
    Width: Word;
    Height: Word;
    X: Word;
    Y: Word;
    GlyphID: Cardinal;
    GlyphAdvanceX: Single;
    GlyphOffset: ImVec2;
    Font: PImFont;
  end;

  ImFontAtlasFlags_ = (
    ImFontAtlasFlags_None = 0,
    ImFontAtlasFlags_NoPowerOfTwoHeight = 1,
    ImFontAtlasFlags_NoMouseCursors = 2,
    ImFontAtlasFlags_NoBakedLines = 4);
  PImFontAtlasFlags_ = ^ImFontAtlasFlags_;

  ImVector_ImFontPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImFont;
  end;

  ImVector_ImFontAtlasCustomRect = record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontAtlasCustomRect;
  end;

  ImVector_ImFontConfig = record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontConfig;
  end;

  ImFontAtlas = record
    Flags: ImFontAtlasFlags;
    TexID: ImTextureID;
    TexDesiredWidth: Integer;
    TexGlyphPadding: Integer;
    Locked: Boolean;
    UserData: Pointer;
    TexReady: Boolean;
    TexPixelsUseColors: Boolean;
    TexPixelsAlpha8: PByte;
    TexPixelsRGBA32: PCardinal;
    TexWidth: Integer;
    TexHeight: Integer;
    TexUvScale: ImVec2;
    TexUvWhitePixel: ImVec2;
    Fonts: ImVector_ImFontPtr;
    CustomRects: ImVector_ImFontAtlasCustomRect;
    ConfigData: ImVector_ImFontConfig;
    TexUvLines: array [0..63] of ImVec4;
    FontBuilderIO: PImFontBuilderIO;
    FontBuilderFlags: Cardinal;
    PackIdMouseCursors: Integer;
    PackIdLines: Integer;
  end;

  ImVector_float = record
    Size: Integer;
    Capacity: Integer;
    Data: PSingle;
  end;

  ImVector_ImFontGlyph = record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontGlyph;
  end;

  ImFont = record
    IndexAdvanceX: ImVector_float;
    FallbackAdvanceX: Single;
    FontSize: Single;
    IndexLookup: ImVector_ImWchar;
    Glyphs: ImVector_ImFontGlyph;
    FallbackGlyph: PImFontGlyph;
    ContainerAtlas: PImFontAtlas;
    ConfigData: PImFontConfig;
    ConfigDataCount: Smallint;
    FallbackChar: ImWchar;
    EllipsisChar: ImWchar;
    EllipsisCharCount: Smallint;
    EllipsisWidth: Single;
    EllipsisCharStep: Single;
    DirtyLookupTables: Boolean;
    Scale: Single;
    Ascent: Single;
    Descent: Single;
    MetricsTotalSurface: Integer;
    Used4kPagesMap: array [0..1] of ImU8;
  end;

  ImGuiViewportFlags_ = (
    ImGuiViewportFlags_None = 0,
    ImGuiViewportFlags_IsPlatformWindow = 1,
    ImGuiViewportFlags_IsPlatformMonitor = 2,
    ImGuiViewportFlags_OwnedByApp = 4,
    ImGuiViewportFlags_NoDecoration = 8,
    ImGuiViewportFlags_NoTaskBarIcon = 16,
    ImGuiViewportFlags_NoFocusOnAppearing = 32,
    ImGuiViewportFlags_NoFocusOnClick = 64,
    ImGuiViewportFlags_NoInputs = 128,
    ImGuiViewportFlags_NoRendererClear = 256,
    ImGuiViewportFlags_NoAutoMerge = 512,
    ImGuiViewportFlags_TopMost = 1024,
    ImGuiViewportFlags_CanHostOtherWindows = 2048,
    ImGuiViewportFlags_IsMinimized = 4096,
    ImGuiViewportFlags_IsFocused = 8192);
  PImGuiViewportFlags_ = ^ImGuiViewportFlags_;

  ImGuiViewport = record
    ID: ImGuiID;
    Flags: ImGuiViewportFlags;
    Pos: ImVec2;
    Size: ImVec2;
    WorkPos: ImVec2;
    WorkSize: ImVec2;
    DpiScale: Single;
    ParentViewportId: ImGuiID;
    DrawData: PImDrawData;
    RendererUserData: Pointer;
    PlatformUserData: Pointer;
    PlatformHandle: Pointer;
    PlatformHandleRaw: Pointer;
    PlatformWindowCreated: Boolean;
    PlatformRequestMove: Boolean;
    PlatformRequestResize: Boolean;
    PlatformRequestClose: Boolean;
  end;

  ImVector_ImGuiPlatformMonitor = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPlatformMonitor;
  end;

  ImVector_ImGuiViewportPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImGuiViewport;
  end;

  ImGuiPlatformIO = record
    Platform_CreateWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_DestroyWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_ShowWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_SetWindowPos: procedure(vp: PImGuiViewport; pos: ImVec2); cdecl;
    Platform_GetWindowPos: function(vp: PImGuiViewport): ImVec2; cdecl;
    Platform_SetWindowSize: procedure(vp: PImGuiViewport; size: ImVec2); cdecl;
    Platform_GetWindowSize: function(vp: PImGuiViewport): ImVec2; cdecl;
    Platform_SetWindowFocus: procedure(vp: PImGuiViewport); cdecl;
    Platform_GetWindowFocus: function(vp: PImGuiViewport): Boolean; cdecl;
    Platform_GetWindowMinimized: function(vp: PImGuiViewport): Boolean; cdecl;
    Platform_SetWindowTitle: procedure(vp: PImGuiViewport; const str: PUTF8Char); cdecl;
    Platform_SetWindowAlpha: procedure(vp: PImGuiViewport; alpha: Single); cdecl;
    Platform_UpdateWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_RenderWindow: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Platform_SwapBuffers: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Platform_GetWindowDpiScale: function(vp: PImGuiViewport): Single; cdecl;
    Platform_OnChangedViewport: procedure(vp: PImGuiViewport); cdecl;
    Platform_CreateVkSurface: function(vp: PImGuiViewport; vk_inst: ImU64; const vk_allocators: Pointer; out_vk_surface: PImU64): Integer; cdecl;
    Renderer_CreateWindow: procedure(vp: PImGuiViewport); cdecl;
    Renderer_DestroyWindow: procedure(vp: PImGuiViewport); cdecl;
    Renderer_SetWindowSize: procedure(vp: PImGuiViewport; size: ImVec2); cdecl;
    Renderer_RenderWindow: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Renderer_SwapBuffers: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Monitors: ImVector_ImGuiPlatformMonitor;
    Viewports: ImVector_ImGuiViewportPtr;
  end;

  ImGuiPlatformMonitor = record
    MainPos: ImVec2;
    MainSize: ImVec2;
    WorkPos: ImVec2;
    WorkSize: ImVec2;
    DpiScale: Single;
    PlatformHandle: Pointer;
  end;

  ImGuiPlatformImeData = record
    WantVisible: Boolean;
    InputPos: ImVec2;
    InputLineHeight: Single;
  end;

  ImGuiDataAuthority = Integer;
  ImGuiLayoutType = Integer;
  ImGuiActivateFlags = Integer;
  ImGuiDebugLogFlags = Integer;
  ImGuiFocusRequestFlags = Integer;
  ImGuiInputFlags = Integer;
  ImGuiItemFlags = Integer;
  PImGuiItemFlags = ^ImGuiItemFlags;
  ImGuiItemStatusFlags = Integer;
  ImGuiOldColumnFlags = Integer;
  ImGuiNavHighlightFlags = Integer;
  ImGuiNavMoveFlags = Integer;
  ImGuiNextItemDataFlags = Integer;
  ImGuiNextWindowDataFlags = Integer;
  ImGuiScrollFlags = Integer;
  ImGuiSeparatorFlags = Integer;
  ImGuiTextFlags = Integer;
  ImGuiTooltipFlags = Integer;
  ImGuiTypingSelectFlags = Integer;

  ImGuiErrorLogCallback = procedure(user_data: Pointer; const fmt: PUTF8Char) varargs; cdecl;

  StbUndoRecord = record
    where: Integer;
    insert_length: Integer;
    delete_length: Integer;
    char_storage: Integer;
  end;

  StbUndoState = record
    undo_rec: array [0..98] of StbUndoRecord;
    undo_char: array [0..998] of ImWchar;
    undo_point: Smallint;
    redo_point: Smallint;
    undo_char_point: Integer;
    redo_char_point: Integer;
  end;

  STB_TexteditState = record
    cursor: Integer;
    select_start: Integer;
    select_end: Integer;
    insert_mode: Byte;
    row_count_per_page: Integer;
    cursor_at_end_of_line: Byte;
    initialized: Byte;
    has_preferred_x: Byte;
    single_line: Byte;
    padding1: Byte;
    padding2: Byte;
    padding3: Byte;
    preferred_x: Single;
    undostate: StbUndoState;
  end;

  StbTexteditRow = record
    x0: Single;
    x1: Single;
    baseline_y_delta: Single;
    ymin: Single;
    ymax: Single;
    num_chars: Integer;
  end;

  ImFileHandle = PPointer;

  ImVec1 = record
    x: Single;
  end;

  ImVec2ih = record
    x: Smallint;
    y: Smallint;
  end;

  ImRect = record
    Min: ImVec2;
    Max: ImVec2;
  end;

  ImBitArrayPtr = PImU32;

  ImBitVector = record
    Storage: ImVector_ImU32;
  end;

  ImPoolIdx = Integer;

  ImVector_int = record
    Size: Integer;
    Capacity: Integer;
    Data: PInteger;
  end;

  ImGuiTextIndex = record
    LineOffsets: ImVector_int;
    EndOffset: Integer;
  end;

  ImDrawListSharedData = record
    TexUvWhitePixel: ImVec2;
    Font: PImFont;
    FontSize: Single;
    CurveTessellationTol: Single;
    CircleSegmentMaxError: Single;
    ClipRectFullscreen: ImVec4;
    InitialFlags: ImDrawListFlags;
    TempBuffer: ImVector_ImVec2;
    ArcFastVtx: array [0..47] of ImVec2;
    ArcFastRadiusCutoff: Single;
    CircleSegmentCounts: array [0..63] of ImU8;
    TexUvLines: PImVec4;
  end;

  ImDrawDataBuilder = record
    Layers: array [0..1] of PImVector_ImDrawListPtr;
    LayerData1: ImVector_ImDrawListPtr;
  end;

  ImGuiItemFlags_ = (
    ImGuiItemFlags_None = 0,
    ImGuiItemFlags_NoTabStop = 1,
    ImGuiItemFlags_ButtonRepeat = 2,
    ImGuiItemFlags_Disabled = 4,
    ImGuiItemFlags_NoNav = 8,
    ImGuiItemFlags_NoNavDefaultFocus = 16,
    ImGuiItemFlags_SelectableDontClosePopup = 32,
    ImGuiItemFlags_MixedValue = 64,
    ImGuiItemFlags_ReadOnly = 128,
    ImGuiItemFlags_NoWindowHoverableCheck = 256,
    ImGuiItemFlags_AllowOverlap = 512,
    ImGuiItemFlags_Inputable = 1024,
    ImGuiItemFlags_HasSelectionUserData = 2048);
  PImGuiItemFlags_ = ^ImGuiItemFlags_;

  ImGuiItemStatusFlags_ = (
    ImGuiItemStatusFlags_None = 0,
    ImGuiItemStatusFlags_HoveredRect = 1,
    ImGuiItemStatusFlags_HasDisplayRect = 2,
    ImGuiItemStatusFlags_Edited = 4,
    ImGuiItemStatusFlags_ToggledSelection = 8,
    ImGuiItemStatusFlags_ToggledOpen = 16,
    ImGuiItemStatusFlags_HasDeactivated = 32,
    ImGuiItemStatusFlags_Deactivated = 64,
    ImGuiItemStatusFlags_HoveredWindow = 128,
    ImGuiItemStatusFlags_Visible = 256,
    ImGuiItemStatusFlags_HasClipRect = 512);
  PImGuiItemStatusFlags_ = ^ImGuiItemStatusFlags_;

  ImGuiHoveredFlagsPrivate_ = (
    ImGuiHoveredFlags_DelayMask_ = 245760,
    ImGuiHoveredFlags_AllowedMaskForIsWindowHovered = 12479,
    ImGuiHoveredFlags_AllowedMaskForIsItemHovered = 262048);
  PImGuiHoveredFlagsPrivate_ = ^ImGuiHoveredFlagsPrivate_;

  ImGuiInputTextFlagsPrivate_ = (
    ImGuiInputTextFlags_Multiline = 67108864,
    ImGuiInputTextFlags_NoMarkEdited = 134217728,
    ImGuiInputTextFlags_MergedItem = 268435456);
  PImGuiInputTextFlagsPrivate_ = ^ImGuiInputTextFlagsPrivate_;

  ImGuiButtonFlagsPrivate_ = (
    ImGuiButtonFlags_PressedOnClick = 16,
    ImGuiButtonFlags_PressedOnClickRelease = 32,
    ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 64,
    ImGuiButtonFlags_PressedOnRelease = 128,
    ImGuiButtonFlags_PressedOnDoubleClick = 256,
    ImGuiButtonFlags_PressedOnDragDropHold = 512,
    ImGuiButtonFlags_Repeat = 1024,
    ImGuiButtonFlags_FlattenChildren = 2048,
    ImGuiButtonFlags_AllowOverlap = 4096,
    ImGuiButtonFlags_DontClosePopups = 8192,
    ImGuiButtonFlags_AlignTextBaseLine = 32768,
    ImGuiButtonFlags_NoKeyModifiers = 65536,
    ImGuiButtonFlags_NoHoldingActiveId = 131072,
    ImGuiButtonFlags_NoNavFocus = 262144,
    ImGuiButtonFlags_NoHoveredOnFocus = 524288,
    ImGuiButtonFlags_NoSetKeyOwner = 1048576,
    ImGuiButtonFlags_NoTestKeyOwner = 2097152,
    ImGuiButtonFlags_PressedOnMask_ = 1008,
    ImGuiButtonFlags_PressedOnDefault_ = 32);
  PImGuiButtonFlagsPrivate_ = ^ImGuiButtonFlagsPrivate_;

  ImGuiComboFlagsPrivate_ = (
    ImGuiComboFlags_CustomPreview = 1048576);
  PImGuiComboFlagsPrivate_ = ^ImGuiComboFlagsPrivate_;

  ImGuiSliderFlagsPrivate_ = (
    ImGuiSliderFlags_Vertical = 1048576,
    ImGuiSliderFlags_ReadOnly = 2097152);
  PImGuiSliderFlagsPrivate_ = ^ImGuiSliderFlagsPrivate_;

  ImGuiSelectableFlagsPrivate_ = (
    ImGuiSelectableFlags_NoHoldingActiveID = 1048576,
    ImGuiSelectableFlags_SelectOnNav = 2097152,
    ImGuiSelectableFlags_SelectOnClick = 4194304,
    ImGuiSelectableFlags_SelectOnRelease = 8388608,
    ImGuiSelectableFlags_SpanAvailWidth = 16777216,
    ImGuiSelectableFlags_SetNavIdOnHover = 33554432,
    ImGuiSelectableFlags_NoPadWithHalfSpacing = 67108864,
    ImGuiSelectableFlags_NoSetKeyOwner = 134217728);
  PImGuiSelectableFlagsPrivate_ = ^ImGuiSelectableFlagsPrivate_;

  ImGuiTreeNodeFlagsPrivate_ = (
    ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1048576,
    ImGuiTreeNodeFlags_UpsideDownArrow = 2097152);
  PImGuiTreeNodeFlagsPrivate_ = ^ImGuiTreeNodeFlagsPrivate_;

  ImGuiSeparatorFlags_ = (
    ImGuiSeparatorFlags_None = 0,
    ImGuiSeparatorFlags_Horizontal = 1,
    ImGuiSeparatorFlags_Vertical = 2,
    ImGuiSeparatorFlags_SpanAllColumns = 4);
  PImGuiSeparatorFlags_ = ^ImGuiSeparatorFlags_;

  ImGuiFocusRequestFlags_ = (
    ImGuiFocusRequestFlags_None = 0,
    ImGuiFocusRequestFlags_RestoreFocusedChild = 1,
    ImGuiFocusRequestFlags_UnlessBelowModal = 2);
  PImGuiFocusRequestFlags_ = ^ImGuiFocusRequestFlags_;

  ImGuiTextFlags_ = (
    ImGuiTextFlags_None = 0,
    ImGuiTextFlags_NoWidthForLargeClippedText = 1);
  PImGuiTextFlags_ = ^ImGuiTextFlags_;

  ImGuiTooltipFlags_ = (
    ImGuiTooltipFlags_None = 0,
    ImGuiTooltipFlags_OverridePrevious = 2);
  PImGuiTooltipFlags_ = ^ImGuiTooltipFlags_;

  ImGuiLayoutType_ = (
    ImGuiLayoutType_Horizontal = 0,
    ImGuiLayoutType_Vertical = 1);
  PImGuiLayoutType_ = ^ImGuiLayoutType_;

  ImGuiLogType = (
    ImGuiLogType_None = 0,
    ImGuiLogType_TTY = 1,
    ImGuiLogType_File = 2,
    ImGuiLogType_Buffer = 3,
    ImGuiLogType_Clipboard = 4);
  PImGuiLogType = ^ImGuiLogType;

  ImGuiAxis = (
    ImGuiAxis_None = -1,
    ImGuiAxis_X = 0,
    ImGuiAxis_Y = 1);
  PImGuiAxis = ^ImGuiAxis;

  ImGuiPlotType = (
    ImGuiPlotType_Lines = 0,
    ImGuiPlotType_Histogram = 1);
  PImGuiPlotType = ^ImGuiPlotType;

  ImGuiPopupPositionPolicy = (
    ImGuiPopupPositionPolicy_Default = 0,
    ImGuiPopupPositionPolicy_ComboBox = 1,
    ImGuiPopupPositionPolicy_Tooltip = 2);
  PImGuiPopupPositionPolicy = ^ImGuiPopupPositionPolicy;

  ImGuiDataVarInfo = record
    &Type: ImGuiDataType;
    Count: ImU32;
    Offset: ImU32;
  end;

  ImGuiDataTypeTempStorage = record
    Data: array [0..7] of ImU8;
  end;

  ImGuiDataTypeInfo = record
    Size: NativeUInt;
    Name: PUTF8Char;
    PrintFmt: PUTF8Char;
    ScanFmt: PUTF8Char;
  end;

  ImGuiDataTypePrivate_ = (
    ImGuiDataType_String = 11,
    ImGuiDataType_Pointer = 12,
    ImGuiDataType_ID = 13);
  PImGuiDataTypePrivate_ = ^ImGuiDataTypePrivate_;

  ImGuiColorMod = record
    Col: ImGuiCol;
    BackupValue: ImVec4;
  end;

  P_anonymous_type_3 = ^_anonymous_type_3;
  _anonymous_type_3 = record
    case Integer of
      0: (BackupInt: array [0..1] of Integer);
      1: (BackupFloat: array [0..1] of Single);
  end;

  ImGuiStyleMod = record
    VarIdx: ImGuiStyleVar;
    f2: _anonymous_type_3;
  end;

  ImGuiComboPreviewData = record
    PreviewRect: ImRect;
    BackupCursorPos: ImVec2;
    BackupCursorMaxPos: ImVec2;
    BackupCursorPosPrevLine: ImVec2;
    BackupPrevLineTextBaseOffset: Single;
    BackupLayout: ImGuiLayoutType;
  end;

  ImGuiGroupData = record
    WindowID: ImGuiID;
    BackupCursorPos: ImVec2;
    BackupCursorMaxPos: ImVec2;
    BackupCursorPosPrevLine: ImVec2;
    BackupIndent: ImVec1;
    BackupGroupOffset: ImVec1;
    BackupCurrLineSize: ImVec2;
    BackupCurrLineTextBaseOffset: Single;
    BackupActiveIdIsAlive: ImGuiID;
    BackupActiveIdPreviousFrameIsAlive: Boolean;
    BackupHoveredIdIsAlive: Boolean;
    BackupIsSameLine: Boolean;
    EmitItem: Boolean;
  end;

  ImGuiMenuColumns = record
    TotalWidth: ImU32;
    NextTotalWidth: ImU32;
    Spacing: ImU16;
    OffsetIcon: ImU16;
    OffsetLabel: ImU16;
    OffsetShortcut: ImU16;
    OffsetMark: ImU16;
    Widths: array [0..3] of ImU16;
  end;

  ImGuiInputTextDeactivatedState = record
    ID: ImGuiID;
    TextA: ImVector_char;
  end;

  ImGuiInputTextState = record
    Ctx: PImGuiContext;
    ID: ImGuiID;
    CurLenW: Integer;
    CurLenA: Integer;
    TextW: ImVector_ImWchar;
    TextA: ImVector_char;
    InitialTextA: ImVector_char;
    TextAIsValid: Boolean;
    BufCapacityA: Integer;
    ScrollX: Single;
    Stb: STB_TexteditState;
    CursorAnim: Single;
    CursorFollow: Boolean;
    SelectedAllMouseLock: Boolean;
    Edited: Boolean;
    Flags: ImGuiInputTextFlags;
  end;

  ImGuiPopupData = record
    PopupId: ImGuiID;
    Window: PImGuiWindow;
    BackupNavWindow: PImGuiWindow;
    ParentNavLayer: Integer;
    OpenFrameCount: Integer;
    OpenParentId: ImGuiID;
    OpenPopupPos: ImVec2;
    OpenMousePos: ImVec2;
  end;

  ImGuiNextWindowDataFlags_ = (
    ImGuiNextWindowDataFlags_None = 0,
    ImGuiNextWindowDataFlags_HasPos = 1,
    ImGuiNextWindowDataFlags_HasSize = 2,
    ImGuiNextWindowDataFlags_HasContentSize = 4,
    ImGuiNextWindowDataFlags_HasCollapsed = 8,
    ImGuiNextWindowDataFlags_HasSizeConstraint = 16,
    ImGuiNextWindowDataFlags_HasFocus = 32,
    ImGuiNextWindowDataFlags_HasBgAlpha = 64,
    ImGuiNextWindowDataFlags_HasScroll = 128,
    ImGuiNextWindowDataFlags_HasChildFlags = 256,
    ImGuiNextWindowDataFlags_HasViewport = 512,
    ImGuiNextWindowDataFlags_HasDock = 1024,
    ImGuiNextWindowDataFlags_HasWindowClass = 2048);
  PImGuiNextWindowDataFlags_ = ^ImGuiNextWindowDataFlags_;

  ImGuiNextWindowData = record
    Flags: ImGuiNextWindowDataFlags;
    PosCond: ImGuiCond;
    SizeCond: ImGuiCond;
    CollapsedCond: ImGuiCond;
    DockCond: ImGuiCond;
    PosVal: ImVec2;
    PosPivotVal: ImVec2;
    SizeVal: ImVec2;
    ContentSizeVal: ImVec2;
    ScrollVal: ImVec2;
    ChildFlags: ImGuiChildFlags;
    PosUndock: Boolean;
    CollapsedVal: Boolean;
    SizeConstraintRect: ImRect;
    SizeCallback: ImGuiSizeCallback;
    SizeCallbackUserData: Pointer;
    BgAlphaVal: Single;
    ViewportId: ImGuiID;
    DockId: ImGuiID;
    WindowClass: ImGuiWindowClass;
    MenuBarOffsetMinVal: ImVec2;
  end;

  ImGuiSelectionUserData = ImS64;

  ImGuiNextItemDataFlags_ = (
    ImGuiNextItemDataFlags_None = 0,
    ImGuiNextItemDataFlags_HasWidth = 1,
    ImGuiNextItemDataFlags_HasOpen = 2);
  PImGuiNextItemDataFlags_ = ^ImGuiNextItemDataFlags_;

  ImGuiNextItemData = record
    Flags: ImGuiNextItemDataFlags;
    ItemFlags: ImGuiItemFlags;
    Width: Single;
    SelectionUserData: ImGuiSelectionUserData;
    OpenCond: ImGuiCond;
    OpenVal: Boolean;
  end;

  ImGuiLastItemData = record
    ID: ImGuiID;
    InFlags: ImGuiItemFlags;
    StatusFlags: ImGuiItemStatusFlags;
    Rect: ImRect;
    NavRect: ImRect;
    DisplayRect: ImRect;
    ClipRect: ImRect;
  end;

  ImGuiNavTreeNodeData = record
    ID: ImGuiID;
    InFlags: ImGuiItemFlags;
    NavRect: ImRect;
  end;

  ImGuiStackSizes = record
    SizeOfIDStack: Smallint;
    SizeOfColorStack: Smallint;
    SizeOfStyleVarStack: Smallint;
    SizeOfFontStack: Smallint;
    SizeOfFocusScopeStack: Smallint;
    SizeOfGroupStack: Smallint;
    SizeOfItemFlagsStack: Smallint;
    SizeOfBeginPopupStack: Smallint;
    SizeOfDisabledStack: Smallint;
  end;

  ImGuiWindowStackData = record
    Window: PImGuiWindow;
    ParentLastItemDataBackup: ImGuiLastItemData;
    StackSizesOnBegin: ImGuiStackSizes;
  end;

  ImGuiShrinkWidthItem = record
    Index: Integer;
    Width: Single;
    InitialWidth: Single;
  end;

  ImGuiPtrOrIndex = record
    Ptr: Pointer;
    Index: Integer;
  end;

  ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN = record
    Storage: array [0..4] of ImU32;
  end;

  ImBitArrayForNamedKeys = ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;

  ImGuiInputEventType = (
    ImGuiInputEventType_None = 0,
    ImGuiInputEventType_MousePos = 1,
    ImGuiInputEventType_MouseWheel = 2,
    ImGuiInputEventType_MouseButton = 3,
    ImGuiInputEventType_MouseViewport = 4,
    ImGuiInputEventType_Key = 5,
    ImGuiInputEventType_Text = 6,
    ImGuiInputEventType_Focus = 7,
    ImGuiInputEventType_COUNT = 8);
  PImGuiInputEventType = ^ImGuiInputEventType;

  ImGuiInputSource = (
    ImGuiInputSource_None = 0,
    ImGuiInputSource_Mouse = 1,
    ImGuiInputSource_Keyboard = 2,
    ImGuiInputSource_Gamepad = 3,
    ImGuiInputSource_Clipboard = 4,
    ImGuiInputSource_COUNT = 5);
  PImGuiInputSource = ^ImGuiInputSource;

  ImGuiInputEventMousePos = record
    PosX: Single;
    PosY: Single;
    MouseSource: ImGuiMouseSource;
  end;

  ImGuiInputEventMouseWheel = record
    WheelX: Single;
    WheelY: Single;
    MouseSource: ImGuiMouseSource;
  end;

  ImGuiInputEventMouseButton = record
    Button: Integer;
    Down: Boolean;
    MouseSource: ImGuiMouseSource;
  end;

  ImGuiInputEventMouseViewport = record
    HoveredViewportID: ImGuiID;
  end;

  ImGuiInputEventKey = record
    Key: ImGuiKey;
    Down: Boolean;
    AnalogValue: Single;
  end;

  ImGuiInputEventText = record
    Char: Cardinal;
  end;

  ImGuiInputEventAppFocused = record
    Focused: Boolean;
  end;

  P_anonymous_type_4 = ^_anonymous_type_4;
  _anonymous_type_4 = record
    case Integer of
      0: (MousePos: ImGuiInputEventMousePos);
      1: (MouseWheel: ImGuiInputEventMouseWheel);
      2: (MouseButton: ImGuiInputEventMouseButton);
      3: (MouseViewport: ImGuiInputEventMouseViewport);
      4: (Key: ImGuiInputEventKey);
      5: (Text: ImGuiInputEventText);
      6: (AppFocused: ImGuiInputEventAppFocused);
  end;

  ImGuiInputEvent = record
    &Type: ImGuiInputEventType;
    Source: ImGuiInputSource;
    EventId: ImU32;
    f4: _anonymous_type_4;
    AddedByTestEngine: Boolean;
  end;

  ImGuiKeyRoutingIndex = ImS16;

  ImGuiKeyRoutingData = record
    NextEntryIndex: ImGuiKeyRoutingIndex;
    Mods: ImU16;
    RoutingNextScore: ImU8;
    RoutingCurr: ImGuiID;
    RoutingNext: ImGuiID;
  end;

  ImVector_ImGuiKeyRoutingData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiKeyRoutingData;
  end;

  ImGuiKeyRoutingTable = record
    Index: array [0..153] of ImGuiKeyRoutingIndex;
    Entries: ImVector_ImGuiKeyRoutingData;
    EntriesNext: ImVector_ImGuiKeyRoutingData;
  end;

  ImGuiKeyOwnerData = record
    OwnerCurr: ImGuiID;
    OwnerNext: ImGuiID;
    LockThisFrame: Boolean;
    LockUntilRelease: Boolean;
  end;

  ImGuiInputFlags_ = (
    ImGuiInputFlags_None = 0,
    ImGuiInputFlags_Repeat = 1,
    ImGuiInputFlags_RepeatRateDefault = 2,
    ImGuiInputFlags_RepeatRateNavMove = 4,
    ImGuiInputFlags_RepeatRateNavTweak = 8,
    ImGuiInputFlags_RepeatUntilRelease = 16,
    ImGuiInputFlags_RepeatUntilKeyModsChange = 32,
    ImGuiInputFlags_RepeatUntilKeyModsChangeFromNone = 64,
    ImGuiInputFlags_RepeatUntilOtherKeyPress = 128,
    ImGuiInputFlags_CondHovered = 256,
    ImGuiInputFlags_CondActive = 512,
    ImGuiInputFlags_CondDefault_ = 768,
    ImGuiInputFlags_CondMask_ = 768,
    ImGuiInputFlags_LockThisFrame = 1024,
    ImGuiInputFlags_LockUntilRelease = 2048,
    ImGuiInputFlags_RouteFocused = 4096,
    ImGuiInputFlags_RouteGlobalLow = 8192,
    ImGuiInputFlags_RouteGlobal = 16384,
    ImGuiInputFlags_RouteGlobalHigh = 32768,
    ImGuiInputFlags_RouteMask_ = 61440,
    ImGuiInputFlags_RouteAlways = 65536,
    ImGuiInputFlags_RouteUnlessBgFocused = 131072,
    ImGuiInputFlags_RouteExtraMask_ = 196608,
    ImGuiInputFlags_RepeatRateMask_ = 14,
    ImGuiInputFlags_RepeatUntilMask_ = 240,
    ImGuiInputFlags_RepeatMask_ = 255,
    ImGuiInputFlags_SupportedByIsKeyPressed = 255,
    ImGuiInputFlags_SupportedByIsMouseClicked = 1,
    ImGuiInputFlags_SupportedByShortcut = 258303,
    ImGuiInputFlags_SupportedBySetKeyOwner = 3072,
    ImGuiInputFlags_SupportedBySetItemKeyOwner = 3840);
  PImGuiInputFlags_ = ^ImGuiInputFlags_;

  ImGuiListClipperRange = record
    Min: Integer;
    Max: Integer;
    PosToIndexConvert: Boolean;
    PosToIndexOffsetMin: ImS8;
    PosToIndexOffsetMax: ImS8;
  end;

  ImVector_ImGuiListClipperRange = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiListClipperRange;
  end;

  ImGuiListClipperData = record
    ListClipper: PImGuiListClipper;
    LossynessOffset: Single;
    StepNo: Integer;
    ItemsFrozen: Integer;
    Ranges: ImVector_ImGuiListClipperRange;
  end;

  ImGuiActivateFlags_ = (
    ImGuiActivateFlags_None = 0,
    ImGuiActivateFlags_PreferInput = 1,
    ImGuiActivateFlags_PreferTweak = 2,
    ImGuiActivateFlags_TryToPreserveState = 4,
    ImGuiActivateFlags_FromTabbing = 8);
  PImGuiActivateFlags_ = ^ImGuiActivateFlags_;

  ImGuiScrollFlags_ = (
    ImGuiScrollFlags_None = 0,
    ImGuiScrollFlags_KeepVisibleEdgeX = 1,
    ImGuiScrollFlags_KeepVisibleEdgeY = 2,
    ImGuiScrollFlags_KeepVisibleCenterX = 4,
    ImGuiScrollFlags_KeepVisibleCenterY = 8,
    ImGuiScrollFlags_AlwaysCenterX = 16,
    ImGuiScrollFlags_AlwaysCenterY = 32,
    ImGuiScrollFlags_NoScrollParent = 64,
    ImGuiScrollFlags_MaskX_ = 21,
    ImGuiScrollFlags_MaskY_ = 42);
  PImGuiScrollFlags_ = ^ImGuiScrollFlags_;

  ImGuiNavHighlightFlags_ = (
    ImGuiNavHighlightFlags_None = 0,
    ImGuiNavHighlightFlags_TypeDefault = 1,
    ImGuiNavHighlightFlags_TypeThin = 2,
    ImGuiNavHighlightFlags_AlwaysDraw = 4,
    ImGuiNavHighlightFlags_NoRounding = 8);
  PImGuiNavHighlightFlags_ = ^ImGuiNavHighlightFlags_;

  ImGuiNavMoveFlags_ = (
    ImGuiNavMoveFlags_None = 0,
    ImGuiNavMoveFlags_LoopX = 1,
    ImGuiNavMoveFlags_LoopY = 2,
    ImGuiNavMoveFlags_WrapX = 4,
    ImGuiNavMoveFlags_WrapY = 8,
    ImGuiNavMoveFlags_WrapMask_ = 15,
    ImGuiNavMoveFlags_AllowCurrentNavId = 16,
    ImGuiNavMoveFlags_AlsoScoreVisibleSet = 32,
    ImGuiNavMoveFlags_ScrollToEdgeY = 64,
    ImGuiNavMoveFlags_Forwarded = 128,
    ImGuiNavMoveFlags_DebugNoResult = 256,
    ImGuiNavMoveFlags_FocusApi = 512,
    ImGuiNavMoveFlags_IsTabbing = 1024,
    ImGuiNavMoveFlags_IsPageMove = 2048,
    ImGuiNavMoveFlags_Activate = 4096,
    ImGuiNavMoveFlags_NoSelect = 8192,
    ImGuiNavMoveFlags_NoSetNavHighlight = 16384);
  PImGuiNavMoveFlags_ = ^ImGuiNavMoveFlags_;

  ImGuiNavLayer = (
    ImGuiNavLayer_Main = 0,
    ImGuiNavLayer_Menu = 1,
    ImGuiNavLayer_COUNT = 2);
  PImGuiNavLayer = ^ImGuiNavLayer;

  ImGuiNavItemData = record
    Window: PImGuiWindow;
    ID: ImGuiID;
    FocusScopeId: ImGuiID;
    RectRel: ImRect;
    InFlags: ImGuiItemFlags;
    SelectionUserData: ImGuiSelectionUserData;
    DistBox: Single;
    DistCenter: Single;
    DistAxial: Single;
  end;

  ImGuiTypingSelectFlags_ = (
    ImGuiTypingSelectFlags_None = 0,
    ImGuiTypingSelectFlags_AllowBackspace = 1,
    ImGuiTypingSelectFlags_AllowSingleCharMode = 2);
  PImGuiTypingSelectFlags_ = ^ImGuiTypingSelectFlags_;

  ImGuiTypingSelectRequest = record
    Flags: ImGuiTypingSelectFlags;
    SearchBufferLen: Integer;
    SearchBuffer: PUTF8Char;
    SelectRequest: Boolean;
    SingleCharMode: Boolean;
    SingleCharSize: ImS8;
  end;

  ImGuiTypingSelectState = record
    Request: ImGuiTypingSelectRequest;
    SearchBuffer: array [0..63] of UTF8Char;
    FocusScope: ImGuiID;
    LastRequestFrame: Integer;
    LastRequestTime: Single;
    SingleCharModeLock: Boolean;
  end;

  ImGuiOldColumnFlags_ = (
    ImGuiOldColumnFlags_None = 0,
    ImGuiOldColumnFlags_NoBorder = 1,
    ImGuiOldColumnFlags_NoResize = 2,
    ImGuiOldColumnFlags_NoPreserveWidths = 4,
    ImGuiOldColumnFlags_NoForceWithinWindow = 8,
    ImGuiOldColumnFlags_GrowParentContentsSize = 16);
  PImGuiOldColumnFlags_ = ^ImGuiOldColumnFlags_;

  ImGuiOldColumnData = record
    OffsetNorm: Single;
    OffsetNormBeforeResize: Single;
    Flags: ImGuiOldColumnFlags;
    ClipRect: ImRect;
  end;

  ImVector_ImGuiOldColumnData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiOldColumnData;
  end;

  ImGuiOldColumns = record
    ID: ImGuiID;
    Flags: ImGuiOldColumnFlags;
    IsFirstFrame: Boolean;
    IsBeingResized: Boolean;
    Current: Integer;
    Count: Integer;
    OffMinX: Single;
    OffMaxX: Single;
    LineMinY: Single;
    LineMaxY: Single;
    HostCursorPosY: Single;
    HostCursorMaxPosX: Single;
    HostInitialClipRect: ImRect;
    HostBackupClipRect: ImRect;
    HostBackupParentWorkRect: ImRect;
    Columns: ImVector_ImGuiOldColumnData;
    Splitter: ImDrawListSplitter;
  end;

  ImGuiDockNodeFlagsPrivate_ = (
    ImGuiDockNodeFlags_DockSpace = 1024,
    ImGuiDockNodeFlags_CentralNode = 2048,
    ImGuiDockNodeFlags_NoTabBar = 4096,
    ImGuiDockNodeFlags_HiddenTabBar = 8192,
    ImGuiDockNodeFlags_NoWindowMenuButton = 16384,
    ImGuiDockNodeFlags_NoCloseButton = 32768,
    ImGuiDockNodeFlags_NoResizeX = 65536,
    ImGuiDockNodeFlags_NoResizeY = 131072,
    ImGuiDockNodeFlags_NoDockingSplitOther = 524288,
    ImGuiDockNodeFlags_NoDockingOverMe = 1048576,
    ImGuiDockNodeFlags_NoDockingOverOther = 2097152,
    ImGuiDockNodeFlags_NoDockingOverEmpty = 4194304,
    ImGuiDockNodeFlags_NoDocking = 7864336,
    ImGuiDockNodeFlags_SharedFlagsInheritMask_ = -1,
    ImGuiDockNodeFlags_NoResizeFlagsMask_ = 196640,
    ImGuiDockNodeFlags_LocalFlagsTransferMask_ = 260208,
    ImGuiDockNodeFlags_SavedFlagsMask_ = 261152);
  PImGuiDockNodeFlagsPrivate_ = ^ImGuiDockNodeFlagsPrivate_;

  ImGuiDataAuthority_ = (
    ImGuiDataAuthority_Auto = 0,
    ImGuiDataAuthority_DockNode = 1,
    ImGuiDataAuthority_Window = 2);
  PImGuiDataAuthority_ = ^ImGuiDataAuthority_;

  ImGuiDockNodeState = (
    ImGuiDockNodeState_Unknown = 0,
    ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow = 1,
    ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing = 2,
    ImGuiDockNodeState_HostWindowVisible = 3);
  PImGuiDockNodeState = ^ImGuiDockNodeState;

  ImVector_ImGuiWindowPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImGuiWindow;
  end;

  ImGuiDockNode = record
    ID: ImGuiID;
    SharedFlags: ImGuiDockNodeFlags;
    LocalFlags: ImGuiDockNodeFlags;
    LocalFlagsInWindows: ImGuiDockNodeFlags;
    MergedFlags: ImGuiDockNodeFlags;
    State: ImGuiDockNodeState;
    ParentNode: PImGuiDockNode;
    ChildNodes: array [0..1] of PImGuiDockNode;
    Windows: ImVector_ImGuiWindowPtr;
    TabBar: PImGuiTabBar;
    Pos: ImVec2;
    Size: ImVec2;
    SizeRef: ImVec2;
    SplitAxis: ImGuiAxis;
    WindowClass: ImGuiWindowClass;
    LastBgColor: ImU32;
    HostWindow: PImGuiWindow;
    VisibleWindow: PImGuiWindow;
    CentralNode: PImGuiDockNode;
    OnlyNodeWithWindows: PImGuiDockNode;
    CountNodeWithWindows: Integer;
    LastFrameAlive: Integer;
    LastFrameActive: Integer;
    LastFrameFocused: Integer;
    LastFocusedNodeId: ImGuiID;
    SelectedTabId: ImGuiID;
    WantCloseTabId: ImGuiID;
    RefViewportId: ImGuiID;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property AuthorityForPos: Cardinal index $0003 read GetData0Value write SetData0Value; // 3 bits at offset 0 in Data0
    property AuthorityForSize: Cardinal index $0303 read GetData0Value write SetData0Value; // 3 bits at offset 3 in Data0
    property AuthorityForViewport: Cardinal index $0603 read GetData0Value write SetData0Value; // 3 bits at offset 6 in Data0
    property IsVisible: Cardinal index $901 read GetData0Value write SetData0Value; // 1 bits at offset 9 in Data0
    property IsFocused: Cardinal index $A01 read GetData0Value write SetData0Value; // 1 bits at offset 10 in Data0
    property IsBgDrawnThisFrame: Cardinal index $B01 read GetData0Value write SetData0Value; // 1 bits at offset 11 in Data0
    property HasCloseButton: Cardinal index $C01 read GetData0Value write SetData0Value; // 1 bits at offset 12 in Data0
    property HasWindowMenuButton: Cardinal index $D01 read GetData0Value write SetData0Value; // 1 bits at offset 13 in Data0
    property HasCentralNodeChild: Cardinal index $E01 read GetData0Value write SetData0Value; // 1 bits at offset 14 in Data0
    property WantCloseAll: Cardinal index $F01 read GetData0Value write SetData0Value; // 1 bits at offset 15 in Data0
    property WantLockSizeOnce: Cardinal index $1001 read GetData0Value write SetData0Value; // 1 bits at offset 16 in Data0
    property WantMouseMove: Cardinal index $1101 read GetData0Value write SetData0Value; // 1 bits at offset 17 in Data0
    property WantHiddenTabBarUpdate: Cardinal index $1201 read GetData0Value write SetData0Value; // 1 bits at offset 18 in Data0
    property WantHiddenTabBarToggle: Cardinal index $1301 read GetData0Value write SetData0Value; // 1 bits at offset 19 in Data0
  end;

  ImGuiWindowDockStyleCol = (
    ImGuiWindowDockStyleCol_Text = 0,
    ImGuiWindowDockStyleCol_Tab = 1,
    ImGuiWindowDockStyleCol_TabHovered = 2,
    ImGuiWindowDockStyleCol_TabActive = 3,
    ImGuiWindowDockStyleCol_TabUnfocused = 4,
    ImGuiWindowDockStyleCol_TabUnfocusedActive = 5,
    ImGuiWindowDockStyleCol_COUNT = 6);
  PImGuiWindowDockStyleCol = ^ImGuiWindowDockStyleCol;

  ImGuiWindowDockStyle = record
    Colors: array [0..5] of ImU32;
  end;

  ImVector_ImGuiDockRequest = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiDockRequest;
  end;

  ImVector_ImGuiDockNodeSettings = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiDockNodeSettings;
  end;

  ImGuiDockContext = record
    Nodes: ImGuiStorage;
    Requests: ImVector_ImGuiDockRequest;
    NodesSettings: ImVector_ImGuiDockNodeSettings;
    WantFullRebuild: Boolean;
  end;

  ImGuiViewportP = record
    _ImGuiViewport: ImGuiViewport;
    Window: PImGuiWindow;
    Idx: Integer;
    LastFrameActive: Integer;
    LastFocusedStampCount: Integer;
    LastNameHash: ImGuiID;
    LastPos: ImVec2;
    Alpha: Single;
    LastAlpha: Single;
    LastFocusedHadNavWindow: Boolean;
    PlatformMonitor: Smallint;
    BgFgDrawListsLastFrame: array [0..1] of Integer;
    BgFgDrawLists: array [0..1] of PImDrawList;
    DrawDataP: ImDrawData;
    DrawDataBuilder: ImDrawDataBuilder;
    LastPlatformPos: ImVec2;
    LastPlatformSize: ImVec2;
    LastRendererSize: ImVec2;
    WorkOffsetMin: ImVec2;
    WorkOffsetMax: ImVec2;
    BuildWorkOffsetMin: ImVec2;
    BuildWorkOffsetMax: ImVec2;
  end;

  ImGuiWindowSettings = record
    ID: ImGuiID;
    Pos: ImVec2ih;
    Size: ImVec2ih;
    ViewportPos: ImVec2ih;
    ViewportId: ImGuiID;
    DockId: ImGuiID;
    ClassId: ImGuiID;
    DockOrder: Smallint;
    Collapsed: Boolean;
    IsChild: Boolean;
    WantApply: Boolean;
    WantDelete: Boolean;
  end;

  ImGuiSettingsHandler = record
    TypeName: PUTF8Char;
    TypeHash: ImGuiID;
    ClearAllFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler); cdecl;
    ReadInitFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler); cdecl;
    ReadOpenFn: function(ctx: PImGuiContext; handler: PImGuiSettingsHandler; const name: PUTF8Char): Pointer; cdecl;
    ReadLineFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler; entry: Pointer; const line: PUTF8Char); cdecl;
    ApplyAllFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler); cdecl;
    WriteAllFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler; out_buf: PImGuiTextBuffer); cdecl;
    UserData: Pointer;
  end;

  ImGuiLocKey = (
    ImGuiLocKey_VersionStr = 0,
    ImGuiLocKey_TableSizeOne = 1,
    ImGuiLocKey_TableSizeAllFit = 2,
    ImGuiLocKey_TableSizeAllDefault = 3,
    ImGuiLocKey_TableResetOrder = 4,
    ImGuiLocKey_WindowingMainMenuBar = 5,
    ImGuiLocKey_WindowingPopup = 6,
    ImGuiLocKey_WindowingUntitled = 7,
    ImGuiLocKey_DockingHideTabBar = 8,
    ImGuiLocKey_DockingHoldShiftToDock = 9,
    ImGuiLocKey_DockingDragToUndockOrMoveNode = 10,
    ImGuiLocKey_COUNT = 11);
  PImGuiLocKey = ^ImGuiLocKey;

  ImGuiLocEntry = record
    Key: ImGuiLocKey;
    Text: PUTF8Char;
  end;

  ImGuiDebugLogFlags_ = (
    ImGuiDebugLogFlags_None = 0,
    ImGuiDebugLogFlags_EventActiveId = 1,
    ImGuiDebugLogFlags_EventFocus = 2,
    ImGuiDebugLogFlags_EventPopup = 4,
    ImGuiDebugLogFlags_EventNav = 8,
    ImGuiDebugLogFlags_EventClipper = 16,
    ImGuiDebugLogFlags_EventSelection = 32,
    ImGuiDebugLogFlags_EventIO = 64,
    ImGuiDebugLogFlags_EventDocking = 128,
    ImGuiDebugLogFlags_EventViewport = 256,
    ImGuiDebugLogFlags_EventMask_ = 511,
    ImGuiDebugLogFlags_OutputToTTY = 1048576,
    ImGuiDebugLogFlags_OutputToTestEngine = 2097152);
  PImGuiDebugLogFlags_ = ^ImGuiDebugLogFlags_;

  ImGuiDebugAllocEntry = record
    FrameCount: Integer;
    AllocCount: ImS16;
    FreeCount: ImS16;
  end;

  ImGuiDebugAllocInfo = record
    TotalAllocCount: Integer;
    TotalFreeCount: Integer;
    LastEntriesIdx: ImS16;
    LastEntriesBuf: array [0..5] of ImGuiDebugAllocEntry;
  end;

  ImGuiMetricsConfig = record
    ShowDebugLog: Boolean;
    ShowIDStackTool: Boolean;
    ShowWindowsRects: Boolean;
    ShowWindowsBeginOrder: Boolean;
    ShowTablesRects: Boolean;
    ShowDrawCmdMesh: Boolean;
    ShowDrawCmdBoundingBoxes: Boolean;
    ShowTextEncodingViewer: Boolean;
    ShowAtlasTintedWithTextColor: Boolean;
    ShowDockingNodes: Boolean;
    ShowWindowsRectsType: Integer;
    ShowTablesRectsType: Integer;
  end;

  ImGuiStackLevelInfo = record
    ID: ImGuiID;
    QueryFrameCount: ImS8;
    QuerySuccess: Boolean;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property DataType: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
  var
    Desc: array [0..56] of UTF8Char;
  end;

  ImVector_ImGuiStackLevelInfo = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStackLevelInfo;
  end;

  ImGuiIDStackTool = record
    LastActiveFrame: Integer;
    StackLevel: Integer;
    QueryId: ImGuiID;
    Results: ImVector_ImGuiStackLevelInfo;
    CopyToClipboardOnCtrlC: Boolean;
    CopyToClipboardLastTime: Single;
  end;

  ImGuiContextHookCallback = procedure(ctx: PImGuiContext; hook: PImGuiContextHook); cdecl;

  ImGuiContextHookType = (
    ImGuiContextHookType_NewFramePre = 0,
    ImGuiContextHookType_NewFramePost = 1,
    ImGuiContextHookType_EndFramePre = 2,
    ImGuiContextHookType_EndFramePost = 3,
    ImGuiContextHookType_RenderPre = 4,
    ImGuiContextHookType_RenderPost = 5,
    ImGuiContextHookType_Shutdown = 6,
    ImGuiContextHookType_PendingRemoval_ = 7);
  PImGuiContextHookType = ^ImGuiContextHookType;

  ImGuiContextHook = record
    HookId: ImGuiID;
    &Type: ImGuiContextHookType;
    Owner: ImGuiID;
    Callback: ImGuiContextHookCallback;
    UserData: Pointer;
  end;

  ImVector_ImGuiInputEvent = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiInputEvent;
  end;

  ImVector_ImGuiWindowStackData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiWindowStackData;
  end;

  ImVector_ImGuiColorMod = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiColorMod;
  end;

  ImVector_ImGuiStyleMod = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStyleMod;
  end;

  ImVector_ImGuiID = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiID;
  end;

  ImVector_ImGuiItemFlags = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiItemFlags;
  end;

  ImVector_ImGuiGroupData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiGroupData;
  end;

  ImVector_ImGuiPopupData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPopupData;
  end;

  ImVector_ImGuiNavTreeNodeData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiNavTreeNodeData;
  end;

  ImVector_ImGuiViewportPPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImGuiViewportP;
  end;

  ImVector_unsigned_char = record
    Size: Integer;
    Capacity: Integer;
    Data: PByte;
  end;

  ImVector_ImGuiListClipperData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiListClipperData;
  end;

  ImVector_ImGuiTableTempData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableTempData;
  end;

  ImVector_ImGuiTable = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTable;
  end;

  ImPool_ImGuiTable = record
    Buf: ImVector_ImGuiTable;
    Map: ImGuiStorage;
    FreeIdx: ImPoolIdx;
    AliveCount: ImPoolIdx;
  end;

  ImVector_ImGuiTabBar = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTabBar;
  end;

  ImPool_ImGuiTabBar = record
    Buf: ImVector_ImGuiTabBar;
    Map: ImGuiStorage;
    FreeIdx: ImPoolIdx;
    AliveCount: ImPoolIdx;
  end;

  ImVector_ImGuiPtrOrIndex = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPtrOrIndex;
  end;

  ImVector_ImGuiShrinkWidthItem = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiShrinkWidthItem;
  end;

  ImVector_ImGuiSettingsHandler = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiSettingsHandler;
  end;

  ImChunkStream_ImGuiWindowSettings = record
    Buf: ImVector_char;
  end;

  ImChunkStream_ImGuiTableSettings = record
    Buf: ImVector_char;
  end;

  ImVector_ImGuiContextHook = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiContextHook;
  end;

  ImGuiContext = record
    Initialized: Boolean;
    FontAtlasOwnedByContext: Boolean;
    IO: ImGuiIO;
    PlatformIO: ImGuiPlatformIO;
    Style: ImGuiStyle;
    ConfigFlagsCurrFrame: ImGuiConfigFlags;
    ConfigFlagsLastFrame: ImGuiConfigFlags;
    Font: PImFont;
    FontSize: Single;
    FontBaseSize: Single;
    DrawListSharedData: ImDrawListSharedData;
    Time: Double;
    FrameCount: Integer;
    FrameCountEnded: Integer;
    FrameCountPlatformEnded: Integer;
    FrameCountRendered: Integer;
    WithinFrameScope: Boolean;
    WithinFrameScopeWithImplicitWindow: Boolean;
    WithinEndChild: Boolean;
    GcCompactAll: Boolean;
    TestEngineHookItems: Boolean;
    TestEngine: Pointer;
    InputEventsQueue: ImVector_ImGuiInputEvent;
    InputEventsTrail: ImVector_ImGuiInputEvent;
    InputEventsNextMouseSource: ImGuiMouseSource;
    InputEventsNextEventId: ImU32;
    Windows: ImVector_ImGuiWindowPtr;
    WindowsFocusOrder: ImVector_ImGuiWindowPtr;
    WindowsTempSortBuffer: ImVector_ImGuiWindowPtr;
    CurrentWindowStack: ImVector_ImGuiWindowStackData;
    WindowsById: ImGuiStorage;
    WindowsActiveCount: Integer;
    WindowsHoverPadding: ImVec2;
    DebugBreakInWindow: ImGuiID;
    CurrentWindow: PImGuiWindow;
    HoveredWindow: PImGuiWindow;
    HoveredWindowUnderMovingWindow: PImGuiWindow;
    MovingWindow: PImGuiWindow;
    WheelingWindow: PImGuiWindow;
    WheelingWindowRefMousePos: ImVec2;
    WheelingWindowStartFrame: Integer;
    WheelingWindowScrolledFrame: Integer;
    WheelingWindowReleaseTimer: Single;
    WheelingWindowWheelRemainder: ImVec2;
    WheelingAxisAvg: ImVec2;
    DebugHookIdInfo: ImGuiID;
    HoveredId: ImGuiID;
    HoveredIdPreviousFrame: ImGuiID;
    HoveredIdAllowOverlap: Boolean;
    HoveredIdDisabled: Boolean;
    HoveredIdTimer: Single;
    HoveredIdNotActiveTimer: Single;
    ActiveId: ImGuiID;
    ActiveIdIsAlive: ImGuiID;
    ActiveIdTimer: Single;
    ActiveIdIsJustActivated: Boolean;
    ActiveIdAllowOverlap: Boolean;
    ActiveIdNoClearOnFocusLoss: Boolean;
    ActiveIdHasBeenPressedBefore: Boolean;
    ActiveIdHasBeenEditedBefore: Boolean;
    ActiveIdHasBeenEditedThisFrame: Boolean;
    ActiveIdClickOffset: ImVec2;
    ActiveIdWindow: PImGuiWindow;
    ActiveIdSource: ImGuiInputSource;
    ActiveIdMouseButton: Integer;
    ActiveIdPreviousFrame: ImGuiID;
    ActiveIdPreviousFrameIsAlive: Boolean;
    ActiveIdPreviousFrameHasBeenEditedBefore: Boolean;
    ActiveIdPreviousFrameWindow: PImGuiWindow;
    LastActiveId: ImGuiID;
    LastActiveIdTimer: Single;
    LastKeyModsChangeTime: Double;
    LastKeyModsChangeFromNoneTime: Double;
    LastKeyboardKeyPressTime: Double;
    KeysOwnerData: array [0..153] of ImGuiKeyOwnerData;
    KeysRoutingTable: ImGuiKeyRoutingTable;
    ActiveIdUsingNavDirMask: ImU32;
    ActiveIdUsingAllKeyboardKeys: Boolean;
    DebugBreakInShortcutRouting: ImGuiKeyChord;
    CurrentFocusScopeId: ImGuiID;
    CurrentItemFlags: ImGuiItemFlags;
    DebugLocateId: ImGuiID;
    NextItemData: ImGuiNextItemData;
    LastItemData: ImGuiLastItemData;
    NextWindowData: ImGuiNextWindowData;
    DebugShowGroupRects: Boolean;
    DebugFlashStyleColorIdx: ImGuiCol;
    ColorStack: ImVector_ImGuiColorMod;
    StyleVarStack: ImVector_ImGuiStyleMod;
    FontStack: ImVector_ImFontPtr;
    FocusScopeStack: ImVector_ImGuiID;
    ItemFlagsStack: ImVector_ImGuiItemFlags;
    GroupStack: ImVector_ImGuiGroupData;
    OpenPopupStack: ImVector_ImGuiPopupData;
    BeginPopupStack: ImVector_ImGuiPopupData;
    NavTreeNodeStack: ImVector_ImGuiNavTreeNodeData;
    BeginMenuCount: Integer;
    Viewports: ImVector_ImGuiViewportPPtr;
    CurrentDpiScale: Single;
    CurrentViewport: PImGuiViewportP;
    MouseViewport: PImGuiViewportP;
    MouseLastHoveredViewport: PImGuiViewportP;
    PlatformLastFocusedViewportId: ImGuiID;
    FallbackMonitor: ImGuiPlatformMonitor;
    ViewportCreatedCount: Integer;
    PlatformWindowsCreatedCount: Integer;
    ViewportFocusedStampCount: Integer;
    NavWindow: PImGuiWindow;
    NavId: ImGuiID;
    NavFocusScopeId: ImGuiID;
    NavActivateId: ImGuiID;
    NavActivateDownId: ImGuiID;
    NavActivatePressedId: ImGuiID;
    NavActivateFlags: ImGuiActivateFlags;
    NavJustMovedToId: ImGuiID;
    NavJustMovedToFocusScopeId: ImGuiID;
    NavJustMovedToKeyMods: ImGuiKeyChord;
    NavNextActivateId: ImGuiID;
    NavNextActivateFlags: ImGuiActivateFlags;
    NavInputSource: ImGuiInputSource;
    NavLayer: ImGuiNavLayer;
    NavLastValidSelectionUserData: ImGuiSelectionUserData;
    NavIdIsAlive: Boolean;
    NavMousePosDirty: Boolean;
    NavDisableHighlight: Boolean;
    NavDisableMouseHover: Boolean;
    NavAnyRequest: Boolean;
    NavInitRequest: Boolean;
    NavInitRequestFromMove: Boolean;
    NavInitResult: ImGuiNavItemData;
    NavMoveSubmitted: Boolean;
    NavMoveScoringItems: Boolean;
    NavMoveForwardToNextFrame: Boolean;
    NavMoveFlags: ImGuiNavMoveFlags;
    NavMoveScrollFlags: ImGuiScrollFlags;
    NavMoveKeyMods: ImGuiKeyChord;
    NavMoveDir: ImGuiDir;
    NavMoveDirForDebug: ImGuiDir;
    NavMoveClipDir: ImGuiDir;
    NavScoringRect: ImRect;
    NavScoringNoClipRect: ImRect;
    NavScoringDebugCount: Integer;
    NavTabbingDir: Integer;
    NavTabbingCounter: Integer;
    NavMoveResultLocal: ImGuiNavItemData;
    NavMoveResultLocalVisible: ImGuiNavItemData;
    NavMoveResultOther: ImGuiNavItemData;
    NavTabbingResultFirst: ImGuiNavItemData;
    ConfigNavWindowingKeyNext: ImGuiKeyChord;
    ConfigNavWindowingKeyPrev: ImGuiKeyChord;
    NavWindowingTarget: PImGuiWindow;
    NavWindowingTargetAnim: PImGuiWindow;
    NavWindowingListWindow: PImGuiWindow;
    NavWindowingTimer: Single;
    NavWindowingHighlightAlpha: Single;
    NavWindowingToggleLayer: Boolean;
    NavWindowingAccumDeltaPos: ImVec2;
    NavWindowingAccumDeltaSize: ImVec2;
    DimBgRatio: Single;
    DragDropActive: Boolean;
    DragDropWithinSource: Boolean;
    DragDropWithinTarget: Boolean;
    DragDropSourceFlags: ImGuiDragDropFlags;
    DragDropSourceFrameCount: Integer;
    DragDropMouseButton: Integer;
    DragDropPayload: ImGuiPayload;
    DragDropTargetRect: ImRect;
    DragDropTargetClipRect: ImRect;
    DragDropTargetId: ImGuiID;
    DragDropAcceptFlags: ImGuiDragDropFlags;
    DragDropAcceptIdCurrRectSurface: Single;
    DragDropAcceptIdCurr: ImGuiID;
    DragDropAcceptIdPrev: ImGuiID;
    DragDropAcceptFrameCount: Integer;
    DragDropHoldJustPressedId: ImGuiID;
    DragDropPayloadBufHeap: ImVector_unsigned_char;
    DragDropPayloadBufLocal: array [0..15] of Byte;
    ClipperTempDataStacked: Integer;
    ClipperTempData: ImVector_ImGuiListClipperData;
    CurrentTable: PImGuiTable;
    DebugBreakInTable: ImGuiID;
    TablesTempDataStacked: Integer;
    TablesTempData: ImVector_ImGuiTableTempData;
    Tables: ImPool_ImGuiTable;
    TablesLastTimeActive: ImVector_float;
    DrawChannelsTempMergeBuffer: ImVector_ImDrawChannel;
    CurrentTabBar: PImGuiTabBar;
    TabBars: ImPool_ImGuiTabBar;
    CurrentTabBarStack: ImVector_ImGuiPtrOrIndex;
    ShrinkWidthBuffer: ImVector_ImGuiShrinkWidthItem;
    HoverItemDelayId: ImGuiID;
    HoverItemDelayIdPreviousFrame: ImGuiID;
    HoverItemDelayTimer: Single;
    HoverItemDelayClearTimer: Single;
    HoverItemUnlockedStationaryId: ImGuiID;
    HoverWindowUnlockedStationaryId: ImGuiID;
    MouseCursor: ImGuiMouseCursor;
    MouseStationaryTimer: Single;
    MouseLastValidPos: ImVec2;
    InputTextState: ImGuiInputTextState;
    InputTextDeactivatedState: ImGuiInputTextDeactivatedState;
    InputTextPasswordFont: ImFont;
    TempInputId: ImGuiID;
    ColorEditOptions: ImGuiColorEditFlags;
    ColorEditCurrentID: ImGuiID;
    ColorEditSavedID: ImGuiID;
    ColorEditSavedHue: Single;
    ColorEditSavedSat: Single;
    ColorEditSavedColor: ImU32;
    ColorPickerRef: ImVec4;
    ComboPreviewData: ImGuiComboPreviewData;
    WindowResizeBorderExpectedRect: ImRect;
    WindowResizeRelativeMode: Boolean;
    SliderGrabClickOffset: Single;
    SliderCurrentAccum: Single;
    SliderCurrentAccumDirty: Boolean;
    DragCurrentAccumDirty: Boolean;
    DragCurrentAccum: Single;
    DragSpeedDefaultRatio: Single;
    ScrollbarClickDeltaToGrabCenter: Single;
    DisabledAlphaBackup: Single;
    DisabledStackSize: Smallint;
    LockMarkEdited: Smallint;
    TooltipOverrideCount: Smallint;
    ClipboardHandlerData: ImVector_char;
    MenusIdSubmittedThisFrame: ImVector_ImGuiID;
    TypingSelectState: ImGuiTypingSelectState;
    PlatformImeData: ImGuiPlatformImeData;
    PlatformImeDataPrev: ImGuiPlatformImeData;
    PlatformImeViewport: ImGuiID;
    DockContext: ImGuiDockContext;
    DockNodeWindowMenuHandler: procedure(ctx: PImGuiContext; node: PImGuiDockNode; tab_bar: PImGuiTabBar); cdecl;
    SettingsLoaded: Boolean;
    SettingsDirtyTimer: Single;
    SettingsIniData: ImGuiTextBuffer;
    SettingsHandlers: ImVector_ImGuiSettingsHandler;
    SettingsWindows: ImChunkStream_ImGuiWindowSettings;
    SettingsTables: ImChunkStream_ImGuiTableSettings;
    Hooks: ImVector_ImGuiContextHook;
    HookIdNext: ImGuiID;
    LocalizationTable: array [0..10] of PUTF8Char;
    LogEnabled: Boolean;
    LogType: ImGuiLogType;
    LogFile: ImFileHandle;
    LogBuffer: ImGuiTextBuffer;
    LogNextPrefix: PUTF8Char;
    LogNextSuffix: PUTF8Char;
    LogLinePosY: Single;
    LogLineFirstItem: Boolean;
    LogDepthRef: Integer;
    LogDepthToExpand: Integer;
    LogDepthToExpandDefault: Integer;
    DebugLogFlags: ImGuiDebugLogFlags;
    DebugLogBuf: ImGuiTextBuffer;
    DebugLogIndex: ImGuiTextIndex;
    DebugLogAutoDisableFlags: ImGuiDebugLogFlags;
    DebugLogAutoDisableFrames: ImU8;
    DebugLocateFrames: ImU8;
    DebugBreakInLocateId: Boolean;
    DebugBreakKeyChord: ImGuiKeyChord;
    DebugBeginReturnValueCullDepth: ImS8;
    DebugItemPickerActive: Boolean;
    DebugItemPickerMouseButton: ImU8;
    DebugItemPickerBreakId: ImGuiID;
    DebugFlashStyleColorTime: Single;
    DebugFlashStyleColorBackup: ImVec4;
    DebugMetricsConfig: ImGuiMetricsConfig;
    DebugIDStackTool: ImGuiIDStackTool;
    DebugAllocInfo: ImGuiDebugAllocInfo;
    DebugHoveredDockNode: PImGuiDockNode;
    FramerateSecPerFrame: array [0..59] of Single;
    FramerateSecPerFrameIdx: Integer;
    FramerateSecPerFrameCount: Integer;
    FramerateSecPerFrameAccum: Single;
    WantCaptureMouseNextFrame: Integer;
    WantCaptureKeyboardNextFrame: Integer;
    WantTextInputNextFrame: Integer;
    TempBuffer: ImVector_char;
  end;

  ImGuiWindowTempData = record
    CursorPos: ImVec2;
    CursorPosPrevLine: ImVec2;
    CursorStartPos: ImVec2;
    CursorMaxPos: ImVec2;
    IdealMaxPos: ImVec2;
    CurrLineSize: ImVec2;
    PrevLineSize: ImVec2;
    CurrLineTextBaseOffset: Single;
    PrevLineTextBaseOffset: Single;
    IsSameLine: Boolean;
    IsSetPos: Boolean;
    Indent: ImVec1;
    ColumnsOffset: ImVec1;
    GroupOffset: ImVec1;
    CursorStartPosLossyness: ImVec2;
    NavLayerCurrent: ImGuiNavLayer;
    NavLayersActiveMask: Smallint;
    NavLayersActiveMaskNext: Smallint;
    NavIsScrollPushableX: Boolean;
    NavHideHighlightOneFrame: Boolean;
    NavWindowHasScrollY: Boolean;
    MenuBarAppending: Boolean;
    MenuBarOffset: ImVec2;
    MenuColumns: ImGuiMenuColumns;
    TreeDepth: Integer;
    TreeJumpToParentOnPopMask: ImU32;
    ChildWindows: ImVector_ImGuiWindowPtr;
    StateStorage: PImGuiStorage;
    CurrentColumns: PImGuiOldColumns;
    CurrentTableIdx: Integer;
    LayoutType: ImGuiLayoutType;
    ParentLayoutType: ImGuiLayoutType;
    ItemWidth: Single;
    TextWrapPos: Single;
    ItemWidthStack: ImVector_float;
    TextWrapPosStack: ImVector_float;
  end;

  ImVector_ImGuiOldColumns = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiOldColumns;
  end;

  ImGuiWindow = record
    Ctx: PImGuiContext;
    Name: PUTF8Char;
    ID: ImGuiID;
    Flags: ImGuiWindowFlags;
    FlagsPreviousFrame: ImGuiWindowFlags;
    ChildFlags: ImGuiChildFlags;
    WindowClass: ImGuiWindowClass;
    Viewport: PImGuiViewportP;
    ViewportId: ImGuiID;
    ViewportPos: ImVec2;
    ViewportAllowPlatformMonitorExtend: Integer;
    Pos: ImVec2;
    Size: ImVec2;
    SizeFull: ImVec2;
    ContentSize: ImVec2;
    ContentSizeIdeal: ImVec2;
    ContentSizeExplicit: ImVec2;
    WindowPadding: ImVec2;
    WindowRounding: Single;
    WindowBorderSize: Single;
    DecoOuterSizeX1: Single;
    DecoOuterSizeY1: Single;
    DecoOuterSizeX2: Single;
    DecoOuterSizeY2: Single;
    DecoInnerSizeX1: Single;
    DecoInnerSizeY1: Single;
    NameBufLen: Integer;
    MoveId: ImGuiID;
    TabId: ImGuiID;
    ChildId: ImGuiID;
    Scroll: ImVec2;
    ScrollMax: ImVec2;
    ScrollTarget: ImVec2;
    ScrollTargetCenterRatio: ImVec2;
    ScrollTargetEdgeSnapDist: ImVec2;
    ScrollbarSizes: ImVec2;
    ScrollbarX: Boolean;
    ScrollbarY: Boolean;
    ViewportOwned: Boolean;
    Active: Boolean;
    WasActive: Boolean;
    WriteAccessed: Boolean;
    Collapsed: Boolean;
    WantCollapseToggle: Boolean;
    SkipItems: Boolean;
    Appearing: Boolean;
    Hidden: Boolean;
    IsFallbackWindow: Boolean;
    IsExplicitChild: Boolean;
    HasCloseButton: Boolean;
    ResizeBorderHovered: UTF8Char;
    ResizeBorderHeld: UTF8Char;
    BeginCount: Smallint;
    BeginCountPreviousFrame: Smallint;
    BeginOrderWithinParent: Smallint;
    BeginOrderWithinContext: Smallint;
    FocusOrder: Smallint;
    PopupId: ImGuiID;
    AutoFitFramesX: ImS8;
    AutoFitFramesY: ImS8;
    AutoFitOnlyGrows: Boolean;
    AutoPosLastDirection: ImGuiDir;
    HiddenFramesCanSkipItems: ImS8;
    HiddenFramesCannotSkipItems: ImS8;
    HiddenFramesForRenderOnly: ImS8;
    DisableInputsFrames: ImS8;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SetWindowPosAllowFlags: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
    property SetWindowSizeAllowFlags: Cardinal index $0808 read GetData0Value write SetData0Value; // 8 bits at offset 8 in Data0
    property SetWindowCollapsedAllowFlags: Cardinal index $1008 read GetData0Value write SetData0Value; // 8 bits at offset 16 in Data0
    property SetWindowDockAllowFlags: Cardinal index $1808 read GetData0Value write SetData0Value; // 8 bits at offset 24 in Data0
  var
    SetWindowPosVal: ImVec2;
    SetWindowPosPivot: ImVec2;
    IDStack: ImVector_ImGuiID;
    DC: ImGuiWindowTempData;
    OuterRectClipped: ImRect;
    InnerRect: ImRect;
    InnerClipRect: ImRect;
    WorkRect: ImRect;
    ParentWorkRect: ImRect;
    ClipRect: ImRect;
    ContentRegionRect: ImRect;
    HitTestHoleSize: ImVec2ih;
    HitTestHoleOffset: ImVec2ih;
    LastFrameActive: Integer;
    LastFrameJustFocused: Integer;
    LastTimeActive: Single;
    ItemWidthDefault: Single;
    StateStorage: ImGuiStorage;
    ColumnsStorage: ImVector_ImGuiOldColumns;
    FontWindowScale: Single;
    FontDpiScale: Single;
    SettingsOffset: Integer;
    DrawList: PImDrawList;
    DrawListInst: ImDrawList;
    ParentWindow: PImGuiWindow;
    ParentWindowInBeginStack: PImGuiWindow;
    RootWindow: PImGuiWindow;
    RootWindowPopupTree: PImGuiWindow;
    RootWindowDockTree: PImGuiWindow;
    RootWindowForTitleBarHighlight: PImGuiWindow;
    RootWindowForNav: PImGuiWindow;
    NavLastChildNavWindow: PImGuiWindow;
    NavLastIds: array [0..1] of ImGuiID;
    NavRectRel: array [0..1] of ImRect;
    NavPreferredScoringPosRel: array [0..1] of ImVec2;
    NavRootFocusScopeId: ImGuiID;
    MemoryDrawListIdxCapacity: Integer;
    MemoryDrawListVtxCapacity: Integer;
    MemoryCompacted: Boolean;
  private
    Data1: Cardinal;
    function GetData1Value(const AIndex: Integer): Cardinal;
    procedure SetData1Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property DockIsActive: Cardinal index $1 read GetData1Value write SetData1Value; // 1 bits at offset 0 in Data1
    property DockNodeIsVisible: Cardinal index $101 read GetData1Value write SetData1Value; // 1 bits at offset 1 in Data1
    property DockTabIsVisible: Cardinal index $201 read GetData1Value write SetData1Value; // 1 bits at offset 2 in Data1
    property DockTabWantClose: Cardinal index $301 read GetData1Value write SetData1Value; // 1 bits at offset 3 in Data1
  var
    DockOrder: Smallint;
    DockStyle: ImGuiWindowDockStyle;
    DockNode: PImGuiDockNode;
    DockNodeAsHost: PImGuiDockNode;
    DockId: ImGuiID;
    DockTabItemStatusFlags: ImGuiItemStatusFlags;
    DockTabItemRect: ImRect;
  end;

  ImGuiTabBarFlagsPrivate_ = (
    ImGuiTabBarFlags_DockNode = 1048576,
    ImGuiTabBarFlags_IsFocused = 2097152,
    ImGuiTabBarFlags_SaveSettings = 4194304);
  PImGuiTabBarFlagsPrivate_ = ^ImGuiTabBarFlagsPrivate_;

  ImGuiTabItemFlagsPrivate_ = (
    ImGuiTabItemFlags_SectionMask_ = 192,
    ImGuiTabItemFlags_NoCloseButton = 1048576,
    ImGuiTabItemFlags_Button = 2097152,
    ImGuiTabItemFlags_Unsorted = 4194304);
  PImGuiTabItemFlagsPrivate_ = ^ImGuiTabItemFlagsPrivate_;

  ImGuiTabItem = record
    ID: ImGuiID;
    Flags: ImGuiTabItemFlags;
    Window: PImGuiWindow;
    LastFrameVisible: Integer;
    LastFrameSelected: Integer;
    Offset: Single;
    Width: Single;
    ContentWidth: Single;
    RequestedWidth: Single;
    NameOffset: ImS32;
    BeginOrder: ImS16;
    IndexDuringLayout: ImS16;
    WantClose: Boolean;
  end;

  ImVector_ImGuiTabItem = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTabItem;
  end;

  ImGuiTabBar = record
    Tabs: ImVector_ImGuiTabItem;
    Flags: ImGuiTabBarFlags;
    ID: ImGuiID;
    SelectedTabId: ImGuiID;
    NextSelectedTabId: ImGuiID;
    VisibleTabId: ImGuiID;
    CurrFrameVisible: Integer;
    PrevFrameVisible: Integer;
    BarRect: ImRect;
    CurrTabsContentsHeight: Single;
    PrevTabsContentsHeight: Single;
    WidthAllTabs: Single;
    WidthAllTabsIdeal: Single;
    ScrollingAnim: Single;
    ScrollingTarget: Single;
    ScrollingTargetDistToVisibility: Single;
    ScrollingSpeed: Single;
    ScrollingRectMinX: Single;
    ScrollingRectMaxX: Single;
    SeparatorMinX: Single;
    SeparatorMaxX: Single;
    ReorderRequestTabId: ImGuiID;
    ReorderRequestOffset: ImS16;
    BeginCount: ImS8;
    WantLayout: Boolean;
    VisibleTabWasSubmitted: Boolean;
    TabsAddedNew: Boolean;
    TabsActiveCount: ImS16;
    LastTabItemIdx: ImS16;
    ItemSpacingY: Single;
    FramePadding: ImVec2;
    BackupCursorPos: ImVec2;
    TabsNames: ImGuiTextBuffer;
  end;

  ImGuiTableColumnIdx = ImS16;
  PImGuiTableColumnIdx = ^ImGuiTableColumnIdx;
  ImGuiTableDrawChannelIdx = ImU16;

  ImGuiTableColumn = record
    Flags: ImGuiTableColumnFlags;
    WidthGiven: Single;
    MinX: Single;
    MaxX: Single;
    WidthRequest: Single;
    WidthAuto: Single;
    StretchWeight: Single;
    InitStretchWeightOrWidth: Single;
    ClipRect: ImRect;
    UserID: ImGuiID;
    WorkMinX: Single;
    WorkMaxX: Single;
    ItemWidth: Single;
    ContentMaxXFrozen: Single;
    ContentMaxXUnfrozen: Single;
    ContentMaxXHeadersUsed: Single;
    ContentMaxXHeadersIdeal: Single;
    NameOffset: ImS16;
    DisplayOrder: ImGuiTableColumnIdx;
    IndexWithinEnabledSet: ImGuiTableColumnIdx;
    PrevEnabledColumn: ImGuiTableColumnIdx;
    NextEnabledColumn: ImGuiTableColumnIdx;
    SortOrder: ImGuiTableColumnIdx;
    DrawChannelCurrent: ImGuiTableDrawChannelIdx;
    DrawChannelFrozen: ImGuiTableDrawChannelIdx;
    DrawChannelUnfrozen: ImGuiTableDrawChannelIdx;
    IsEnabled: Boolean;
    IsUserEnabled: Boolean;
    IsUserEnabledNextFrame: Boolean;
    IsVisibleX: Boolean;
    IsVisibleY: Boolean;
    IsRequestOutput: Boolean;
    IsSkipItems: Boolean;
    IsPreserveWidthAuto: Boolean;
    NavLayerCurrent: ImS8;
    AutoFitQueue: ImU8;
    CannotSkipItemsQueue: ImU8;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SortDirection: Cardinal index $2 read GetData0Value write SetData0Value; // 2 bits at offset 0 in Data0
    property SortDirectionsAvailCount: Cardinal index $202 read GetData0Value write SetData0Value; // 2 bits at offset 2 in Data0
    property SortDirectionsAvailMask: Cardinal index $404 read GetData0Value write SetData0Value; // 4 bits at offset 4 in Data0
  var
    SortDirectionsAvailList: ImU8;
  end;

  ImGuiTableCellData = record
    BgColor: ImU32;
    Column: ImGuiTableColumnIdx;
  end;

  ImGuiTableInstanceData = record
    TableInstanceID: ImGuiID;
    LastOuterHeight: Single;
    LastTopHeadersRowHeight: Single;
    LastFrozenHeight: Single;
    HoveredRowLast: Integer;
    HoveredRowNext: Integer;
  end;

  ImSpan_ImGuiTableColumn = record
    Data: PImGuiTableColumn;
    DataEnd: PImGuiTableColumn;
  end;

  ImSpan_ImGuiTableColumnIdx = record
    Data: PImGuiTableColumnIdx;
    DataEnd: PImGuiTableColumnIdx;
  end;

  ImSpan_ImGuiTableCellData = record
    Data: PImGuiTableCellData;
    DataEnd: PImGuiTableCellData;
  end;

  ImVector_ImGuiTableInstanceData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableInstanceData;
  end;

  ImVector_ImGuiTableColumnSortSpecs = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableColumnSortSpecs;
  end;

  ImGuiTable = record
    ID: ImGuiID;
    Flags: ImGuiTableFlags;
    RawData: Pointer;
    TempData: PImGuiTableTempData;
    Columns: ImSpan_ImGuiTableColumn;
    DisplayOrderToIndex: ImSpan_ImGuiTableColumnIdx;
    RowCellData: ImSpan_ImGuiTableCellData;
    EnabledMaskByDisplayOrder: ImBitArrayPtr;
    EnabledMaskByIndex: ImBitArrayPtr;
    VisibleMaskByIndex: ImBitArrayPtr;
    SettingsLoadedFlags: ImGuiTableFlags;
    SettingsOffset: Integer;
    LastFrameActive: Integer;
    ColumnsCount: Integer;
    CurrentRow: Integer;
    CurrentColumn: Integer;
    InstanceCurrent: ImS16;
    InstanceInteracted: ImS16;
    RowPosY1: Single;
    RowPosY2: Single;
    RowMinHeight: Single;
    RowCellPaddingY: Single;
    RowTextBaseline: Single;
    RowIndentOffsetX: Single;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property RowFlags: Cardinal index $0010 read GetData0Value write SetData0Value; // 16 bits at offset 0 in Data0
    property LastRowFlags: Cardinal index $1010 read GetData0Value write SetData0Value; // 16 bits at offset 16 in Data0
  var
    RowBgColorCounter: Integer;
    RowBgColor: array [0..1] of ImU32;
    BorderColorStrong: ImU32;
    BorderColorLight: ImU32;
    BorderX1: Single;
    BorderX2: Single;
    HostIndentX: Single;
    MinColumnWidth: Single;
    OuterPaddingX: Single;
    CellPaddingX: Single;
    CellSpacingX1: Single;
    CellSpacingX2: Single;
    InnerWidth: Single;
    ColumnsGivenWidth: Single;
    ColumnsAutoFitWidth: Single;
    ColumnsStretchSumWeights: Single;
    ResizedColumnNextWidth: Single;
    ResizeLockMinContentsX2: Single;
    RefScale: Single;
    AngledHeadersHeight: Single;
    AngledHeadersSlope: Single;
    OuterRect: ImRect;
    InnerRect: ImRect;
    WorkRect: ImRect;
    InnerClipRect: ImRect;
    BgClipRect: ImRect;
    Bg0ClipRectForDrawCmd: ImRect;
    Bg2ClipRectForDrawCmd: ImRect;
    HostClipRect: ImRect;
    HostBackupInnerClipRect: ImRect;
    OuterWindow: PImGuiWindow;
    InnerWindow: PImGuiWindow;
    ColumnsNames: ImGuiTextBuffer;
    DrawSplitter: PImDrawListSplitter;
    InstanceDataFirst: ImGuiTableInstanceData;
    InstanceDataExtra: ImVector_ImGuiTableInstanceData;
    SortSpecsSingle: ImGuiTableColumnSortSpecs;
    SortSpecsMulti: ImVector_ImGuiTableColumnSortSpecs;
    SortSpecs: ImGuiTableSortSpecs;
    SortSpecsCount: ImGuiTableColumnIdx;
    ColumnsEnabledCount: ImGuiTableColumnIdx;
    ColumnsEnabledFixedCount: ImGuiTableColumnIdx;
    DeclColumnsCount: ImGuiTableColumnIdx;
    AngledHeadersCount: ImGuiTableColumnIdx;
    HoveredColumnBody: ImGuiTableColumnIdx;
    HoveredColumnBorder: ImGuiTableColumnIdx;
    HighlightColumnHeader: ImGuiTableColumnIdx;
    AutoFitSingleColumn: ImGuiTableColumnIdx;
    ResizedColumn: ImGuiTableColumnIdx;
    LastResizedColumn: ImGuiTableColumnIdx;
    HeldHeaderColumn: ImGuiTableColumnIdx;
    ReorderColumn: ImGuiTableColumnIdx;
    ReorderColumnDir: ImGuiTableColumnIdx;
    LeftMostEnabledColumn: ImGuiTableColumnIdx;
    RightMostEnabledColumn: ImGuiTableColumnIdx;
    LeftMostStretchedColumn: ImGuiTableColumnIdx;
    RightMostStretchedColumn: ImGuiTableColumnIdx;
    ContextPopupColumn: ImGuiTableColumnIdx;
    FreezeRowsRequest: ImGuiTableColumnIdx;
    FreezeRowsCount: ImGuiTableColumnIdx;
    FreezeColumnsRequest: ImGuiTableColumnIdx;
    FreezeColumnsCount: ImGuiTableColumnIdx;
    RowCellDataCurrent: ImGuiTableColumnIdx;
    DummyDrawChannel: ImGuiTableDrawChannelIdx;
    Bg2DrawChannelCurrent: ImGuiTableDrawChannelIdx;
    Bg2DrawChannelUnfrozen: ImGuiTableDrawChannelIdx;
    IsLayoutLocked: Boolean;
    IsInsideRow: Boolean;
    IsInitializing: Boolean;
    IsSortSpecsDirty: Boolean;
    IsUsingHeaders: Boolean;
    IsContextPopupOpen: Boolean;
    DisableDefaultContextMenu: Boolean;
    IsSettingsRequestLoad: Boolean;
    IsSettingsDirty: Boolean;
    IsDefaultDisplayOrder: Boolean;
    IsResetAllRequest: Boolean;
    IsResetDisplayOrderRequest: Boolean;
    IsUnfrozenRows: Boolean;
    IsDefaultSizingPolicy: Boolean;
    IsActiveIdAliveBeforeTable: Boolean;
    IsActiveIdInTable: Boolean;
    HasScrollbarYCurr: Boolean;
    HasScrollbarYPrev: Boolean;
    MemoryCompacted: Boolean;
    HostSkipItems: Boolean;
  end;

  ImGuiTableTempData = record
    TableIndex: Integer;
    LastTimeActive: Single;
    AngledheadersExtraWidth: Single;
    UserOuterSize: ImVec2;
    DrawSplitter: ImDrawListSplitter;
    HostBackupWorkRect: ImRect;
    HostBackupParentWorkRect: ImRect;
    HostBackupPrevLineSize: ImVec2;
    HostBackupCurrLineSize: ImVec2;
    HostBackupCursorMaxPos: ImVec2;
    HostBackupColumnsOffset: ImVec1;
    HostBackupItemWidth: Single;
    HostBackupItemWidthStackSize: Integer;
  end;

  ImGuiTableColumnSettings = record
    WidthOrWeight: Single;
    UserID: ImGuiID;
    Index: ImGuiTableColumnIdx;
    DisplayOrder: ImGuiTableColumnIdx;
    SortOrder: ImGuiTableColumnIdx;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SortDirection: Cardinal index $2 read GetData0Value write SetData0Value; // 2 bits at offset 0 in Data0
    property IsEnabled: Cardinal index $201 read GetData0Value write SetData0Value; // 1 bits at offset 2 in Data0
    property IsStretch: Cardinal index $301 read GetData0Value write SetData0Value; // 1 bits at offset 3 in Data0
  end;

  ImGuiTableSettings = record
    ID: ImGuiID;
    SaveFlags: ImGuiTableFlags;
    RefScale: Single;
    ColumnsCount: ImGuiTableColumnIdx;
    ColumnsCountMax: ImGuiTableColumnIdx;
    WantApply: Boolean;
  end;

  ImFontBuilderIO = record
    FontBuilder_Build: function(atlas: PImFontAtlas): Boolean; cdecl;
  end;

const
  PLM_DEMUX_PACKET_PRIVATE: Integer = $BD;
  PLM_DEMUX_PACKET_AUDIO_1: Integer = $C0;
  PLM_DEMUX_PACKET_AUDIO_2: Integer = $C1;
  PLM_DEMUX_PACKET_AUDIO_3: Integer = $C2;
  PLM_DEMUX_PACKET_AUDIO_4: Integer = $C2;
  PLM_DEMUX_PACKET_VIDEO_1: Integer = $E0;

////////////////////////////////////////////////////////////
/// \brief Create an empty buffer
///
/// \return A new sfBuffer object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfBuffer_create(): PsfBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_create';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing buffer
///
/// \param buffer Buffer to delete
///
////////////////////////////////////////////////////////////
procedure sfBuffer_destroy(buffer: PsfBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_destroy';

////////////////////////////////////////////////////////////
/// \brief Return the size of a buffer
///
/// \param buffer Buffer object
///
/// \return Size in bytes
///
////////////////////////////////////////////////////////////
function sfBuffer_getSize(const buffer: PsfBuffer): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_getSize';

////////////////////////////////////////////////////////////
/// \brief Get a read-only pointer to the array of bytes of a buffer
///
/// \param buffer Buffer object
///
/// \return Read-only pointer to the array of bytes
///
////////////////////////////////////////////////////////////
function sfBuffer_getData(const buffer: PsfBuffer): PsfUint8; cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_getData';

////////////////////////////////////////////////////////////
/// \brief Return a time value as a number of seconds
///
/// \param time Time value
///
/// \return Time in seconds
///
////////////////////////////////////////////////////////////
function sfTime_asSeconds(time: sfTime): Single; cdecl;
  external PSFML_DLL name _PU + 'sfTime_asSeconds';

////////////////////////////////////////////////////////////
/// \brief Return a time value as a number of milliseconds
///
/// \param time Time value
///
/// \return Time in milliseconds
///
////////////////////////////////////////////////////////////
function sfTime_asMilliseconds(time: sfTime): sfInt32; cdecl;
  external PSFML_DLL name _PU + 'sfTime_asMilliseconds';

////////////////////////////////////////////////////////////
/// \brief Return a time value as a number of microseconds
///
/// \param time Time value
///
/// \return Time in microseconds
///
////////////////////////////////////////////////////////////
function sfTime_asMicroseconds(time: sfTime): sfInt64; cdecl;
  external PSFML_DLL name _PU + 'sfTime_asMicroseconds';

////////////////////////////////////////////////////////////
/// \brief Construct a time value from a number of seconds
///
/// \param amount Number of seconds
///
/// \return Time value constructed from the amount of seconds
///
////////////////////////////////////////////////////////////
function sfSeconds(amount: Single): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSeconds';

////////////////////////////////////////////////////////////
/// \brief Construct a time value from a number of milliseconds
///
/// \param amount Number of milliseconds
///
/// \return Time value constructed from the amount of milliseconds
///
////////////////////////////////////////////////////////////
function sfMilliseconds(amount: sfInt32): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMilliseconds';

////////////////////////////////////////////////////////////
/// \brief Construct a time value from a number of microseconds
///
/// \param amount Number of microseconds
///
/// \return Time value constructed from the amount of microseconds
///
////////////////////////////////////////////////////////////
function sfMicroseconds(amount: sfInt64): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMicroseconds';

////////////////////////////////////////////////////////////
/// \brief Create a new clock and start it
///
/// \return A new sfClock object
///
////////////////////////////////////////////////////////////
function sfClock_create(): PsfClock; cdecl;
  external PSFML_DLL name _PU + 'sfClock_create';

////////////////////////////////////////////////////////////
/// \brief Create a new clock by copying an existing one
///
/// \param clock Clock to copy
///
/// \return A new sfClock object which is a copy of \a clock
///
////////////////////////////////////////////////////////////
function sfClock_copy(const clock: PsfClock): PsfClock; cdecl;
  external PSFML_DLL name _PU + 'sfClock_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy a clock
///
/// \param clock Clock to destroy
///
////////////////////////////////////////////////////////////
procedure sfClock_destroy(clock: PsfClock); cdecl;
  external PSFML_DLL name _PU + 'sfClock_destroy';

////////////////////////////////////////////////////////////
/// \brief Get the time elapsed in a clock
///
/// This function returns the time elapsed since the last call
/// to sfClock_restart (or the construction of the object if
/// sfClock_restart has not been called).
///
/// \param clock Clock object
///
/// \return Time elapsed
///
////////////////////////////////////////////////////////////
function sfClock_getElapsedTime(const clock: PsfClock): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfClock_getElapsedTime';

////////////////////////////////////////////////////////////
/// \brief Restart a clock
///
/// This function puts the time counter back to zero.
/// It also returns the time elapsed since the clock was started.
///
/// \param clock Clock object
///
/// \return Time elapsed
///
////////////////////////////////////////////////////////////
function sfClock_restart(clock: PsfClock): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfClock_restart';

////////////////////////////////////////////////////////////
/// \brief Create a new mutex
///
/// \return A new sfMutex object
///
////////////////////////////////////////////////////////////
function sfMutex_create(): PsfMutex; cdecl;
  external PSFML_DLL name _PU + 'sfMutex_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a mutex
///
/// \param mutex Mutex to destroy
///
////////////////////////////////////////////////////////////
procedure sfMutex_destroy(mutex: PsfMutex); cdecl;
  external PSFML_DLL name _PU + 'sfMutex_destroy';

////////////////////////////////////////////////////////////
/// \brief Lock a mutex
///
/// \param mutex Mutex object
///
////////////////////////////////////////////////////////////
procedure sfMutex_lock(mutex: PsfMutex); cdecl;
  external PSFML_DLL name _PU + 'sfMutex_lock';

////////////////////////////////////////////////////////////
/// \brief Unlock a mutex
///
/// \param mutex Mutex object
///
////////////////////////////////////////////////////////////
procedure sfMutex_unlock(mutex: PsfMutex); cdecl;
  external PSFML_DLL name _PU + 'sfMutex_unlock';

////////////////////////////////////////////////////////////
/// \brief Make the current thread sleep for a given duration
///
/// sfSleep is the best way to block a program or one of its
/// threads, as it doesn't consume any CPU power.
///
/// \param duration Time to sleep
///
////////////////////////////////////////////////////////////
procedure sfSleep(duration: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSleep';

type
  sfThread_create_function = procedure(p1: Pointer); cdecl;

////////////////////////////////////////////////////////////
/// \brief Create a new thread from a function pointer
///
/// Note: this does *not* run the thread, use sfThread_launch.
///
/// \param function Entry point of the thread
/// \param userData Custom data to pass to the thread function
///
/// \return A new sfThread object
///
////////////////////////////////////////////////////////////
function sfThread_create(&function: sfThread_create_function; userData: Pointer): PsfThread; cdecl;
  external PSFML_DLL name _PU + 'sfThread_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a thread
///
/// This function calls sfThread_wait, so that the internal thread
/// cannot survive after the sfThread object is destroyed.
///
/// \param thread Thread to destroy
///
////////////////////////////////////////////////////////////
procedure sfThread_destroy(thread: PsfThread); cdecl;
  external PSFML_DLL name _PU + 'sfThread_destroy';

////////////////////////////////////////////////////////////
/// \brief Run a thread
///
/// This function starts the entry point passed to the
/// thread's constructor, and returns immediately.
/// After this function returns, the thread's function is
/// running in parallel to the calling code.
///
/// \param thread Thread object
///
////////////////////////////////////////////////////////////
procedure sfThread_launch(thread: PsfThread); cdecl;
  external PSFML_DLL name _PU + 'sfThread_launch';

////////////////////////////////////////////////////////////
/// \brief Wait until a thread finishes
///
/// This function will block the execution until the
/// thread's function ends.
/// Warning: if the thread function never ends, the calling
/// thread will block forever.
/// If this function is called from its owner thread, it
/// returns without doing anything.
///
/// \param thread Thread object
///
////////////////////////////////////////////////////////////
procedure sfThread_wait(thread: PsfThread); cdecl;
  external PSFML_DLL name _PU + 'sfThread_wait';

////////////////////////////////////////////////////////////
/// \brief Terminate a thread
///
/// This function immediately stops the thread, without waiting
/// for its function to finish.
/// Terminating a thread with this function is not safe,
/// and can lead to local variables not being destroyed
/// on some operating systems. You should rather try to make
/// the thread function terminate by itself.
///
/// \param thread Thread object
///
////////////////////////////////////////////////////////////
procedure sfThread_terminate(thread: PsfThread); cdecl;
  external PSFML_DLL name _PU + 'sfThread_terminate';

////////////////////////////////////////////////////////////
/// \brief Change the global volume of all the sounds and musics
///
/// The volume is a number between 0 and 100; it is combined with
/// the individual volume of each sound / music.
/// The default value for the volume is 100 (maximum).
///
/// \param volume New global volume, in the range [0, 100]
///
////////////////////////////////////////////////////////////
procedure sfListener_setGlobalVolume(volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setGlobalVolume';

////////////////////////////////////////////////////////////
/// \brief Get the current value of the global volume
///
/// \return Current global volume, in the range [0, 100]
///
////////////////////////////////////////////////////////////
function sfListener_getGlobalVolume(): Single; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getGlobalVolume';

////////////////////////////////////////////////////////////
/// \brief Set the position of the listener in the scene
///
/// The default listener's position is (0, 0, 0).
///
/// \param position New position of the listener
///
////////////////////////////////////////////////////////////
procedure sfListener_setPosition(position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setPosition';

////////////////////////////////////////////////////////////
/// \brief Get the current position of the listener in the scene
///
/// \return The listener's position
///
////////////////////////////////////////////////////////////
function sfListener_getPosition(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of the forward vector in the scene
///
/// The direction (also called "at vector") is the vector
/// pointing forward from the listener's perspective. Together
/// with the up vector, it defines the 3D orientation of the
/// listener in the scene. The direction vector doesn't
/// have to be normalized.
/// The default listener's direction is (0, 0, -1).
///
/// \param direction New listener's direction
///
////////////////////////////////////////////////////////////
procedure sfListener_setDirection(direction: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setDirection';

////////////////////////////////////////////////////////////
/// \brief Get the current forward vector of the listener in the scene
///
/// \return Listener's forward vector (not normalized)
///
////////////////////////////////////////////////////////////
function sfListener_getDirection(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getDirection';

////////////////////////////////////////////////////////////
/// \brief Set the upward vector of the listener in the scene
///
/// The up vector is the vector that points upward from the
/// listener's perspective. Together with the direction, it
/// defines the 3D orientation of the listener in the scene.
/// The up vector doesn't have to be normalized.
/// The default listener's up vector is (0, 1, 0). It is usually
/// not necessary to change it, especially in 2D scenarios.
///
/// \param upVector New listener's up vector
///
////////////////////////////////////////////////////////////
procedure sfListener_setUpVector(upVector: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setUpVector';

////////////////////////////////////////////////////////////
/// \brief Get the current upward vector of the listener in the scene
///
/// \return Listener's upward vector (not normalized)
///
////////////////////////////////////////////////////////////
function sfListener_getUpVector(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getUpVector';

////////////////////////////////////////////////////////////
/// \brief Create a new music and load it from a file
///
/// This function doesn't start playing the music (call
/// sfMusic_play to do so).
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param filename Path of the music file to open
///
/// \return A new sfMusic object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfMusic_createFromFile(const filename: PUTF8Char): PsfMusic; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_createFromFile';

////////////////////////////////////////////////////////////
/// \brief Create a new music and load it from a file in memory
///
/// This function doesn't start playing the music (call
/// sfMusic_play to do so).
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param data        Pointer to the file data in memory
/// \param sizeInBytes Size of the data to load, in bytes
///
/// \return A new sfMusic object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfMusic_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt): PsfMusic; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_createFromMemory';

////////////////////////////////////////////////////////////
/// \brief Create a new music and load it from a custom stream
///
/// This function doesn't start playing the music (call
/// sfMusic_play to do so).
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param stream Source stream to read from
///
/// \return A new sfMusic object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_createFromStream';

////////////////////////////////////////////////////////////
/// \brief Destroy a music
///
/// \param music Music to destroy
///
////////////////////////////////////////////////////////////
procedure sfMusic_destroy(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_destroy';

////////////////////////////////////////////////////////////
/// \brief Set whether or not a music should loop after reaching the end
///
/// If set, the music will restart from beginning after
/// reaching the end and so on, until it is stopped or
/// sfMusic_setLoop(music, sfFalse) is called.
/// The default looping state for musics is false.
///
/// \param music Music object
/// \param loop  sfTrue to play in loop, sfFalse to play once
///
////////////////////////////////////////////////////////////
procedure sfMusic_setLoop(music: PsfMusic; loop: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setLoop';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a music is in loop mode
///
/// \param music Music object
///
/// \return sfTrue if the music is looping, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfMusic_getLoop(const music: PsfMusic): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getLoop';

////////////////////////////////////////////////////////////
/// \brief Get the total duration of a music
///
/// \param music Music object
///
/// \return Music duration
///
////////////////////////////////////////////////////////////
function sfMusic_getDuration(const music: PsfMusic): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getDuration';

////////////////////////////////////////////////////////////
/// \brief Get the positions of the of the sound's looping sequence
///
/// \return Loop Time position class.
///
/// \warning Since sfMusic_setLoopPoints() performs some adjustments on the
/// provided values and rounds them to internal samples, a call to
/// sfMusic_getLoopPoints() is not guaranteed to return the same times passed
/// into a previous call to sfMusic_setLoopPoints(). However, it is guaranteed
/// to return times that will map to the valid internal samples of
/// this Music if they are later passed to sfMusic_setLoopPoints().
///
/// \see setLoopPoints
///
////////////////////////////////////////////////////////////
function sfMusic_getLoopPoints(const music: PsfMusic): sfTimeSpan; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getLoopPoints';

////////////////////////////////////////////////////////////
/// \brief Sets the beginning and end of the sound's looping sequence using sf::Time
///
/// Loop points allow one to specify a pair of positions such that, when the music
/// is enabled for looping, it will seamlessly seek to the beginning whenever it
/// encounters the end. Valid ranges for timePoints.offset and timePoints.length are
/// [0, Dur) and (0, Dur-offset] respectively, where Dur is the value returned by sfMusic_getDuration().
/// Note that the EOF "loop point" from the end to the beginning of the stream is still honored,
/// in case the caller seeks to a point after the end of the loop range. This function can be
/// safely called at any point after a stream is opened, and will be applied to a playing sound
/// without affecting the current playing offset.
///
/// \warning Setting the loop points while the stream's status is Paused
/// will set its status to Stopped. The playing offset will be unaffected.
///
/// \param timePoints The definition of the loop. Can be any time points within the sound's length
///
/// \see getLoopPoints
///
////////////////////////////////////////////////////////////
procedure sfMusic_setLoopPoints(music: PsfMusic; timePoints: sfTimeSpan); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setLoopPoints';

////////////////////////////////////////////////////////////
/// \brief Start or resume playing a music
///
/// This function starts the music if it was stopped, resumes
/// it if it was paused, and restarts it from beginning if it
/// was it already playing.
/// This function uses its own thread so that it doesn't block
/// the rest of the program while the music is played.
///
/// \param music Music object
///
////////////////////////////////////////////////////////////
procedure sfMusic_play(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_play';

////////////////////////////////////////////////////////////
/// \brief Pause a music
///
/// This function pauses the music if it was playing,
/// otherwise (music already paused or stopped) it has no effect.
///
/// \param music Music object
///
////////////////////////////////////////////////////////////
procedure sfMusic_pause(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_pause';

////////////////////////////////////////////////////////////
/// \brief Stop playing a music
///
/// This function stops the music if it was playing or paused,
/// and does nothing if it was already stopped.
/// It also resets the playing position (unlike sfMusic_pause).
///
/// \param music Music object
///
////////////////////////////////////////////////////////////
procedure sfMusic_stop(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_stop';

////////////////////////////////////////////////////////////
/// \brief Return the number of channels of a music
///
/// 1 channel means a mono sound, 2 means stereo, etc.
///
/// \param music Music object
///
/// \return Number of channels
///
////////////////////////////////////////////////////////////
function sfMusic_getChannelCount(const music: PsfMusic): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getChannelCount';

////////////////////////////////////////////////////////////
/// \brief Get the sample rate of a music
///
/// The sample rate is the number of audio samples played per
/// second. The higher, the better the quality.
///
/// \param music Music object
///
/// \return Sample rate, in number of samples per second
///
////////////////////////////////////////////////////////////
function sfMusic_getSampleRate(const music: PsfMusic): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getSampleRate';

////////////////////////////////////////////////////////////
/// \brief Get the current status of a music (stopped, paused, playing)
///
/// \param music Music object
///
/// \return Current status
///
////////////////////////////////////////////////////////////
function sfMusic_getStatus(const music: PsfMusic): sfSoundStatus; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getStatus';

////////////////////////////////////////////////////////////
/// \brief Get the current playing position of a music
///
/// \param music Music object
///
/// \return Current playing position
///
////////////////////////////////////////////////////////////
function sfMusic_getPlayingOffset(const music: PsfMusic): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPlayingOffset';

////////////////////////////////////////////////////////////
/// \brief Set the pitch of a music
///
/// The pitch represents the perceived fundamental frequency
/// of a sound; thus you can make a music more acute or grave
/// by changing its pitch. A side effect of changing the pitch
/// is to modify the playing speed of the music as well.
/// The default value for the pitch is 1.
///
/// \param music Music object
/// \param pitch New pitch to apply to the music
///
////////////////////////////////////////////////////////////
procedure sfMusic_setPitch(music: PsfMusic; pitch: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPitch';

////////////////////////////////////////////////////////////
/// \brief Set the volume of a music
///
/// The volume is a value between 0 (mute) and 100 (full volume).
/// The default value for the volume is 100.
///
/// \param music  Music object
/// \param volume Volume of the music
///
////////////////////////////////////////////////////////////
procedure sfMusic_setVolume(music: PsfMusic; volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setVolume';

////////////////////////////////////////////////////////////
/// \brief Set the 3D position of a music in the audio scene
///
/// Only musics with one channel (mono musics) can be
/// spatialized.
/// The default position of a music is (0, 0, 0).
///
/// \param music    Music object
/// \param position Position of the music in the scene
///
////////////////////////////////////////////////////////////
procedure sfMusic_setPosition(music: PsfMusic; position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPosition';

////////////////////////////////////////////////////////////
/// \brief Make a musics's position relative to the listener or absolute
///
/// Making a music relative to the listener will ensure that it will always
/// be played the same way regardless the position of the listener.
/// This can be useful for non-spatialized musics, musics that are
/// produced by the listener, or musics attached to it.
/// The default value is false (position is absolute).
///
/// \param music    Music object
/// \param relative sfTrue to set the position relative, sfFalse to set it absolute
///
////////////////////////////////////////////////////////////
procedure sfMusic_setRelativeToListener(music: PsfMusic; relative: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setRelativeToListener';

////////////////////////////////////////////////////////////
/// \brief Set the minimum distance of a music
///
/// The "minimum distance" of a music is the maximum
/// distance at which it is heard at its maximum volume. Further
/// than the minimum distance, it will start to fade out according
/// to its attenuation factor. A value of 0 ("inside the head
/// of the listener") is an invalid value and is forbidden.
/// The default value of the minimum distance is 1.
///
/// \param music    Music object
/// \param distance New minimum distance of the music
///
////////////////////////////////////////////////////////////
procedure sfMusic_setMinDistance(music: PsfMusic; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setMinDistance';

////////////////////////////////////////////////////////////
/// \brief Set the attenuation factor of a music
///
/// The attenuation is a multiplicative factor which makes
/// the music more or less loud according to its distance
/// from the listener. An attenuation of 0 will produce a
/// non-attenuated music, i.e. its volume will always be the same
/// whether it is heard from near or from far. On the other hand,
/// an attenuation value such as 100 will make the music fade out
/// very quickly as it gets further from the listener.
/// The default value of the attenuation is 1.
///
/// \param music       Music object
/// \param attenuation New attenuation factor of the music
///
////////////////////////////////////////////////////////////
procedure sfMusic_setAttenuation(music: PsfMusic; attenuation: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setAttenuation';

////////////////////////////////////////////////////////////
/// \brief Change the current playing position of a music
///
/// The playing position can be changed when the music is
/// either paused or playing.
///
/// \param music      Music object
/// \param timeOffset New playing position
///
////////////////////////////////////////////////////////////
procedure sfMusic_setPlayingOffset(music: PsfMusic; timeOffset: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPlayingOffset';

////////////////////////////////////////////////////////////
/// \brief Get the pitch of a music
///
/// \param music Music object
///
/// \return Pitch of the music
///
////////////////////////////////////////////////////////////
function sfMusic_getPitch(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPitch';

////////////////////////////////////////////////////////////
/// \brief Get the volume of a music
///
/// \param music Music object
///
/// \return Volume of the music, in the range [0, 100]
///
////////////////////////////////////////////////////////////
function sfMusic_getVolume(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getVolume';

////////////////////////////////////////////////////////////
/// \brief Get the 3D position of a music in the audio scene
///
/// \param music Music object
///
/// \return Position of the music in the world
///
////////////////////////////////////////////////////////////
function sfMusic_getPosition(const music: PsfMusic): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPosition';

////////////////////////////////////////////////////////////
/// \brief Tell whether a music's position is relative to the
///        listener or is absolute
///
/// \param music Music object
///
/// \return sfTrue if the position is relative, sfFalse if it's absolute
///
////////////////////////////////////////////////////////////
function sfMusic_isRelativeToListener(const music: PsfMusic): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_isRelativeToListener';

////////////////////////////////////////////////////////////
/// \brief Get the minimum distance of a music
///
/// \param music Music object
///
/// \return Minimum distance of the music
///
////////////////////////////////////////////////////////////
function sfMusic_getMinDistance(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getMinDistance';

////////////////////////////////////////////////////////////
/// \brief Get the attenuation factor of a music
///
/// \param music Music object
///
/// \return Attenuation factor of the music
///
////////////////////////////////////////////////////////////
function sfMusic_getAttenuation(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getAttenuation';

////////////////////////////////////////////////////////////
/// \brief Create a new sound
///
/// \return A new sfSound object
///
////////////////////////////////////////////////////////////
function sfSound_create(): PsfSound; cdecl;
  external PSFML_DLL name _PU + 'sfSound_create';

////////////////////////////////////////////////////////////
/// \brief Create a new sound by copying an existing one
///
/// \param sound Sound to copy
///
/// \return A new sfSound object which is a copy of \a sound
///
////////////////////////////////////////////////////////////
function sfSound_copy(const sound: PsfSound): PsfSound; cdecl;
  external PSFML_DLL name _PU + 'sfSound_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy a sound
///
/// \param sound Sound to destroy
///
////////////////////////////////////////////////////////////
procedure sfSound_destroy(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_destroy';

////////////////////////////////////////////////////////////
/// \brief Start or resume playing a sound
///
/// This function starts the sound if it was stopped, resumes
/// it if it was paused, and restarts it from beginning if it
/// was it already playing.
/// This function uses its own thread so that it doesn't block
/// the rest of the program while the sound is played.
///
/// \param sound Sound object
///
////////////////////////////////////////////////////////////
procedure sfSound_play(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_play';

////////////////////////////////////////////////////////////
/// \brief Pause a sound
///
/// This function pauses the sound if it was playing,
/// otherwise (sound already paused or stopped) it has no effect.
///
/// \param sound Sound object
///
////////////////////////////////////////////////////////////
procedure sfSound_pause(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_pause';

////////////////////////////////////////////////////////////
/// \brief Stop playing a sound
///
/// This function stops the sound if it was playing or paused,
/// and does nothing if it was already stopped.
/// It also resets the playing position (unlike sfSound_pause).
///
/// \param sound Sound object
///
////////////////////////////////////////////////////////////
procedure sfSound_stop(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_stop';

////////////////////////////////////////////////////////////
/// \brief Set the source buffer containing the audio data to play
///
/// It is important to note that the sound buffer is not copied,
/// thus the sfSoundBuffer object must remain alive as long
/// as it is attached to the sound.
///
/// \param sound  Sound object
/// \param buffer Sound buffer to attach to the sound
///
////////////////////////////////////////////////////////////
procedure sfSound_setBuffer(sound: PsfSound; const buffer: PsfSoundBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setBuffer';

////////////////////////////////////////////////////////////
/// \brief Get the audio buffer attached to a sound
///
/// \param sound Sound object
///
/// \return Sound buffer attached to the sound (can be NULL)
///
////////////////////////////////////////////////////////////
function sfSound_getBuffer(const sound: PsfSound): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getBuffer';

////////////////////////////////////////////////////////////
/// \brief Set whether or not a sound should loop after reaching the end
///
/// If set, the sound will restart from beginning after
/// reaching the end and so on, until it is stopped or
/// sfSound_setLoop(sound, sfFalse) is called.
/// The default looping state for sounds is false.
///
/// \param sound Sound object
/// \param loop  sfTrue to play in loop, sfFalse to play once
///
////////////////////////////////////////////////////////////
procedure sfSound_setLoop(sound: PsfSound; loop: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setLoop';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a sound is in loop mode
///
/// \param sound Sound object
///
/// \return sfTrue if the sound is looping, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfSound_getLoop(const sound: PsfSound): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getLoop';

////////////////////////////////////////////////////////////
/// \brief Get the current status of a sound (stopped, paused, playing)
///
/// \param sound Sound object
///
/// \return Current status
///
////////////////////////////////////////////////////////////
function sfSound_getStatus(const sound: PsfSound): sfSoundStatus; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getStatus';

////////////////////////////////////////////////////////////
/// \brief Set the pitch of a sound
///
/// The pitch represents the perceived fundamental frequency
/// of a sound; thus you can make a sound more acute or grave
/// by changing its pitch. A side effect of changing the pitch
/// is to modify the playing speed of the sound as well.
/// The default value for the pitch is 1.
///
/// \param sound Sound object
/// \param pitch New pitch to apply to the sound
///
////////////////////////////////////////////////////////////
procedure sfSound_setPitch(sound: PsfSound; pitch: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPitch';

////////////////////////////////////////////////////////////
/// \brief Set the volume of a sound
///
/// The volume is a value between 0 (mute) and 100 (full volume).
/// The default value for the volume is 100.
///
/// \param sound  Sound object
/// \param volume Volume of the sound
///
////////////////////////////////////////////////////////////
procedure sfSound_setVolume(sound: PsfSound; volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setVolume';

////////////////////////////////////////////////////////////
/// \brief Set the 3D position of a sound in the audio scene
///
/// Only sounds with one channel (mono sounds) can be
/// spatialized.
/// The default position of a sound is (0, 0, 0).
///
/// \param sound    Sound object
/// \param position Position of the sound in the scene
///
////////////////////////////////////////////////////////////
procedure sfSound_setPosition(sound: PsfSound; position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPosition';

////////////////////////////////////////////////////////////
/// \brief Make the sound's position relative to the listener or absolute
///
/// Making a sound relative to the listener will ensure that it will always
/// be played the same way regardless the position of the listener.
/// This can be useful for non-spatialized sounds, sounds that are
/// produced by the listener, or sounds attached to it.
/// The default value is false (position is absolute).
///
/// \param sound    Sound object
/// \param relative sfTrue to set the position relative, sfFalse to set it absolute
///
////////////////////////////////////////////////////////////
procedure sfSound_setRelativeToListener(sound: PsfSound; relative: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setRelativeToListener';

////////////////////////////////////////////////////////////
/// \brief Set the minimum distance of a sound
///
/// The "minimum distance" of a sound is the maximum
/// distance at which it is heard at its maximum volume. Further
/// than the minimum distance, it will start to fade out according
/// to its attenuation factor. A value of 0 ("inside the head
/// of the listener") is an invalid value and is forbidden.
/// The default value of the minimum distance is 1.
///
/// \param sound    Sound object
/// \param distance New minimum distance of the sound
///
////////////////////////////////////////////////////////////
procedure sfSound_setMinDistance(sound: PsfSound; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setMinDistance';

////////////////////////////////////////////////////////////
/// \brief Set the attenuation factor of a sound
///
/// The attenuation is a multiplicative factor which makes
/// the sound more or less loud according to its distance
/// from the listener. An attenuation of 0 will produce a
/// non-attenuated sound, i.e. its volume will always be the same
/// whether it is heard from near or from far. On the other hand,
/// an attenuation value such as 100 will make the sound fade out
/// very quickly as it gets further from the listener.
/// The default value of the attenuation is 1.
///
/// \param sound       Sound object
/// \param attenuation New attenuation factor of the sound
///
////////////////////////////////////////////////////////////
procedure sfSound_setAttenuation(sound: PsfSound; attenuation: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setAttenuation';

////////////////////////////////////////////////////////////
/// \brief Change the current playing position of a sound
///
/// The playing position can be changed when the sound is
/// either paused or playing.
///
/// \param sound      Sound object
/// \param timeOffset New playing position
///
////////////////////////////////////////////////////////////
procedure sfSound_setPlayingOffset(sound: PsfSound; timeOffset: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPlayingOffset';

////////////////////////////////////////////////////////////
/// \brief Get the pitch of a sound
///
/// \param sound Sound object
///
/// \return Pitch of the sound
///
////////////////////////////////////////////////////////////
function sfSound_getPitch(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPitch';

////////////////////////////////////////////////////////////
/// \brief Get the volume of a sound
///
/// \param sound Sound object
///
/// \return Volume of the sound, in the range [0, 100]
///
////////////////////////////////////////////////////////////
function sfSound_getVolume(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getVolume';

////////////////////////////////////////////////////////////
/// \brief Get the 3D position of a sound in the audio scene
///
/// \param sound Sound object
///
/// \return Position of the sound in the world
///
////////////////////////////////////////////////////////////
function sfSound_getPosition(const sound: PsfSound): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPosition';

////////////////////////////////////////////////////////////
/// \brief Tell whether a sound's position is relative to the
///        listener or is absolute
///
/// \param sound Sound object
///
/// \return sfTrue if the position is relative, sfFalse if it's absolute
///
////////////////////////////////////////////////////////////
function sfSound_isRelativeToListener(const sound: PsfSound): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSound_isRelativeToListener';

////////////////////////////////////////////////////////////
/// \brief Get the minimum distance of a sound
///
/// \param sound Sound object
///
/// \return Minimum distance of the sound
///
////////////////////////////////////////////////////////////
function sfSound_getMinDistance(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getMinDistance';

////////////////////////////////////////////////////////////
/// \brief Get the attenuation factor of a sound
///
/// \param sound Sound object
///
/// \return Attenuation factor of the sound
///
////////////////////////////////////////////////////////////
function sfSound_getAttenuation(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getAttenuation';

////////////////////////////////////////////////////////////
/// \brief Get the current playing position of a sound
///
/// \param sound Sound object
///
/// \return Current playing position
///
////////////////////////////////////////////////////////////
function sfSound_getPlayingOffset(const sound: PsfSound): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPlayingOffset';

////////////////////////////////////////////////////////////
/// \brief Create a new sound buffer and load it from a file
///
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param filename Path of the sound file to load
///
/// \return A new sfSoundBuffer object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_createFromFile(const filename: PUTF8Char): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromFile';

////////////////////////////////////////////////////////////
/// \brief Create a new sound buffer and load it from a file in memory
///
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param data        Pointer to the file data in memory
/// \param sizeInBytes Size of the data to load, in bytes
///
/// \return A new sfSoundBuffer object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromMemory';

////////////////////////////////////////////////////////////
/// \brief Create a new sound buffer and load it from a custom stream
///
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param stream Source stream to read from
///
/// \return A new sfSoundBuffer object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromStream';

////////////////////////////////////////////////////////////
/// \brief Create a new sound buffer and load it from an array of samples in memory
///
/// The assumed format of the audio samples is 16 bits signed integer
/// (sfInt16).
///
/// \param samples      Pointer to the array of samples in memory
/// \param sampleCount  Number of samples in the array
/// \param channelCount Number of channels (1 = mono, 2 = stereo, ...)
/// \param sampleRate   Sample rate (number of samples to play per second)
///
/// \return A new sfSoundBuffer object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_createFromSamples(const samples: PsfInt16; sampleCount: sfUint64; channelCount: Cardinal; sampleRate: Cardinal): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromSamples';

////////////////////////////////////////////////////////////
/// \brief Create a new sound buffer by copying an existing one
///
/// \param soundBuffer Sound buffer to copy
///
/// \return A new sfSoundBuffer object which is a copy of \a soundBuffer
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_copy(const soundBuffer: PsfSoundBuffer): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy a sound buffer
///
/// \param soundBuffer Sound buffer to destroy
///
////////////////////////////////////////////////////////////
procedure sfSoundBuffer_destroy(soundBuffer: PsfSoundBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_destroy';

////////////////////////////////////////////////////////////
/// \brief Save a sound buffer to an audio file
///
/// Here is a complete list of all the supported audio formats:
/// ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam,
/// w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
///
/// \param soundBuffer Sound buffer object
/// \param filename    Path of the sound file to write
///
/// \return sfTrue if saving succeeded, sfFalse if it failed
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_saveToFile(const soundBuffer: PsfSoundBuffer; const filename: PUTF8Char): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_saveToFile';

////////////////////////////////////////////////////////////
/// \brief Get the array of audio samples stored in a sound buffer
///
/// The format of the returned samples is 16 bits signed integer
/// (sfInt16). The total number of samples in this array
/// is given by the sfSoundBuffer_getSampleCount function.
///
/// \param soundBuffer Sound buffer object
///
/// \return Read-only pointer to the array of sound samples
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_getSamples(const soundBuffer: PsfSoundBuffer): PsfInt16; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getSamples';

////////////////////////////////////////////////////////////
/// \brief Get the number of samples stored in a sound buffer
///
/// The array of samples can be accessed with the
/// sfSoundBuffer_getSamples function.
///
/// \param soundBuffer Sound buffer object
///
/// \return Number of samples
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_getSampleCount(const soundBuffer: PsfSoundBuffer): sfUint64; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getSampleCount';

////////////////////////////////////////////////////////////
/// \brief Get the sample rate of a sound buffer
///
/// The sample rate is the number of samples played per second.
/// The higher, the better the quality (for example, 44100
/// samples/s is CD quality).
///
/// \param soundBuffer Sound buffer object
///
/// \return Sample rate (number of samples per second)
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_getSampleRate(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getSampleRate';

////////////////////////////////////////////////////////////
/// \brief Get the number of channels used by a sound buffer
///
/// If the sound is mono then the number of channels will
/// be 1, 2 for stereo, etc.
///
/// \param soundBuffer Sound buffer object
///
/// \return Number of channels
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_getChannelCount(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getChannelCount';

////////////////////////////////////////////////////////////
/// \brief Get the total duration of a sound buffer
///
/// \param soundBuffer Sound buffer object
///
/// \return Sound duration
///
////////////////////////////////////////////////////////////
function sfSoundBuffer_getDuration(const soundBuffer: PsfSoundBuffer): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getDuration';

////////////////////////////////////////////////////////////
/// \brief Create a new sound buffer recorder
///
/// \return A new sfSoundBufferRecorder object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfSoundBufferRecorder_create(): PsfSoundBufferRecorder; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a sound buffer recorder
///
/// \param soundBufferRecorder Sound buffer recorder to destroy
///
////////////////////////////////////////////////////////////
procedure sfSoundBufferRecorder_destroy(soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_destroy';

////////////////////////////////////////////////////////////
/// \brief Start the capture of a sound recorder recorder
///
/// The \a sampleRate parameter defines the number of audio samples
/// captured per second. The higher, the better the quality
/// (for example, 44100 samples/sec is CD quality).
/// This function uses its own thread so that it doesn't block
/// the rest of the program while the capture runs.
/// Please note that only one capture can happen at the same time.
///
/// \param soundBufferRecorder Sound buffer recorder object
/// \param sampleRate          Desired capture rate, in number of samples per second
///
/// \return sfTrue, if it was able to start recording
///
////////////////////////////////////////////////////////////
function sfSoundBufferRecorder_start(soundBufferRecorder: PsfSoundBufferRecorder; sampleRate: Cardinal): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_start';

////////////////////////////////////////////////////////////
/// \brief Stop the capture of a sound recorder
///
/// \param soundBufferRecorder Sound buffer recorder object
///
////////////////////////////////////////////////////////////
procedure sfSoundBufferRecorder_stop(soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_stop';

////////////////////////////////////////////////////////////
/// \brief Get the sample rate of a sound buffer recorder
///
/// The sample rate defines the number of audio samples
/// captured per second. The higher, the better the quality
/// (for example, 44100 samples/sec is CD quality).
///
/// \param soundBufferRecorder Sound buffer recorder object
///
/// \return Sample rate, in samples per second
///
////////////////////////////////////////////////////////////
function sfSoundBufferRecorder_getSampleRate(const soundBufferRecorder: PsfSoundBufferRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getSampleRate';

////////////////////////////////////////////////////////////
/// \brief Get the sound buffer containing the captured audio data
///
/// The sound buffer is valid only after the capture has ended.
/// This function provides a read-only access to the internal
/// sound buffer, but it can be copied if you need to
/// make any modification to it.
///
/// \param soundBufferRecorder Sound buffer recorder object
///
/// \return Read-only access to the sound buffer
///
////////////////////////////////////////////////////////////
function sfSoundBufferRecorder_getBuffer(const soundBufferRecorder: PsfSoundBufferRecorder): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getBuffer';

////////////////////////////////////////////////////////////
/// \brief Set the audio capture device
///
/// This function sets the audio capture device to the device
/// with the given name. It can be called on the fly (i.e:
/// while recording). If you do so while recording and
/// opening the device fails, it stops the recording.
///
/// \param soundBufferRecorder Sound buffer recorder object
/// \param name                The name of the audio capture device
///
/// \return sfTrue, if it was able to set the requested device
///
////////////////////////////////////////////////////////////
function sfSoundBufferRecorder_setDevice(soundBufferRecorder: PsfSoundBufferRecorder; const name: PUTF8Char): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_setDevice';

////////////////////////////////////////////////////////////
/// \brief Get the name of the current audio capture device
///
/// \param soundBufferRecorder Sound buffer recorder object
///
/// \return The name of the current audio capture device
///
////////////////////////////////////////////////////////////
function sfSoundBufferRecorder_getDevice(soundBufferRecorder: PsfSoundBufferRecorder): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getDevice';

////////////////////////////////////////////////////////////
/// \brief Construct a new sound recorder from callback functions
///
/// \param onStart   Callback function which will be called when a new capture starts (can be NULL)
/// \param onProcess Callback function which will be called each time there's audio data to process
/// \param onStop    Callback function which will be called when the current capture stops (can be NULL)
/// \param userData  Data to pass to the callback function (can be NULL)
///
/// \return A new sfSoundRecorder object (NULL if failed)
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_create(onStart: sfSoundRecorderStartCallback; onProcess: sfSoundRecorderProcessCallback; onStop: sfSoundRecorderStopCallback; userData: Pointer): PsfSoundRecorder; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a sound recorder
///
/// \param soundRecorder Sound recorder to destroy
///
////////////////////////////////////////////////////////////
procedure sfSoundRecorder_destroy(soundRecorder: PsfSoundRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_destroy';

////////////////////////////////////////////////////////////
/// \brief Start the capture of a sound recorder
///
/// The \a sampleRate parameter defines the number of audio samples
/// captured per second. The higher, the better the quality
/// (for example, 44100 samples/sec is CD quality).
/// This function uses its own thread so that it doesn't block
/// the rest of the program while the capture runs.
/// Please note that only one capture can happen at the same time.
///
/// \param soundRecorder Sound recorder object
/// \param sampleRate    Desired capture rate, in number of samples per second
///
/// \return True, if start of capture was successful
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_start(soundRecorder: PsfSoundRecorder; sampleRate: Cardinal): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_start';

////////////////////////////////////////////////////////////
/// \brief Stop the capture of a sound recorder
///
/// \param soundRecorder Sound recorder object
///
////////////////////////////////////////////////////////////
procedure sfSoundRecorder_stop(soundRecorder: PsfSoundRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_stop';

////////////////////////////////////////////////////////////
/// \brief Get the sample rate of a sound recorder
///
/// The sample rate defines the number of audio samples
/// captured per second. The higher, the better the quality
/// (for example, 44100 samples/sec is CD quality).
///
/// \param soundRecorder Sound recorder object
///
/// \return Sample rate, in samples per second
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_getSampleRate(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getSampleRate';

////////////////////////////////////////////////////////////
/// \brief Check if the system supports audio capture
///
/// This function should always be called before using
/// the audio capture features. If it returns false, then
/// any attempt to use sfSoundRecorder will fail.
///
/// \return sfTrue if audio capture is supported, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_isAvailable(): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_isAvailable';

////////////////////////////////////////////////////////////
/// \brief Set the processing interval
///
/// The processing interval controls the period
/// between calls to the onProcessSamples function. You may
/// want to use a small interval if you want to process the
/// recorded data in real time, for example.
///
/// Note: this is only a hint, the actual period may vary.
/// So don't rely on this parameter to implement precise timing.
///
/// The default processing interval is 100 ms.
///
/// \param soundRecorder Sound recorder object
/// \param interval      Processing interval
///
////////////////////////////////////////////////////////////
procedure sfSoundRecorder_setProcessingInterval(soundRecorder: PsfSoundRecorder; interval: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_setProcessingInterval';

////////////////////////////////////////////////////////////
/// \brief Get a list of the names of all availabe audio capture devices
///
/// This function returns an array of strings (null terminated),
/// containing the names of all availabe audio capture devices.
/// If no devices are available then NULL is returned.
///
/// \param count Pointer to a variable that will be filled with the number of modes in the array
///
/// \return An array of strings containing the names
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_getAvailableDevices(count: PNativeUInt): PPUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getAvailableDevices';

////////////////////////////////////////////////////////////
/// \brief Get the name of the default audio capture device
///
/// This function returns the name of the default audio
/// capture device. If none is available, NULL is returned.
///
/// \return The name of the default audio capture device (null terminated)
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_getDefaultDevice(): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getDefaultDevice';

////////////////////////////////////////////////////////////
/// \brief Set the audio capture device
///
/// This function sets the audio capture device to the device
/// with the given name. It can be called on the fly (i.e:
/// while recording). If you do so while recording and
/// opening the device fails, it stops the recording.
///
/// \param soundRecorder Sound recorder object
/// \param name          The name of the audio capture device
///
/// \return sfTrue, if it was able to set the requested device
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_setDevice(soundRecorder: PsfSoundRecorder; const name: PUTF8Char): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_setDevice';

////////////////////////////////////////////////////////////
/// \brief Get the name of the current audio capture device
///
/// \param soundRecorder Sound recorder object
///
/// \return The name of the current audio capture device
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_getDevice(soundRecorder: PsfSoundRecorder): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getDevice';

////////////////////////////////////////////////////////////
/// \brief Set the channel count of the audio capture device
///
/// This method allows you to specify the number of channels
/// used for recording. Currently only 16-bit mono and
/// 16-bit stereo are supported.
///
/// \param channelCount Number of channels. Currently only
///                     mono (1) and stereo (2) are supported.
///
/// \see sfSoundRecorder_getChannelCount
///
////////////////////////////////////////////////////////////
procedure sfSoundRecorder_setChannelCount(soundRecorder: PsfSoundRecorder; channelCount: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_setChannelCount';

////////////////////////////////////////////////////////////
/// \brief Get the number of channels used by this recorder
///
/// Currently only mono and stereo are supported, so the
/// value is either 1 (for mono) or 2 (for stereo).
///
/// \return Number of channels
///
/// \see sfSoundRecorder_setChannelCount
///
////////////////////////////////////////////////////////////
function sfSoundRecorder_getChannelCount(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getChannelCount';

////////////////////////////////////////////////////////////
/// \brief Create a new sound stream
///
/// \param onGetData    Function called when the stream needs more data (can't be NULL)
/// \param onSeek       Function called when the stream seeks (can't be NULL)
/// \param channelCount Number of channels to use (1 = mono, 2 = stereo)
/// \param sampleRate   Sample rate of the sound (44100 = CD quality)
/// \param userData     Data to pass to the callback functions
///
/// \return A new sfSoundStream object
///
////////////////////////////////////////////////////////////
function sfSoundStream_create(onGetData: sfSoundStreamGetDataCallback; onSeek: sfSoundStreamSeekCallback; channelCount: Cardinal; sampleRate: Cardinal; userData: Pointer): PsfSoundStream; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a sound stream
///
/// \param soundStream Sound stream to destroy
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_destroy(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_destroy';

////////////////////////////////////////////////////////////
/// \brief Start or resume playing a sound stream
///
/// This function starts the stream if it was stopped, resumes
/// it if it was paused, and restarts it from beginning if it
/// was it already playing.
/// This function uses its own thread so that it doesn't block
/// the rest of the program while the music is played.
///
/// \param soundStream Sound stream object
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_play(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_play';

////////////////////////////////////////////////////////////
/// \brief Pause a sound stream
///
/// This function pauses the stream if it was playing,
/// otherwise (stream already paused or stopped) it has no effect.
///
/// \param soundStream Sound stream object
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_pause(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_pause';

////////////////////////////////////////////////////////////
/// \brief Stop playing a sound stream
///
/// This function stops the stream if it was playing or paused,
/// and does nothing if it was already stopped.
/// It also resets the playing position (unlike sfSoundStream_pause).
///
/// \param soundStream Sound stream object
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_stop(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_stop';

////////////////////////////////////////////////////////////
/// \brief Get the current status of a sound stream (stopped, paused, playing)
///
/// \param soundStream Sound stream object
///
/// \return Current status
///
////////////////////////////////////////////////////////////
function sfSoundStream_getStatus(const soundStream: PsfSoundStream): sfSoundStatus; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getStatus';

////////////////////////////////////////////////////////////
/// \brief Return the number of channels of a sound stream
///
/// 1 channel means a mono sound, 2 means stereo, etc.
///
/// \param soundStream Sound stream object
///
/// \return Number of channels
///
////////////////////////////////////////////////////////////
function sfSoundStream_getChannelCount(const soundStream: PsfSoundStream): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getChannelCount';

////////////////////////////////////////////////////////////
/// \brief Get the sample rate of a sound stream
///
/// The sample rate is the number of audio samples played per
/// second. The higher, the better the quality.
///
/// \param soundStream Sound stream object
///
/// \return Sample rate, in number of samples per second
///
////////////////////////////////////////////////////////////
function sfSoundStream_getSampleRate(const soundStream: PsfSoundStream): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getSampleRate';

////////////////////////////////////////////////////////////
/// \brief Set the pitch of a sound stream
///
/// The pitch represents the perceived fundamental frequency
/// of a sound; thus you can make a stream more acute or grave
/// by changing its pitch. A side effect of changing the pitch
/// is to modify the playing speed of the stream as well.
/// The default value for the pitch is 1.
///
/// \param soundStream Sound stream object
/// \param pitch       New pitch to apply to the stream
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setPitch(soundStream: PsfSoundStream; pitch: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPitch';

////////////////////////////////////////////////////////////
/// \brief Set the volume of a sound stream
///
/// The volume is a value between 0 (mute) and 100 (full volume).
/// The default value for the volume is 100.
///
/// \param soundStream Sound stream object
/// \param volume      Volume of the stream
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setVolume(soundStream: PsfSoundStream; volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setVolume';

////////////////////////////////////////////////////////////
/// \brief Set the 3D position of a sound stream in the audio scene
///
/// Only streams with one channel (mono streams) can be
/// spatialized.
/// The default position of a stream is (0, 0, 0).
///
/// \param soundStream Sound stream object
/// \param position    Position of the stream in the scene
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setPosition(soundStream: PsfSoundStream; position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPosition';

////////////////////////////////////////////////////////////
/// \brief Make a sound stream's position relative to the listener or absolute
///
/// Making a stream relative to the listener will ensure that it will always
/// be played the same way regardless the position of the listener.
/// This can be useful for non-spatialized streams, streams that are
/// produced by the listener, or streams attached to it.
/// The default value is false (position is absolute).
///
/// \param soundStream Sound stream object
/// \param relative    sfTrue to set the position relative, sfFalse to set it absolute
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setRelativeToListener(soundStream: PsfSoundStream; relative: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setRelativeToListener';

////////////////////////////////////////////////////////////
/// \brief Set the minimum distance of a sound stream
///
/// The "minimum distance" of a stream is the maximum
/// distance at which it is heard at its maximum volume. Further
/// than the minimum distance, it will start to fade out according
/// to its attenuation factor. A value of 0 ("inside the head
/// of the listener") is an invalid value and is forbidden.
/// The default value of the minimum distance is 1.
///
/// \param soundStream Sound stream object
/// \param distance    New minimum distance of the stream
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setMinDistance(soundStream: PsfSoundStream; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setMinDistance';

////////////////////////////////////////////////////////////
/// \brief Set the attenuation factor of a sound stream
///
/// The attenuation is a multiplicative factor which makes
/// the stream more or less loud according to its distance
/// from the listener. An attenuation of 0 will produce a
/// non-attenuated stream, i.e. its volume will always be the same
/// whether it is heard from near or from far. On the other hand,
/// an attenuation value such as 100 will make the stream fade out
/// very quickly as it gets further from the listener.
/// The default value of the attenuation is 1.
///
/// \param soundStream Sound stream object
/// \param attenuation New attenuation factor of the stream
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setAttenuation(soundStream: PsfSoundStream; attenuation: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setAttenuation';

////////////////////////////////////////////////////////////
/// \brief Change the current playing position of a sound stream
///
/// The playing position can be changed when the stream is
/// either paused or playing.
///
/// \param soundStream Sound stream object
/// \param timeOffset  New playing position
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setPlayingOffset(soundStream: PsfSoundStream; timeOffset: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPlayingOffset';

////////////////////////////////////////////////////////////
/// \brief Set whether or not a sound stream should loop after reaching the end
///
/// If set, the stream will restart from beginning after
/// reaching the end and so on, until it is stopped or
/// sfSoundStream_setLoop(stream, sfFalse) is called.
/// The default looping state for sound streams is false.
///
/// \param soundStream Sound stream object
/// \param loop        sfTrue to play in loop, sfFalse to play once
///
////////////////////////////////////////////////////////////
procedure sfSoundStream_setLoop(soundStream: PsfSoundStream; loop: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setLoop';

////////////////////////////////////////////////////////////
/// \brief Get the pitch of a sound stream
///
/// \param soundStream Sound stream object
///
/// \return Pitch of the stream
///
////////////////////////////////////////////////////////////
function sfSoundStream_getPitch(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPitch';

////////////////////////////////////////////////////////////
/// \brief Get the volume of a sound stream
///
/// \param soundStream Sound stream object
///
/// \return Volume of the stream, in the range [0, 100]
///
////////////////////////////////////////////////////////////
function sfSoundStream_getVolume(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getVolume';

////////////////////////////////////////////////////////////
/// \brief Get the 3D position of a sound stream in the audio scene
///
/// \param soundStream Sound stream object
///
/// \return Position of the stream in the world
///
////////////////////////////////////////////////////////////
function sfSoundStream_getPosition(const soundStream: PsfSoundStream): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPosition';

////////////////////////////////////////////////////////////
/// \brief Tell whether a sound stream's position is relative to the
///        listener or is absolute
///
/// \param soundStream Sound stream object
///
/// \return sfTrue if the position is relative, sfFalse if it's absolute
///
////////////////////////////////////////////////////////////
function sfSoundStream_isRelativeToListener(const soundStream: PsfSoundStream): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_isRelativeToListener';

////////////////////////////////////////////////////////////
/// \brief Get the minimum distance of a sound stream
///
/// \param soundStream Sound stream object
///
/// \return Minimum distance of the stream
///
////////////////////////////////////////////////////////////
function sfSoundStream_getMinDistance(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getMinDistance';

////////////////////////////////////////////////////////////
/// \brief Get the attenuation factor of a sound stream
///
/// \param soundStream Sound stream object
///
/// \return Attenuation factor of the stream
///
////////////////////////////////////////////////////////////
function sfSoundStream_getAttenuation(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getAttenuation';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a sound stream is in loop mode
///
/// \param soundStream Sound stream object
///
/// \return sfTrue if the music is looping, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfSoundStream_getLoop(const soundStream: PsfSoundStream): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getLoop';

////////////////////////////////////////////////////////////
/// \brief Get the current playing position of a sound stream
///
/// \param soundStream Sound stream object
///
/// \return Current playing position
///
////////////////////////////////////////////////////////////
function sfSoundStream_getPlayingOffset(const soundStream: PsfSoundStream): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPlayingOffset';

////////////////////////////////////////////////////////////
/// \brief Get the content of the clipboard as string data (returns an ANSI string)
///
/// This function returns the content of the clipboard
/// as a string. If the clipboard does not contain string
/// it returns an empty string.
///
/// \return Clipboard contents as a locale-dependent ANSI string
///
////////////////////////////////////////////////////////////
function sfClipboard_getString(): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_getString';

////////////////////////////////////////////////////////////
/// \brief Get the content of the clipboard as string data (returns a Unicode string)
///
/// This function returns the content of the clipboard
/// as a string. If the clipboard does not contain string
/// it returns an empty string.
///
/// \return Clipboard contents as UTF-32
///
////////////////////////////////////////////////////////////
function sfClipboard_getUnicodeString(): PsfUint32; cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_getUnicodeString';

////////////////////////////////////////////////////////////
/// \brief Set the content of the clipboard as ANSI string data
///
/// This function sets the content of the clipboard as an
/// ANSI string.
///
/// \param text ANSI string containing the data to be sent
/// to the clipboard
///
////////////////////////////////////////////////////////////
procedure sfClipboard_setString(const text: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_setString';

////////////////////////////////////////////////////////////
/// \brief Set the content of the clipboard as Unicode string data
///
/// This function sets the content of the clipboard as a
/// Unicode string.
///
/// \param text Unicode string containing the data to be sent
/// to the clipboard
///
////////////////////////////////////////////////////////////
procedure sfClipboard_setUnicodeString(const text: PsfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_setUnicodeString';

////////////////////////////////////////////////////////////
/// \brief Check if a joystick is connected
///
/// \param joystick Index of the joystick to check
///
/// \return sfTrue if the joystick is connected, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfJoystick_isConnected(joystick: Cardinal): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_isConnected';

////////////////////////////////////////////////////////////
/// \brief Return the number of buttons supported by a joystick
///
/// If the joystick is not connected, this function returns 0.
///
/// \param joystick Index of the joystick
///
/// \return Number of buttons supported by the joystick
///
////////////////////////////////////////////////////////////
function sfJoystick_getButtonCount(joystick: Cardinal): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_getButtonCount';

////////////////////////////////////////////////////////////
/// \brief Check if a joystick supports a given axis
///
/// If the joystick is not connected, this function returns false.
///
/// \param joystick Index of the joystick
/// \param axis     Axis to check
///
/// \return sfTrue if the joystick supports the axis, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfJoystick_hasAxis(joystick: Cardinal; axis: sfJoystickAxis): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_hasAxis';

////////////////////////////////////////////////////////////
/// \brief Check if a joystick button is pressed
///
/// If the joystick is not connected, this function returns false.
///
/// \param joystick Index of the joystick
/// \param button   Button to check
///
/// \return sfTrue if the button is pressed, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfJoystick_isButtonPressed(joystick: Cardinal; button: Cardinal): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_isButtonPressed';

////////////////////////////////////////////////////////////
/// \brief Get the current position of a joystick axis
///
/// If the joystick is not connected, this function returns 0.
///
/// \param joystick Index of the joystick
/// \param axis     Axis to check
///
/// \return Current position of the axis, in range [-100 .. 100]
///
////////////////////////////////////////////////////////////
function sfJoystick_getAxisPosition(joystick: Cardinal; axis: sfJoystickAxis): Single; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_getAxisPosition';

////////////////////////////////////////////////////////////
/// \brief Get the joystick information
///
/// The result of this function will only remain valid until
/// the next time the function is called.
///
/// \param joystick Index of the joystick
///
/// \return Structure containing joystick information.
///
////////////////////////////////////////////////////////////
function sfJoystick_getIdentification(joystick: Cardinal): sfJoystickIdentification; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_getIdentification';

////////////////////////////////////////////////////////////
/// \brief Update the states of all joysticks
///
/// This function is used internally by SFML, so you normally
/// don't have to call it explicitely. However, you may need to
/// call it if you have no window yet (or no window at all):
/// in this case the joysticks states are not updated automatically.
///
////////////////////////////////////////////////////////////
procedure sfJoystick_update(); cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_update';

////////////////////////////////////////////////////////////
/// \brief Check if a key is pressed
///
/// \param key Key to check
///
/// \return sfTrue if the key is pressed, sfFalse otherwise
///
/// \see sfKeyboard_isScancodePressed
///
////////////////////////////////////////////////////////////
function sfKeyboard_isKeyPressed(key: sfKeyCode): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_isKeyPressed';

////////////////////////////////////////////////////////////
/// \brief Check if a key is pressed
///
/// \param code Scancode to check
///
/// \return sfTrue if the physical key is pressed, sfFalse otherwise
///
/// \see sfKeyboard_isKeyPressed
///
////////////////////////////////////////////////////////////
function sfKeyboard_isScancodePressed(code: sfScancode): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_isScancodePressed';

////////////////////////////////////////////////////////////
/// \brief Localize a physical key to a logical one
///
/// \param code Scancode to localize
///
/// \return The key corresponding to the scancode under the current
///         keyboard layout used by the operating system, or
///         sfKeyUnknown when the scancode cannot be mapped
///         to a Key.
///
/// \see sfKeyboard_delocalize
///
////////////////////////////////////////////////////////////
function sfKeyboard_localize(code: sfScancode): sfKeyCode; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_localize';

////////////////////////////////////////////////////////////
/// \brief Identify the physical key corresponding to a logical one
///
/// \param key Key to "delocalize"
///
/// \return The scancode corresponding to the key under the current
///         keyboard layout used by the operating system, or
///         sfScanUnknown when the key cannot be mapped
///         to a sfScancode.
///
/// \see sfKeyboard_localize
///
////////////////////////////////////////////////////////////
function sfKeyboard_delocalize(key: sfKeyCode): sfScancode; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_delocalize';

////////////////////////////////////////////////////////////
/// \brief Provide a string representation for a given scancode
///
/// The returned string is a short, non-technical description of
/// the key represented with the given scancode. Most effectively
/// used in user interfaces, as the description for the key takes
/// the users keyboard layout into consideration.
///
/// \warning The result is OS-dependent: for example, sfScanLSystem
///          is "Left Meta" on Linux, "Left Windows" on Windows and
///          "Left Command" on macOS.
///
/// The current keyboard layout set by the operating system is used to
/// interpret the scancode: for example, sfKeySemicolon is
/// mapped to ";" for layout and to "Ã©" for others.
///
/// The returned const char* owns the string and must be freed to
/// avoid memory leaks.
///
/// \param code Scancode to describe
///
/// \return The localized description of the code
///
////////////////////////////////////////////////////////////
function sfKeyboard_getDescription(code: sfScancode): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_getDescription';

////////////////////////////////////////////////////////////
/// \brief Show or hide the virtual keyboard.
///
/// \warning The virtual keyboard is not supported on all
///          systems. It will typically be implemented on mobile OSes
///          (Android, iOS) but not on desktop OSes (Windows, Linux, ...).
///
/// If the virtual keyboard is not available, this function does nothing.
///
/// \param visible True to show, false to hide
///
////////////////////////////////////////////////////////////
procedure sfKeyboard_setVirtualKeyboardVisible(visible: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_setVirtualKeyboardVisible';

////////////////////////////////////////////////////////////
/// \brief Check if a mouse button is pressed
///
/// \param button Button to check
///
/// \return sfTrue if the button is pressed, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfMouse_isButtonPressed(button: sfMouseButton): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_isButtonPressed';

////////////////////////////////////////////////////////////
/// \brief Get the current position of the mouse
///
/// This function returns the current position of the mouse
/// cursor relative to the given window, or desktop if NULL is passed.
///
/// \param relativeTo Reference window
///
/// \return Position of the mouse cursor, relative to the given window
///
////////////////////////////////////////////////////////////
function sfMouse_getPosition(const relativeTo: PsfWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_getPosition';

////////////////////////////////////////////////////////////
/// \brief Set the current position of the mouse
///
/// This function sets the current position of the mouse
/// cursor relative to the given window, or desktop if NULL is passed.
///
/// \param position   New position of the mouse
/// \param relativeTo Reference window
///
////////////////////////////////////////////////////////////
procedure sfMouse_setPosition(position: sfVector2i; const relativeTo: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfMouse_setPosition';

////////////////////////////////////////////////////////////
/// \brief Check if a sensor is available on the underlying platform
///
/// \param sensor Sensor to check
///
/// \return sfTrue if the sensor is available, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfSensor_isAvailable(sensor: sfSensorType): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSensor_isAvailable';

////////////////////////////////////////////////////////////
/// \brief Enable or disable a sensor
///
/// All sensors are disabled by default, to avoid consuming too
/// much battery power. Once a sensor is enabled, it starts
/// sending events of the corresponding type.
///
/// This function does nothing if the sensor is unavailable.
///
/// \param sensor Sensor to enable
/// \param enabled sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfSensor_setEnabled(sensor: sfSensorType; enabled: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfSensor_setEnabled';

////////////////////////////////////////////////////////////
/// \brief Get the current sensor value
///
/// \param sensor Sensor to read
///
/// \return The current sensor value
///
////////////////////////////////////////////////////////////
function sfSensor_getValue(sensor: sfSensorType): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSensor_getValue';

////////////////////////////////////////////////////////////
/// \brief Get the current desktop video mode
///
/// \return Current desktop video mode
///
////////////////////////////////////////////////////////////
function sfVideoMode_getDesktopMode(): sfVideoMode; cdecl;
  external PSFML_DLL name _PU + 'sfVideoMode_getDesktopMode';

////////////////////////////////////////////////////////////
/// \brief Retrieve all the video modes supported in fullscreen mode
///
/// When creating a fullscreen window, the video mode is restricted
/// to be compatible with what the graphics driver and monitor
/// support. This function returns the complete list of all video
/// modes that can be used in fullscreen mode.
/// The returned array is sorted from best to worst, so that
/// the first element will always give the best mode (higher
/// width, height and bits-per-pixel).
///
/// \param count Pointer to a variable that will be filled with the number of modes in the array
///
/// \return Pointer to an array containing all the supported fullscreen modes
///
////////////////////////////////////////////////////////////
function sfVideoMode_getFullscreenModes(count: PNativeUInt): PsfVideoMode; cdecl;
  external PSFML_DLL name _PU + 'sfVideoMode_getFullscreenModes';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a video mode is valid
///
/// The validity of video modes is only relevant when using
/// fullscreen windows; otherwise any video mode can be used
/// with no restriction.
///
/// \param mode Video mode
///
/// \return sfTrue if the video mode is valid for fullscreen mode
///
////////////////////////////////////////////////////////////
function sfVideoMode_isValid(mode: sfVideoMode): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfVideoMode_isValid';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not the system supports Vulkan
///
/// This function should always be called before using
/// the Vulkan features. If it returns false, then
/// any attempt to use Vulkan will fail.
///
/// If only compute is required, set \a requireGraphics
/// to false to skip checking for the extensions necessary
/// for graphics rendering.
///
/// \param requireGraphics
///
/// \return True if Vulkan is supported, false otherwise
///
////////////////////////////////////////////////////////////
function sfVulkan_isAvailable(requireGraphics: sfBool): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfVulkan_isAvailable';

////////////////////////////////////////////////////////////
/// \brief Get the address of a Vulkan function
///
/// \param name Name of the function to get the address of
///
/// \return Address of the Vulkan function, 0 on failure
///
////////////////////////////////////////////////////////////
function sfVulkan_getFunction(const name: PUTF8Char): sfVulkanFunctionPointer; cdecl;
  external PSFML_DLL name _PU + 'sfVulkan_getFunction';

////////////////////////////////////////////////////////////
/// \brief Get Vulkan instance extensions required for graphics
///
/// \return Vulkan instance extensions required for graphics
///
////////////////////////////////////////////////////////////
function sfVulkan_getGraphicsRequiredInstanceExtensions(): PPUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfVulkan_getGraphicsRequiredInstanceExtensions';

////////////////////////////////////////////////////////////
/// \brief Construct a new window
///
/// This function creates the window with the size and pixel
/// depth defined in \a mode. An optional style can be passed to
/// customize the look and behaviour of the window (borders,
/// title bar, resizable, closable, ...). If \a style contains
/// sfFullscreen, then \a mode must be a valid video mode.
///
/// \param mode     Video mode to use (defines the width, height and depth of the rendering area of the windowBase)
/// \param title    Title of the window
/// \param style    Window style
///
/// \return A new sfWindow object
///
////////////////////////////////////////////////////////////
function sfWindowBase_create(mode: sfVideoMode; const title: PUTF8Char; style: sfUint32): PsfWindowBase; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_create';

////////////////////////////////////////////////////////////
/// \brief Construct a new window (with a UTF-32 title)
///
/// This function creates the window with the size and pixel
/// depth defined in \a mode. An optional style can be passed to
/// customize the look and behaviour of the window (borders,
/// title bar, resizable, closable, ...). If \a style contains
/// sfFullscreen, then \a mode must be a valid video mode.
///
/// \param mode     Video mode to use (defines the width, height and depth of the rendering area of the windowBase)
/// \param title    Title of the window (UTF-32)
/// \param style    Window style
///
/// \return A new sfWindow object
///
////////////////////////////////////////////////////////////
function sfWindowBase_createUnicode(mode: sfVideoMode; const title: PsfUint32; style: sfUint32): PsfWindowBase; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_createUnicode';

////////////////////////////////////////////////////////////
/// \brief Construct a window from an existing control
///
/// \param handle   Platform-specific handle of the control
///
/// \return A new sfWindow object
///
////////////////////////////////////////////////////////////
function sfWindowBase_createFromHandle(handle: sfWindowHandle): PsfWindowBase; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_createFromHandle';

////////////////////////////////////////////////////////////
/// \brief Destroy a window
///
/// \param windowBase Window to destroy
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_destroy(windowBase: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_destroy';

////////////////////////////////////////////////////////////
/// \brief Close a window and destroy all the attached resources
///
/// After calling this function, the sfWindow object remains
/// valid, you must call sfWindowBase_destroy to actually delete it.
/// All other functions such as sfWindowBase_pollEvent or sfWindowBase_display
/// will still work (i.e. you don't have to test sfWindowBase_isOpen
/// every time), and will have no effect on closed windows.
///
/// \param windowBase Window object
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_close(windowBase: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_close';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a window is opened
///
/// This function returns whether or not the window exists.
/// Note that a hidden window (sfWindowBase_setVisible(sfFalse)) will return
/// sfTrue.
///
/// \param windowBase Window object
///
/// \return sfTrue if the window is opened, sfFalse if it has been closed
///
////////////////////////////////////////////////////////////
function sfWindowBase_isOpen(const windowBase: PsfWindowBase): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_isOpen';

////////////////////////////////////////////////////////////
/// \brief Pop the event on top of event queue, if any, and return it
///
/// This function is not blocking: if there's no pending event then
/// it will return false and leave \a event unmodified.
/// Note that more than one event may be present in the event queue,
/// thus you should always call this function in a loop
/// to make sure that you process every pending event.
///
/// \param windowBase Window object
/// \param event      Event to be returned
///
/// \return sfTrue if an event was returned, or sfFalse if the event queue was empty
///
////////////////////////////////////////////////////////////
function sfWindowBase_pollEvent(windowBase: PsfWindowBase; event: PsfEvent): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_pollEvent';

////////////////////////////////////////////////////////////
/// \brief Wait for an event and return it
///
/// This function is blocking: if there's no pending event then
/// it will wait until an event is received.
/// After this function returns (and no error occured),
/// the \a event object is always valid and filled properly.
/// This function is typically used when you have a thread that
/// is dedicated to events handling: you want to make this thread
/// sleep as long as no new event is received.
///
/// \param windowBase Window object
/// \param event      Event to be returned
///
/// \return sfFalse if any error occured
///
////////////////////////////////////////////////////////////
function sfWindowBase_waitEvent(windowBase: PsfWindowBase; event: PsfEvent): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_waitEvent';

////////////////////////////////////////////////////////////
/// \brief Get the position of a window
///
/// \param windowBase Window object
///
/// \return Position in pixels
///
////////////////////////////////////////////////////////////
function sfWindowBase_getPosition(const windowBase: PsfWindowBase): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_getPosition';

////////////////////////////////////////////////////////////
/// \brief Change the position of a window on screen
///
/// This function only works for top-level windows
/// (i.e. it will be ignored for windows created from
/// the handle of a child window/control).
///
/// \param windowBase Window object
/// \param position   New position of the windowBase, in pixels
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setPosition(windowBase: PsfWindowBase; position: sfVector2i); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setPosition';

////////////////////////////////////////////////////////////
/// \brief Get the size of the rendering region of a window
///
/// The size doesn't include the titlebar and borders
/// of the window.
///
/// \param windowBase Window object
///
/// \return Size in pixels
///
////////////////////////////////////////////////////////////
function sfWindowBase_getSize(const windowBase: PsfWindowBase): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_getSize';

////////////////////////////////////////////////////////////
/// \brief Change the size of the rendering region of a window
///
/// \param windowBase Window object
/// \param size       New size, in pixels
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setSize(windowBase: PsfWindowBase; size: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setSize';

////////////////////////////////////////////////////////////
/// \brief Change the title of a window
///
/// \param windowBase Window object
/// \param title      New title
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setTitle(windowBase: PsfWindowBase; const title: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setTitle';

////////////////////////////////////////////////////////////
/// \brief Change the title of a window (with a UTF-32 string)
///
/// \param windowBase Window object
/// \param title      New title
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setUnicodeTitle(windowBase: PsfWindowBase; const title: PsfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setUnicodeTitle';

////////////////////////////////////////////////////////////
/// \brief Change a window's icon
///
/// \a pixels must be an array of \a width x \a height pixels
/// in 32-bits RGBA format.
///
/// \param windowBase Window object
/// \param width      Icon's width, in pixels
/// \param height     Icon's height, in pixels
/// \param pixels     Pointer to the array of pixels in memory
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setIcon(windowBase: PsfWindowBase; width: Cardinal; height: Cardinal; const pixels: PsfUint8); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setIcon';

////////////////////////////////////////////////////////////
/// \brief Show or hide a window
///
/// \param windowBase Window object
/// \param visible    sfTrue to show the windowBase, sfFalse to hide it
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setVisible(windowBase: PsfWindowBase; visible: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setVisible';

////////////////////////////////////////////////////////////
/// \brief Show or hide the mouse cursor
///
/// \param windowBase Window object
/// \param visible    sfTrue to show, sfFalse to hide
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setMouseCursorVisible(windowBase: PsfWindowBase; visible: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setMouseCursorVisible';

////////////////////////////////////////////////////////////
/// \brief Grab or release the mouse cursor
///
/// If set, grabs the mouse cursor inside this window's client
/// area so it may no longer be moved outside its bounds.
/// Note that grabbing is only active while the window has
/// focus and calling this function for fullscreen windows
/// won't have any effect (fullscreen windows always grab the
/// cursor).
///
/// \param grabbed sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setMouseCursorGrabbed(windowBase: PsfWindowBase; grabbed: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setMouseCursorGrabbed';

////////////////////////////////////////////////////////////
/// \brief Set the displayed cursor to a native system cursor
///
/// Upon window creation, the arrow cursor is used by default.
///
/// \warning The cursor must not be destroyed while in use by
///          the window.
///
/// \warning Features related to Cursor are not supported on
///          iOS and Android.
///
/// \param windowBase Window object
/// \param cursor     Native system cursor type to display
///
/// \see sfCursor_createFromSystem
/// \see sfCursor_createFromPixels
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setMouseCursor(windowBase: PsfWindowBase; const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setMouseCursor';

////////////////////////////////////////////////////////////
/// \brief Enable or disable automatic key-repeat
///
/// If key repeat is enabled, you will receive repeated
/// KeyPress events while keeping a key pressed. If it is disabled,
/// you will only get a single event when the key is pressed.
///
/// Key repeat is enabled by default.
///
/// \param windowBase Window object
/// \param enabled    sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setKeyRepeatEnabled(windowBase: PsfWindowBase; enabled: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setKeyRepeatEnabled';

////////////////////////////////////////////////////////////
/// \brief Change the joystick threshold
///
/// The joystick threshold is the value below which
/// no JoystickMoved event will be generated.
///
/// \param windowBase Window object
/// \param threshold  New threshold, in the range [0, 100]
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_setJoystickThreshold(windowBase: PsfWindowBase; threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setJoystickThreshold';

////////////////////////////////////////////////////////////
/// \brief Request the current window to be made the active
/// foreground window
///
/// At any given time, only one window may have the input focus
/// to receive input events such as keystrokes or mouse events.
/// If a window requests focus, it only hints to the operating
/// system, that it would like to be focused. The operating system
/// is free to deny the request.
///
////////////////////////////////////////////////////////////
procedure sfWindowBase_requestFocus(windowBase: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_requestFocus';

////////////////////////////////////////////////////////////
/// \brief Check whether the window has the input focus
///
/// At any given time, only one window may have the input focus
/// to receive input events such as keystrokes or most mouse
/// events.
///
/// \return True if window has focus, false otherwise
///
////////////////////////////////////////////////////////////
function sfWindowBase_hasFocus(const windowBase: PsfWindowBase): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_hasFocus';

////////////////////////////////////////////////////////////
/// \brief Get the OS-specific handle of the window
///
/// The type of the returned handle is sfWindowHandle,
/// which is a typedef to the handle type defined by the OS.
/// You shouldn't need to use this function, unless you have
/// very specific stuff to implement that SFML doesn't support,
/// or implement a temporary workaround until a bug is fixed.
///
/// \param windowBase Window object
///
/// \return System handle of the window
///
////////////////////////////////////////////////////////////
function sfWindowBase_getSystemHandle(const windowBase: PsfWindowBase): sfWindowHandle; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_getSystemHandle';

////////////////////////////////////////////////////////////
/// \brief Create a Vulkan rendering surface
///
/// \param windowBase Window object
/// \param instance  Vulkan instance
/// \param surface   Created surface
/// \param allocator Allocator to use
///
/// \return True if surface creation was successful, false otherwise
///
////////////////////////////////////////////////////////////
function sfWindowBase_createVulkanSurface(windowBase: PsfWindowBase; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_createVulkanSurface';

////////////////////////////////////////////////////////////
/// \brief Construct a new window
///
/// This function creates the window with the size and pixel
/// depth defined in \a mode. An optional style can be passed to
/// customize the look and behaviour of the window (borders,
/// title bar, resizable, closable, ...). If \a style contains
/// sfFullscreen, then \a mode must be a valid video mode.
///
/// The fourth parameter is a pointer to a structure specifying
/// advanced OpenGL context settings such as antialiasing,
/// depth-buffer bits, etc.
///
/// \param mode     Video mode to use (defines the width, height and depth of the rendering area of the window)
/// \param title    Title of the window
/// \param style    Window style
/// \param settings Additional settings for the underlying OpenGL context
///
/// \return A new sfWindow object
///
////////////////////////////////////////////////////////////
function sfWindow_create(mode: sfVideoMode; const title: PUTF8Char; style: sfUint32; const settings: PsfContextSettings): PsfWindow; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_create';

////////////////////////////////////////////////////////////
/// \brief Construct a new window (with a UTF-32 title)
///
/// This function creates the window with the size and pixel
/// depth defined in \a mode. An optional style can be passed to
/// customize the look and behaviour of the window (borders,
/// title bar, resizable, closable, ...). If \a style contains
/// sfFullscreen, then \a mode must be a valid video mode.
///
/// The fourth parameter is a pointer to a structure specifying
/// advanced OpenGL context settings such as antialiasing,
/// depth-buffer bits, etc.
///
/// \param mode     Video mode to use (defines the width, height and depth of the rendering area of the window)
/// \param title    Title of the window (UTF-32)
/// \param style    Window style
/// \param settings Additional settings for the underlying OpenGL context
///
/// \return A new sfWindow object
///
////////////////////////////////////////////////////////////
function sfWindow_createUnicode(mode: sfVideoMode; const title: PsfUint32; style: sfUint32; const settings: PsfContextSettings): PsfWindow; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_createUnicode';

////////////////////////////////////////////////////////////
/// \brief Construct a window from an existing control
///
/// Use this constructor if you want to create an OpenGL
/// rendering area into an already existing control.
///
/// The second parameter is a pointer to a structure specifying
/// advanced OpenGL context settings such as antialiasing,
/// depth-buffer bits, etc.
///
/// \param handle   Platform-specific handle of the control
/// \param settings Additional settings for the underlying OpenGL context
///
/// \return A new sfWindow object
///
////////////////////////////////////////////////////////////
function sfWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfWindow; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_createFromHandle';

////////////////////////////////////////////////////////////
/// \brief Destroy a window
///
/// \param window Window to destroy
///
////////////////////////////////////////////////////////////
procedure sfWindow_destroy(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_destroy';

////////////////////////////////////////////////////////////
/// \brief Close a window and destroy all the attached resources
///
/// After calling this function, the sfWindow object remains
/// valid, you must call sfWindow_destroy to actually delete it.
/// All other functions such as sfWindow_pollEvent or sfWindow_display
/// will still work (i.e. you don't have to test sfWindow_isOpen
/// every time), and will have no effect on closed windows.
///
/// \param window Window object
///
////////////////////////////////////////////////////////////
procedure sfWindow_close(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_close';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a window is opened
///
/// This function returns whether or not the window exists.
/// Note that a hidden window (sfWindow_setVisible(sfFalse)) will return
/// sfTrue.
///
/// \param window Window object
///
/// \return sfTrue if the window is opened, sfFalse if it has been closed
///
////////////////////////////////////////////////////////////
function sfWindow_isOpen(const window: PsfWindow): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_isOpen';

////////////////////////////////////////////////////////////
/// \brief Get the settings of the OpenGL context of a window
///
/// Note that these settings may be different from what was
/// passed to the sfWindow_create function,
/// if one or more settings were not supported. In this case,
/// SFML chose the closest match.
///
/// \param window Window object
///
/// \return Structure containing the OpenGL context settings
///
////////////////////////////////////////////////////////////
function sfWindow_getSettings(const window: PsfWindow): sfContextSettings; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getSettings';

////////////////////////////////////////////////////////////
/// \brief Pop the event on top of event queue, if any, and return it
///
/// This function is not blocking: if there's no pending event then
/// it will return false and leave \a event unmodified.
/// Note that more than one event may be present in the event queue,
/// thus you should always call this function in a loop
/// to make sure that you process every pending event.
///
/// \param window Window object
/// \param event  Event to be returned
///
/// \return sfTrue if an event was returned, or sfFalse if the event queue was empty
///
////////////////////////////////////////////////////////////
function sfWindow_pollEvent(window: PsfWindow; event: PsfEvent): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_pollEvent';

////////////////////////////////////////////////////////////
/// \brief Wait for an event and return it
///
/// This function is blocking: if there's no pending event then
/// it will wait until an event is received.
/// After this function returns (and no error occured),
/// the \a event object is always valid and filled properly.
/// This function is typically used when you have a thread that
/// is dedicated to events handling: you want to make this thread
/// sleep as long as no new event is received.
///
/// \param window Window object
/// \param event  Event to be returned
///
/// \return sfFalse if any error occured
///
////////////////////////////////////////////////////////////
function sfWindow_waitEvent(window: PsfWindow; event: PsfEvent): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_waitEvent';

////////////////////////////////////////////////////////////
/// \brief Get the position of a window
///
/// \param window Window object
///
/// \return Position in pixels
///
////////////////////////////////////////////////////////////
function sfWindow_getPosition(const window: PsfWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getPosition';

////////////////////////////////////////////////////////////
/// \brief Change the position of a window on screen
///
/// This function only works for top-level windows
/// (i.e. it will be ignored for windows created from
/// the handle of a child window/control).
///
/// \param window   Window object
/// \param position New position of the window, in pixels
///
////////////////////////////////////////////////////////////
procedure sfWindow_setPosition(window: PsfWindow; position: sfVector2i); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setPosition';

////////////////////////////////////////////////////////////
/// \brief Get the size of the rendering region of a window
///
/// The size doesn't include the titlebar and borders
/// of the window.
///
/// \param window Window object
///
/// \return Size in pixels
///
////////////////////////////////////////////////////////////
function sfWindow_getSize(const window: PsfWindow): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getSize';

////////////////////////////////////////////////////////////
/// \brief Change the size of the rendering region of a window
///
/// \param window Window object
/// \param size   New size, in pixels
///
////////////////////////////////////////////////////////////
procedure sfWindow_setSize(window: PsfWindow; size: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setSize';

////////////////////////////////////////////////////////////
/// \brief Change the title of a window
///
/// \param window Window object
/// \param title  New title
///
////////////////////////////////////////////////////////////
procedure sfWindow_setTitle(window: PsfWindow; const title: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setTitle';

////////////////////////////////////////////////////////////
/// \brief Change the title of a window (with a UTF-32 string)
///
/// \param window Window object
/// \param title  New title
///
////////////////////////////////////////////////////////////
procedure sfWindow_setUnicodeTitle(window: PsfWindow; const title: PsfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setUnicodeTitle';

////////////////////////////////////////////////////////////
/// \brief Change a window's icon
///
/// \a pixels must be an array of \a width x \a height pixels
/// in 32-bits RGBA format.
///
/// \param window Window object
/// \param width  Icon's width, in pixels
/// \param height Icon's height, in pixels
/// \param pixels Pointer to the array of pixels in memory
///
////////////////////////////////////////////////////////////
procedure sfWindow_setIcon(window: PsfWindow; width: Cardinal; height: Cardinal; const pixels: PsfUint8); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setIcon';

////////////////////////////////////////////////////////////
/// \brief Show or hide a window
///
/// \param window  Window object
/// \param visible sfTrue to show the window, sfFalse to hide it
///
////////////////////////////////////////////////////////////
procedure sfWindow_setVisible(window: PsfWindow; visible: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setVisible';

////////////////////////////////////////////////////////////
/// \brief Enable or disable vertical synchronization
///
/// Activating vertical synchronization will limit the number
/// of frames displayed to the refresh rate of the monitor.
/// This can avoid some visual artifacts, and limit the framerate
/// to a good value (but not constant across different computers).
///
/// \param window  Window object
/// \param enabled sfTrue to enable v-sync, sfFalse to deactivate
///
////////////////////////////////////////////////////////////
procedure sfWindow_setVerticalSyncEnabled(window: PsfWindow; enabled: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setVerticalSyncEnabled';

////////////////////////////////////////////////////////////
/// \brief Show or hide the mouse cursor
///
/// \param window  Window object
/// \param visible sfTrue to show, sfFalse to hide
///
////////////////////////////////////////////////////////////
procedure sfWindow_setMouseCursorVisible(window: PsfWindow; visible: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setMouseCursorVisible';

////////////////////////////////////////////////////////////
/// \brief Grab or release the mouse cursor
///
/// If set, grabs the mouse cursor inside this window's client
/// area so it may no longer be moved outside its bounds.
/// Note that grabbing is only active while the window has
/// focus and calling this function for fullscreen windows
/// won't have any effect (fullscreen windows always grab the
/// cursor).
///
/// \param grabbed sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfWindow_setMouseCursorGrabbed(window: PsfWindow; grabbed: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setMouseCursorGrabbed';

////////////////////////////////////////////////////////////
/// \brief Set the displayed cursor to a native system cursor
///
/// Upon window creation, the arrow cursor is used by default.
///
/// \warning The cursor must not be destroyed while in use by
///          the window.
///
/// \warning Features related to Cursor are not supported on
///          iOS and Android.
///
/// \param window Window object
/// \param cursor Native system cursor type to display
///
/// \see sfCursor_createFromSystem
/// \see sfCursor_createFromPixels
///
////////////////////////////////////////////////////////////
procedure sfWindow_setMouseCursor(window: PsfWindow; const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setMouseCursor';

////////////////////////////////////////////////////////////
/// \brief Enable or disable automatic key-repeat
///
/// If key repeat is enabled, you will receive repeated
/// KeyPress events while keeping a key pressed. If it is disabled,
/// you will only get a single event when the key is pressed.
///
/// Key repeat is enabled by default.
///
/// \param window  Window object
/// \param enabled sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfWindow_setKeyRepeatEnabled(window: PsfWindow; enabled: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setKeyRepeatEnabled';

////////////////////////////////////////////////////////////
/// \brief Limit the framerate to a maximum fixed frequency
///
/// If a limit is set, the window will use a small delay after
/// each call to sfWindow_display to ensure that the current frame
/// lasted long enough to match the framerate limit.
///
/// \param window Window object
/// \param limit  Framerate limit, in frames per seconds (use 0 to disable limit)
///
////////////////////////////////////////////////////////////
procedure sfWindow_setFramerateLimit(window: PsfWindow; limit: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setFramerateLimit';

////////////////////////////////////////////////////////////
/// \brief Change the joystick threshold
///
/// The joystick threshold is the value below which
/// no JoystickMoved event will be generated.
///
/// \param window    Window object
/// \param threshold New threshold, in the range [0, 100]
///
////////////////////////////////////////////////////////////
procedure sfWindow_setJoystickThreshold(window: PsfWindow; threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setJoystickThreshold';

////////////////////////////////////////////////////////////
/// \brief Activate or deactivate a window as the current target
///        for OpenGL rendering
///
/// A window is active only on the current thread, if you want to
/// make it active on another thread you have to deactivate it
/// on the previous thread first if it was active.
/// Only one window can be active on a thread at a time, thus
/// the window previously active (if any) automatically gets deactivated.
/// This is not to be confused with sfWindow_requestFocus().
///
/// \param window Window object
/// \param active sfTrue to activate, sfFalse to deactivate
///
/// \return sfTrue if operation was successful, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfWindow_setActive(window: PsfWindow; active: sfBool): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setActive';

////////////////////////////////////////////////////////////
/// \brief Request the current window to be made the active
/// foreground window
///
/// At any given time, only one window may have the input focus
/// to receive input events such as keystrokes or mouse events.
/// If a window requests focus, it only hints to the operating
/// system, that it would like to be focused. The operating system
/// is free to deny the request.
/// This is not to be confused with sfWindow_setActive().
///
////////////////////////////////////////////////////////////
procedure sfWindow_requestFocus(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_requestFocus';

////////////////////////////////////////////////////////////
/// \brief Check whether the window has the input focus
///
/// At any given time, only one window may have the input focus
/// to receive input events such as keystrokes or most mouse
/// events.
///
/// \return True if window has focus, false otherwise
///
////////////////////////////////////////////////////////////
function sfWindow_hasFocus(const window: PsfWindow): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_hasFocus';

////////////////////////////////////////////////////////////
/// \brief Display on screen what has been rendered to the
///        window so far
///
/// This function is typically called after all OpenGL rendering
/// has been done for the current frame, in order to show
/// it on screen.
///
/// \param window Window object
///
////////////////////////////////////////////////////////////
procedure sfWindow_display(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_display';

////////////////////////////////////////////////////////////
/// \brief Get the OS-specific handle of the window
///
/// The type of the returned handle is sfWindowHandle,
/// which is a typedef to the handle type defined by the OS.
/// You shouldn't need to use this function, unless you have
/// very specific stuff to implement that SFML doesn't support,
/// or implement a temporary workaround until a bug is fixed.
///
/// \param window Window object
///
/// \return System handle of the window
///
////////////////////////////////////////////////////////////
function sfWindow_getSystemHandle(const window: PsfWindow): sfWindowHandle; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getSystemHandle';

////////////////////////////////////////////////////////////
/// \brief Create a new context
///
/// This function activates the new context.
///
/// \return New sfContext object
///
////////////////////////////////////////////////////////////
function sfContext_create(): PsfContext; cdecl;
  external PSFML_DLL name _PU + 'sfContext_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a context
///
/// \param context Context to destroy
///
////////////////////////////////////////////////////////////
procedure sfContext_destroy(context: PsfContext); cdecl;
  external PSFML_DLL name _PU + 'sfContext_destroy';

////////////////////////////////////////////////////////////
/// \brief Check whether a given OpenGL extension is available.
///
/// \param Name of the extension to check for
///
/// \return True if available, false if unavailable
///
////////////////////////////////////////////////////////////
function sfContext_isExtensionAvailable(const name: PUTF8Char): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfContext_isExtensionAvailable';

////////////////////////////////////////////////////////////
/// \brief Activate or deactivate explicitely a context
///
/// \param context Context object
/// \param active  sfTrue to activate, sfFalse to deactivate
///
/// \return sfTrue on success, sfFalse on failure
///
////////////////////////////////////////////////////////////
function sfContext_setActive(context: PsfContext; active: sfBool): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfContext_setActive';

////////////////////////////////////////////////////////////
/// \brief Get the address of an OpenGL function.
///
/// \param name Name of the function to get the address of
///
/// \return Address of the OpenGL function, 0 on failure
///
////////////////////////////////////////////////////////////
function sfContext_getFunction(const name: PUTF8Char): GlFunctionPointer; cdecl;
  external PSFML_DLL name _PU + 'sfContext_getFunction';

////////////////////////////////////////////////////////////
/// \brief Get the settings of the context.
///
/// Note that these settings may be different than the ones passed to the
/// constructor; they are indeed adjusted if the original settings are not
/// directly supported by the system.
///
/// \return Structure containing the settings
///
////////////////////////////////////////////////////////////
function sfContext_getSettings(const context: PsfContext): sfContextSettings; cdecl;
  external PSFML_DLL name _PU + 'sfContext_getSettings';

////////////////////////////////////////////////////////////
/// \brief Get the currently active context's ID
///
/// The context ID is used to identify contexts when
/// managing unshareable OpenGL resources.
///
/// \return The active context's ID or 0 if no context is currently active
///
////////////////////////////////////////////////////////////
function sfContext_getActiveContextId(): sfUint64; cdecl;
  external PSFML_DLL name _PU + 'sfContext_getActiveContextId';

////////////////////////////////////////////////////////////
/// \brief Create a cursor with the provided image
///
/// \a pixels must be an array of \a width by \a height pixels
/// in 32-bit RGBA format. If not, this will cause undefined behavior.
///
/// If \a pixels is null or either \a width or \a height are 0,
/// the current cursor is left unchanged and the function will
/// return false.
///
/// In addition to specifying the pixel data, you can also
/// specify the location of the hotspot of the cursor. The
/// hotspot is the pixel coordinate within the cursor image
/// which will be located exactly where the mouse pointer
/// position is. Any mouse actions that are performed will
/// return the window/screen location of the hotspot.
///
/// \warning On Unix, the pixels are mapped into a monochrome
///          bitmap: pixels with an alpha channel to 0 are
///          transparent, black if the RGB channel are close
///          to zero, and white otherwise.
///
/// \param pixels   Array of pixels of the image
/// \param size     Width and height of the image
/// \param hotspot  (x,y) location of the hotspot
/// \return A new sfCursor object
///
////////////////////////////////////////////////////////////
function sfCursor_createFromPixels(const pixels: PsfUint8; size: sfVector2u; hotspot: sfVector2u): PsfCursor; cdecl;
  external PSFML_DLL name _PU + 'sfCursor_createFromPixels';

////////////////////////////////////////////////////////////
/// \brief Create a native system cursor
///
/// Refer to the list of cursor available on each system
/// (see sfCursorType) to know whether a given cursor is
/// expected to load successfully or is not supported by
/// the operating system.
///
/// \param type Native system cursor type
/// \return A new sfCursor object
///
////////////////////////////////////////////////////////////
function sfCursor_createFromSystem(&type: sfCursorType): PsfCursor; cdecl;
  external PSFML_DLL name _PU + 'sfCursor_createFromSystem';

////////////////////////////////////////////////////////////
/// \brief Destroy a cursor
///
/// \param cursor Cursor to destroy
///
////////////////////////////////////////////////////////////
procedure sfCursor_destroy(cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfCursor_destroy';

////////////////////////////////////////////////////////////
/// \brief Check if a touch event is currently down
///
/// \param finger Finger index
///
/// \return sfTrue if \a finger is currently touching the screen, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfTouch_isDown(finger: Cardinal): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_isDown';

////////////////////////////////////////////////////////////
/// \brief Get the current position of a touch in window coordinates
///
/// This function returns the current touch position
/// relative to the given window, or desktop if NULL is passed.
///
/// \param finger Finger index
/// \param relativeTo Reference window
///
/// \return Current position of \a finger, or undefined if it's not down
///
////////////////////////////////////////////////////////////
function sfTouch_getPosition(finger: Cardinal; const relativeTo: PsfWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_getPosition';

////////////////////////////////////////////////////////////
/// \brief Construct a color from its 3 RGB components
///
/// \param red   Red component   (0 .. 255)
/// \param green Green component (0 .. 255)
/// \param blue  Blue component  (0 .. 255)
///
/// \return sfColor constructed from the components
///
////////////////////////////////////////////////////////////
function sfColor_fromRGB(red: sfUint8; green: sfUint8; blue: sfUint8): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_fromRGB';

////////////////////////////////////////////////////////////
/// \brief Construct a color from its 4 RGBA components
///
/// \param red   Red component   (0 .. 255)
/// \param green Green component (0 .. 255)
/// \param blue  Blue component  (0 .. 255)
/// \param alpha Alpha component (0 .. 255)
///
/// \return sfColor constructed from the components
///
////////////////////////////////////////////////////////////
function sfColor_fromRGBA(red: sfUint8; green: sfUint8; blue: sfUint8; alpha: sfUint8): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_fromRGBA';

////////////////////////////////////////////////////////////
/// \brief Construct the color from 32-bit unsigned integer
///
/// \param color Number containing the RGBA components (in that order)
///
/// \return sfColor constructed from the 32-bit unsigned integer
///
////////////////////////////////////////////////////////////
function sfColor_fromInteger(color: sfUint32): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_fromInteger';

////////////////////////////////////////////////////////////
/// \brief Convert a color to a 32-bit unsigned integer
///
/// \return Color represented as a 32-bit unsigned integer
///
////////////////////////////////////////////////////////////
function sfColor_toInteger(color: sfColor): sfUint32; cdecl;
  external PSFML_DLL name _PU + 'sfColor_toInteger';

////////////////////////////////////////////////////////////
/// \brief Add two colors
///
/// \param color1 First color
/// \param color2 Second color
///
/// \return Component-wise saturated addition of the two colors
///
////////////////////////////////////////////////////////////
function sfColor_add(color1: sfColor; color2: sfColor): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_add';

////////////////////////////////////////////////////////////
/// \brief Subtract two colors
///
/// \param color1 First color
/// \param color2 Second color
///
/// \return Component-wise saturated subtraction of the two colors
///
////////////////////////////////////////////////////////////
function sfColor_subtract(color1: sfColor; color2: sfColor): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_subtract';

////////////////////////////////////////////////////////////
/// \brief Modulate two colors
///
/// \param color1 First color
/// \param color2 Second color
///
/// \return Component-wise multiplication of the two colors
///
////////////////////////////////////////////////////////////
function sfColor_modulate(color1: sfColor; color2: sfColor): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_modulate';

////////////////////////////////////////////////////////////
/// \brief Check if a point is inside a rectangle's area
///
/// \param rect Rectangle to test
/// \param x    X coordinate of the point to test
/// \param y    Y coordinate of the point to test
///
/// \return sfTrue if the point is inside
///
////////////////////////////////////////////////////////////
function sfFloatRect_contains(const rect: PsfFloatRect; x: Single; y: Single): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfFloatRect_contains';

function sfIntRect_contains(const rect: PsfIntRect; x: Integer; y: Integer): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfIntRect_contains';

////////////////////////////////////////////////////////////
/// \brief Check intersection between two rectangles
///
/// \param rect1        First rectangle to test
/// \param rect2        Second rectangle to test
/// \param intersection Rectangle to be filled with overlapping rect (can be NULL)
///
/// \return sfTrue if rectangles overlap
///
////////////////////////////////////////////////////////////
function sfFloatRect_intersects(const rect1: PsfFloatRect; const rect2: PsfFloatRect; intersection: PsfFloatRect): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfFloatRect_intersects';

function sfIntRect_intersects(const rect1: PsfIntRect; const rect2: PsfIntRect; intersection: PsfIntRect): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfIntRect_intersects';

////////////////////////////////////////////////////////////
/// \brief Get the position of the rectangle's top-left corner
///
/// \return Position of rectangle
///
/// \see getSize
///
////////////////////////////////////////////////////////////
function sfFloatRect_getPosition(const rect: PsfFloatRect): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfFloatRect_getPosition';

function sfIntRect_getPosition(const rect: PsfIntRect): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfIntRect_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the size of the rectangle
///
/// \return Size of rectangle
///
/// \see getPosition
///
////////////////////////////////////////////////////////////
function sfFloatRect_getSize(const rect: PsfFloatRect): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfFloatRect_getSize';

function sfIntRect_getSize(const rect: PsfIntRect): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfIntRect_getSize';

////////////////////////////////////////////////////////////
/// \brief Create a new transform from a matrix
///
/// \param a00 Element (0, 0) of the matrix
/// \param a01 Element (0, 1) of the matrix
/// \param a02 Element (0, 2) of the matrix
/// \param a10 Element (1, 0) of the matrix
/// \param a11 Element (1, 1) of the matrix
/// \param a12 Element (1, 2) of the matrix
/// \param a20 Element (2, 0) of the matrix
/// \param a21 Element (2, 1) of the matrix
/// \param a22 Element (2, 2) of the matrix
///
/// \return A new sfTransform object
///
////////////////////////////////////////////////////////////
function sfTransform_fromMatrix(a00: Single; a01: Single; a02: Single; a10: Single; a11: Single; a12: Single; a20: Single; a21: Single; a22: Single): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_fromMatrix';

////////////////////////////////////////////////////////////
/// \brief Return the 4x4 matrix of a transform
///
/// This function fills an array of 16 floats with the transform
/// converted as a 4x4 matrix, which is directly compatible with
/// OpenGL functions.
///
/// \code
/// sfTransform transform = ...;
/// float matrix[16];
/// sfTransform_getMatrix(&transform, matrix)
/// glLoadMatrixf(matrix);
/// \endcode
///
/// \param transform Transform object
/// \param matrix Pointer to the 16-element array to fill with the matrix
///
////////////////////////////////////////////////////////////
procedure sfTransform_getMatrix(const transform: PsfTransform; matrix: PSingle); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_getMatrix';

////////////////////////////////////////////////////////////
/// \brief Return the inverse of a transform
///
/// If the inverse cannot be computed, a new identity transform
/// is returned.
///
/// \param transform Transform object
/// \return The inverse matrix
///
////////////////////////////////////////////////////////////
function sfTransform_getInverse(const transform: PsfTransform): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_getInverse';

////////////////////////////////////////////////////////////
/// \brief Apply a transform to a 2D point
///
/// \param transform Transform object
/// \param point     Point to transform
///
/// \return Transformed point
///
////////////////////////////////////////////////////////////
function sfTransform_transformPoint(const transform: PsfTransform; point: sfVector2f): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_transformPoint';

////////////////////////////////////////////////////////////
/// \brief Apply a transform to a rectangle
///
/// Since SFML doesn't provide support for oriented rectangles,
/// the result of this function is always an axis-aligned
/// rectangle. Which means that if the transform contains a
/// rotation, the bounding rectangle of the transformed rectangle
/// is returned.
///
/// \param transform Transform object
/// \param rectangle Rectangle to transform
///
/// \return Transformed rectangle
///
////////////////////////////////////////////////////////////
function sfTransform_transformRect(const transform: PsfTransform; rectangle: sfFloatRect): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_transformRect';

////////////////////////////////////////////////////////////
/// \brief Combine two transforms
///
/// The result is a transform that is equivalent to applying
/// \a transform followed by \a other. Mathematically, it is
/// equivalent to a matrix multiplication.
///
/// \param transform Transform object
/// \param other     Transform to combine to \a transform
///
////////////////////////////////////////////////////////////
procedure sfTransform_combine(transform: PsfTransform; const other: PsfTransform); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_combine';

////////////////////////////////////////////////////////////
/// \brief Combine a transform with a translation
///
/// \param transform Transform object
/// \param x         Offset to apply on X axis
/// \param y         Offset to apply on Y axis
///
////////////////////////////////////////////////////////////
procedure sfTransform_translate(transform: PsfTransform; x: Single; y: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_translate';

////////////////////////////////////////////////////////////
/// \brief Combine the current transform with a rotation
///
/// \param transform Transform object
/// \param angle     Rotation angle, in degrees
///
////////////////////////////////////////////////////////////
procedure sfTransform_rotate(transform: PsfTransform; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_rotate';

////////////////////////////////////////////////////////////
/// \brief Combine the current transform with a rotation
///
/// The center of rotation is provided for convenience as a second
/// argument, so that you can build rotations around arbitrary points
/// more easily (and efficiently) than the usual
/// [translate(-center), rotate(angle), translate(center)].
///
/// \param transform Transform object
/// \param angle     Rotation angle, in degrees
/// \param centerX   X coordinate of the center of rotation
/// \param centerY   Y coordinate of the center of rotation
///
////////////////////////////////////////////////////////////
procedure sfTransform_rotateWithCenter(transform: PsfTransform; angle: Single; centerX: Single; centerY: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_rotateWithCenter';

////////////////////////////////////////////////////////////
/// \brief Combine the current transform with a scaling
///
/// \param transform Transform object
/// \param scaleX    Scaling factor on the X axis
/// \param scaleY    Scaling factor on the Y axis
///
////////////////////////////////////////////////////////////
procedure sfTransform_scale(transform: PsfTransform; scaleX: Single; scaleY: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_scale';

////////////////////////////////////////////////////////////
/// \brief Combine the current transform with a scaling
///
/// The center of scaling is provided for convenience as a second
/// argument, so that you can build scaling around arbitrary points
/// more easily (and efficiently) than the usual
/// [translate(-center), scale(factors), translate(center)]
///
/// \param transform Transform object
/// \param scaleX    Scaling factor on X axis
/// \param scaleY    Scaling factor on Y axis
/// \param centerX   X coordinate of the center of scaling
/// \param centerY   Y coordinate of the center of scaling
///
////////////////////////////////////////////////////////////
procedure sfTransform_scaleWithCenter(transform: PsfTransform; scaleX: Single; scaleY: Single; centerX: Single; centerY: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_scaleWithCenter';

////////////////////////////////////////////////////////////
/// \brief Compare two transforms for equality
///
/// Performs an element-wise comparison of the elements of the
/// left transform with the elements of the right transform.
///
/// \param left Left operand (the first transform)
/// \param right Right operand (the second transform)
///
/// \return true if the transforms are equal, false otherwise
///
////////////////////////////////////////////////////////////
function sfTransform_equal(left: PsfTransform; right: PsfTransform): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_equal';

////////////////////////////////////////////////////////////
/// \brief Create a new circle shape
///
/// \return A new sfCircleShape object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfCircleShape_create(): PsfCircleShape; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing circle shape
///
/// \param shape Shape to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfCircleShape_copy(const shape: PsfCircleShape): PsfCircleShape; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing circle Shape
///
/// \param shape Shape to delete
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_destroy(shape: PsfCircleShape); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a circle shape
///
/// This function completely overwrites the previous position.
/// See sfCircleShape_move to apply an offset based on the previous position instead.
/// The default position of a circle Shape object is (0, 0).
///
/// \param shape    Shape object
/// \param position New position
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setPosition(shape: PsfCircleShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a circle shape
///
/// This function completely overwrites the previous rotation.
/// See sfCircleShape_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a circle Shape object is 0.
///
/// \param shape Shape object
/// \param angle New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setRotation(shape: PsfCircleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a circle shape
///
/// This function completely overwrites the previous scale.
/// See sfCircleShape_scale to add a factor based on the previous scale instead.
/// The default scale of a circle Shape object is (1, 1).
///
/// \param shape Shape object
/// \param scale New scale factors
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setScale(shape: PsfCircleShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a circle shape
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a circle Shape object is (0, 0).
///
/// \param shape  Shape object
/// \param origin New origin
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setOrigin(shape: PsfCircleShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a circle shape
///
/// \param shape Shape object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfCircleShape_getPosition(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a circle shape
///
/// The rotation is always in the range [0, 360].
///
/// \param shape Shape object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfCircleShape_getRotation(const shape: PsfCircleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a circle shape
///
/// \param shape Shape object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfCircleShape_getScale(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a circle shape
///
/// \param shape Shape object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfCircleShape_getOrigin(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a circle shape by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfCircleShape_setPosition which overwrites it.
///
/// \param shape  Shape object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_move(shape: PsfCircleShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a circle shape
///
/// This function adds to the current rotation of the object,
/// unlike sfCircleShape_setRotation which overwrites it.
///
/// \param shape Shape object
/// \param angle Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_rotate(shape: PsfCircleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a circle shape
///
/// This function multiplies the current scale of the object,
/// unlike sfCircleShape_setScale which overwrites it.
///
/// \param shape   Shape object
/// \param factors Scale factors
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_scale(shape: PsfCircleShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a circle shape
///
/// \param shape Shape object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfCircleShape_getTransform(const shape: PsfCircleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a circle shape
///
/// \param shape Shape object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfCircleShape_getInverseTransform(const shape: PsfCircleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Change the source texture of a circle shape
///
/// The \a texture argument refers to a texture that must
/// exist as long as the shape uses it. Indeed, the shape
/// doesn't store its own copy of the texture, but rather keeps
/// a pointer to the one that you passed to this function.
/// If the source texture is destroyed and the shape tries to
/// use it, the behaviour is undefined.
/// \a texture can be NULL to disable texturing.
/// If \a resetRect is true, the TextureRect property of
/// the shape is automatically adjusted to the size of the new
/// texture. If it is false, the texture rect is left unchanged.
///
/// \param shape     Shape object
/// \param texture   New texture
/// \param resetRect Should the texture rect be reset to the size of the new texture?
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setTexture(shape: PsfCircleShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setTexture';

////////////////////////////////////////////////////////////
/// \brief Set the sub-rectangle of the texture that a circle shape will display
///
/// The texture rect is useful when you don't want to display
/// the whole texture, but rather a part of it.
/// By default, the texture rect covers the entire texture.
///
/// \param shape Shape object
/// \param rect  Rectangle defining the region of the texture to display
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setTextureRect(shape: PsfCircleShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setTextureRect';

////////////////////////////////////////////////////////////
/// \brief Set the fill color of a circle shape
///
/// This color is modulated (multiplied) with the shape's
/// texture if any. It can be used to colorize the shape,
/// or change its global opacity.
/// You can use sfTransparent to make the inside of
/// the shape transparent, and have the outline alone.
/// By default, the shape's fill color is opaque white.
///
/// \param shape Shape object
/// \param color New color of the shape
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setFillColor(shape: PsfCircleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setFillColor';

////////////////////////////////////////////////////////////
/// \brief Set the outline color of a circle shape
///
/// You can use sfTransparent to disable the outline.
/// By default, the shape's outline color is opaque white.
///
/// \param shape Shape object
/// \param color New outline color of the shape
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setOutlineColor(shape: PsfCircleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Set the thickness of a circle shape's outline
///
/// This number cannot be negative. Using zero disables
/// the outline.
/// By default, the outline thickness is 0.
///
/// \param shape     Shape object
/// \param thickness New outline thickness
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setOutlineThickness(shape: PsfCircleShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the source texture of a circle shape
///
/// If the shape has no source texture, a NULL pointer is returned.
/// The returned pointer is const, which means that you can't
/// modify the texture when you retrieve it with this function.
///
/// \param shape Shape object
///
/// \return Pointer to the shape's texture
///
////////////////////////////////////////////////////////////
function sfCircleShape_getTexture(const shape: PsfCircleShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getTexture';

////////////////////////////////////////////////////////////
/// \brief Get the sub-rectangle of the texture displayed by a circle shape
///
/// \param shape Shape object
///
/// \return Texture rectangle of the shape
///
////////////////////////////////////////////////////////////
function sfCircleShape_getTextureRect(const shape: PsfCircleShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getTextureRect';

////////////////////////////////////////////////////////////
/// \brief Get the fill color of a circle shape
///
/// \param shape Shape object
///
/// \return Fill color of the shape
///
////////////////////////////////////////////////////////////
function sfCircleShape_getFillColor(const shape: PsfCircleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getFillColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline color of a circle shape
///
/// \param shape Shape object
///
/// \return Outline color of the shape
///
////////////////////////////////////////////////////////////
function sfCircleShape_getOutlineColor(const shape: PsfCircleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline thickness of a circle shape
///
/// \param shape Shape object
///
/// \return Outline thickness of the shape
///
////////////////////////////////////////////////////////////
function sfCircleShape_getOutlineThickness(const shape: PsfCircleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the total number of points of a circle shape
///
/// \param shape Shape object
///
/// \return Number of points of the shape
///
////////////////////////////////////////////////////////////
function sfCircleShape_getPointCount(const shape: PsfCircleShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getPointCount';

////////////////////////////////////////////////////////////
/// \brief Get a point of a circle shape
///
/// The result is undefined if \a index is out of the valid range.
///
/// \param shape Shape object
/// \param index Index of the point to get, in range [0 .. getPointCount() - 1]
///
/// \return Index-th point of the shape
///
////////////////////////////////////////////////////////////
function sfCircleShape_getPoint(const shape: PsfCircleShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getPoint';

////////////////////////////////////////////////////////////
/// \brief Set the radius of a circle
///
/// \param shape  Shape object
/// \param radius New radius of the circle
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setRadius(shape: PsfCircleShape; radius: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setRadius';

////////////////////////////////////////////////////////////
/// \brief Get the radius of a circle
///
/// \param shape Shape object
///
/// \return Radius of the circle
///
////////////////////////////////////////////////////////////
function sfCircleShape_getRadius(const shape: PsfCircleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getRadius';

////////////////////////////////////////////////////////////
/// \brief Set the number of points of a circle
///
/// \param shape Shape object
/// \param count New number of points of the circle
///
////////////////////////////////////////////////////////////
procedure sfCircleShape_setPointCount(shape: PsfCircleShape; count: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setPointCount';

////////////////////////////////////////////////////////////
/// \brief Get the local bounding rectangle of a circle shape
///
/// The returned rectangle is in local coordinates, which means
/// that it ignores the transformations (translation, rotation,
/// scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// entity in the entity's coordinate system.
///
/// \param shape Shape object
///
/// \return Local bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfCircleShape_getLocalBounds(const shape: PsfCircleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getLocalBounds';

////////////////////////////////////////////////////////////
/// \brief Get the global bounding rectangle of a circle shape
///
/// The returned rectangle is in global coordinates, which means
/// that it takes in account the transformations (translation,
/// rotation, scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// sprite in the global 2D world's coordinate system.
///
/// \param shape Shape object
///
/// \return Global bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfCircleShape_getGlobalBounds(const shape: PsfCircleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getGlobalBounds';

////////////////////////////////////////////////////////////
/// \brief Create a new convex shape
///
/// \return A new sfConvexShape object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfConvexShape_create(): PsfConvexShape; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing convex shape
///
/// \param shape Shape to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfConvexShape_copy(const shape: PsfConvexShape): PsfConvexShape; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing convex Shape
///
/// \param shape Shape to delete
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_destroy(shape: PsfConvexShape); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a convex shape
///
/// This function completely overwrites the previous position.
/// See sfConvexShape_move to apply an offset based on the previous position instead.
/// The default position of a circle Shape object is (0, 0).
///
/// \param shape    Shape object
/// \param position New position
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setPosition(shape: PsfConvexShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a convex shape
///
/// This function completely overwrites the previous rotation.
/// See sfConvexShape_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a circle Shape object is 0.
///
/// \param shape Shape object
/// \param angle New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setRotation(shape: PsfConvexShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a convex shape
///
/// This function completely overwrites the previous scale.
/// See sfConvexShape_scale to add a factor based on the previous scale instead.
/// The default scale of a circle Shape object is (1, 1).
///
/// \param shape Shape object
/// \param scale New scale factors
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setScale(shape: PsfConvexShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a convex shape
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a circle Shape object is (0, 0).
///
/// \param shape  Shape object
/// \param origin New origin
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setOrigin(shape: PsfConvexShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a convex shape
///
/// \param shape Shape object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfConvexShape_getPosition(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a convex shape
///
/// The rotation is always in the range [0, 360].
///
/// \param shape Shape object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfConvexShape_getRotation(const shape: PsfConvexShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a convex shape
///
/// \param shape Shape object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfConvexShape_getScale(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a convex shape
///
/// \param shape Shape object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfConvexShape_getOrigin(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a convex shape by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfConvexShape_setPosition which overwrites it.
///
/// \param shape  Shape object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_move(shape: PsfConvexShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a convex shape
///
/// This function adds to the current rotation of the object,
/// unlike sfConvexShape_setRotation which overwrites it.
///
/// \param shape Shape object
/// \param angle Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_rotate(shape: PsfConvexShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a convex shape
///
/// This function multiplies the current scale of the object,
/// unlike sfConvexShape_setScale which overwrites it.
///
/// \param shape   Shape object
/// \param factors Scale factors
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_scale(shape: PsfConvexShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a convex shape
///
/// \param shape shape object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfConvexShape_getTransform(const shape: PsfConvexShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a convex shape
///
/// \param shape shape object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfConvexShape_getInverseTransform(const shape: PsfConvexShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Change the source texture of a convex shape
///
/// The \a texture argument refers to a texture that must
/// exist as long as the shape uses it. Indeed, the shape
/// doesn't store its own copy of the texture, but rather keeps
/// a pointer to the one that you passed to this function.
/// If the source texture is destroyed and the shape tries to
/// use it, the behaviour is undefined.
/// \a texture can be NULL to disable texturing.
/// If \a resetRect is true, the TextureRect property of
/// the shape is automatically adjusted to the size of the new
/// texture. If it is false, the texture rect is left unchanged.
///
/// \param shape     Shape object
/// \param texture   New texture
/// \param resetRect Should the texture rect be reset to the size of the new texture?
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setTexture(shape: PsfConvexShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setTexture';

////////////////////////////////////////////////////////////
/// \brief Set the sub-rectangle of the texture that a convex shape will display
///
/// The texture rect is useful when you don't want to display
/// the whole texture, but rather a part of it.
/// By default, the texture rect covers the entire texture.
///
/// \param shape Shape object
/// \param rect  Rectangle defining the region of the texture to display
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setTextureRect(shape: PsfConvexShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setTextureRect';

////////////////////////////////////////////////////////////
/// \brief Set the fill color of a convex shape
///
/// This color is modulated (multiplied) with the shape's
/// texture if any. It can be used to colorize the shape,
/// or change its global opacity.
/// You can use sfTransparent to make the inside of
/// the shape transparent, and have the outline alone.
/// By default, the shape's fill color is opaque white.
///
/// \param shape Shape object
/// \param color New color of the shape
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setFillColor(shape: PsfConvexShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setFillColor';

////////////////////////////////////////////////////////////
/// \brief Set the outline color of a convex shape
///
/// You can use sfTransparent to disable the outline.
/// By default, the shape's outline color is opaque white.
///
/// \param shape Shape object
/// \param color New outline color of the shape
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setOutlineColor(shape: PsfConvexShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Set the thickness of a convex shape's outline
///
/// This number cannot be negative. Using zero disables
/// the outline.
/// By default, the outline thickness is 0.
///
/// \param shape     Shape object
/// \param thickness New outline thickness
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setOutlineThickness(shape: PsfConvexShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the source texture of a convex shape
///
/// If the shape has no source texture, a NULL pointer is returned.
/// The returned pointer is const, which means that you can't
/// modify the texture when you retrieve it with this function.
///
/// \param shape Shape object
///
/// \return Pointer to the shape's texture
///
////////////////////////////////////////////////////////////
function sfConvexShape_getTexture(const shape: PsfConvexShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getTexture';

////////////////////////////////////////////////////////////
/// \brief Get the sub-rectangle of the texture displayed by a convex shape
///
/// \param shape Shape object
///
/// \return Texture rectangle of the shape
///
////////////////////////////////////////////////////////////
function sfConvexShape_getTextureRect(const shape: PsfConvexShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getTextureRect';

////////////////////////////////////////////////////////////
/// \brief Get the fill color of a convex shape
///
/// \param shape Shape object
///
/// \return Fill color of the shape
///
////////////////////////////////////////////////////////////
function sfConvexShape_getFillColor(const shape: PsfConvexShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getFillColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline color of a convex shape
///
/// \param shape Shape object
///
/// \return Outline color of the shape
///
////////////////////////////////////////////////////////////
function sfConvexShape_getOutlineColor(const shape: PsfConvexShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline thickness of a convex shape
///
/// \param shape Shape object
///
/// \return Outline thickness of the shape
///
////////////////////////////////////////////////////////////
function sfConvexShape_getOutlineThickness(const shape: PsfConvexShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the total number of points of a convex shape
///
/// \param shape Shape object
///
/// \return Number of points of the shape
///
////////////////////////////////////////////////////////////
function sfConvexShape_getPointCount(const shape: PsfConvexShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getPointCount';

////////////////////////////////////////////////////////////
/// \brief Get a point of a convex shape
///
/// The result is undefined if \a index is out of the valid range.
///
/// \param shape Shape object
/// \param index Index of the point to get, in range [0 .. getPointCount() - 1]
///
/// \return Index-th point of the shape
///
////////////////////////////////////////////////////////////
function sfConvexShape_getPoint(const shape: PsfConvexShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getPoint';

////////////////////////////////////////////////////////////
/// \brief Set the number of points of a convex shap
///
/// \a count must be greater than 2 to define a valid shape.
///
/// \param shape Shape object
/// \param count New number of points of the shape
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setPointCount(shape: PsfConvexShape; count: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setPointCount';

////////////////////////////////////////////////////////////
/// \brief Set the position of a point in a convex shape
///
/// Don't forget that the polygon must remain convex, and
/// the points need to stay ordered!
/// setPointCount must be called first in order to set the total
/// number of points. The result is undefined if \a index is out
/// of the valid range.
///
/// \param shape Shape object
/// \param index Index of the point to change, in range [0 .. GetPointCount() - 1]
/// \param point New point
///
////////////////////////////////////////////////////////////
procedure sfConvexShape_setPoint(shape: PsfConvexShape; index: NativeUInt; point: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setPoint';

////////////////////////////////////////////////////////////
/// \brief Get the local bounding rectangle of a convex shape
///
/// The returned rectangle is in local coordinates, which means
/// that it ignores the transformations (translation, rotation,
/// scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// entity in the entity's coordinate system.
///
/// \param shape Shape object
///
/// \return Local bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfConvexShape_getLocalBounds(const shape: PsfConvexShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getLocalBounds';

////////////////////////////////////////////////////////////
/// \brief Get the global bounding rectangle of a convex shape
///
/// The returned rectangle is in global coordinates, which means
/// that it takes in account the transformations (translation,
/// rotation, scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// sprite in the global 2D world's coordinate system.
///
/// \param shape Shape object
///
/// \return Global bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfConvexShape_getGlobalBounds(const shape: PsfConvexShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getGlobalBounds';

////////////////////////////////////////////////////////////
/// \brief Create a new font from a file
///
/// \param filename Path of the font file to load
///
/// \return A new sfFont object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfFont_createFromFile(const filename: PUTF8Char): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_createFromFile';

////////////////////////////////////////////////////////////
/// \brief Create a new image font a file in memory
///
/// \param data        Pointer to the file data in memory
/// \param sizeInBytes Size of the data to load, in bytes
///
/// \return A new sfFont object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfFont_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_createFromMemory';

////////////////////////////////////////////////////////////
/// \brief Create a new image font a custom stream
///
/// \param stream Source stream to read from
///
/// \return A new sfFont object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfFont_createFromStream(stream: PsfInputStream): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_createFromStream';

////////////////////////////////////////////////////////////
/// \brief Copy an existing font
///
/// \param font Font to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfFont_copy(const font: PsfFont): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing font
///
/// \param font Font to delete
///
////////////////////////////////////////////////////////////
procedure sfFont_destroy(font: PsfFont); cdecl;
  external PSFML_DLL name _PU + 'sfFont_destroy';

////////////////////////////////////////////////////////////
/// \brief Get a glyph in a font
///
/// \param font             Source font
/// \param codePoint        Unicode code point of the character to get
/// \param characterSize    Character size, in pixels
/// \param bold             Retrieve the bold version or the regular one?
/// \param outlineThickness Thickness of outline (when != 0 the glyph will not be filled)
///
/// \return The corresponding glyph
///
////////////////////////////////////////////////////////////
function sfFont_getGlyph(const font: PsfFont; codePoint: sfUint32; characterSize: Cardinal; bold: sfBool; outlineThickness: Single): sfGlyph; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getGlyph';

////////////////////////////////////////////////////////////
/// \brief Get the kerning value corresponding to a given pair of characters in a font
///
/// \param font          Source font
/// \param first         Unicode code point of the first character
/// \param second        Unicode code point of the second character
/// \param characterSize Character size, in pixels
///
/// \return Kerning offset, in pixels
///
////////////////////////////////////////////////////////////
function sfFont_getKerning(const font: PsfFont; first: sfUint32; second: sfUint32; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getKerning';

////////////////////////////////////////////////////////////
/// \brief Get the bold kerning value corresponding to a given pair of characters in a font
///
/// \param font          Source font
/// \param first         Unicode code point of the first character
/// \param second        Unicode code point of the second character
/// \param characterSize Character size, in pixels
///
/// \return Kerning offset, in pixels
///
////////////////////////////////////////////////////////////
function sfFont_getBoldKerning(const font: PsfFont; first: sfUint32; second: sfUint32; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getBoldKerning';

////////////////////////////////////////////////////////////
/// \brief Get the line spacing value
///
/// \param font          Source font
/// \param characterSize Character size, in pixels
///
/// \return Line spacing, in pixels
///
////////////////////////////////////////////////////////////
function sfFont_getLineSpacing(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getLineSpacing';

////////////////////////////////////////////////////////////
/// \brief Get the position of the underline
///
/// Underline position is the vertical offset to apply between the
/// baseline and the underline.
///
/// \param font          Source font
/// \param characterSize Reference character size
///
/// \return Underline position, in pixels
///
////////////////////////////////////////////////////////////
function sfFont_getUnderlinePosition(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getUnderlinePosition';

////////////////////////////////////////////////////////////
/// \brief Get the thickness of the underline
///
/// Underline thickness is the vertical size of the underline.
///
/// \param font          Source font
/// \param characterSize Reference character size
///
/// \return Underline thickness, in pixels
///
////////////////////////////////////////////////////////////
function sfFont_getUnderlineThickness(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getUnderlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the texture containing the glyphs of a given size in a font
///
/// \param font          Source font
/// \param characterSize Character size, in pixels
///
/// \return Read-only pointer to the texture
///
////////////////////////////////////////////////////////////
function sfFont_getTexture(font: PsfFont; characterSize: Cardinal): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getTexture';

////////////////////////////////////////////////////////////
/// \brief Enable or disable the smooth filter
///
/// When the filter is activated, the font appears smoother
/// so that pixels are less noticeable. However if you want
/// the font to look exactly the same as its source file,
/// you should disable it.
/// The smooth filter is enabled by default.
///
/// \param font          Source font
/// \param smooth        sfTrue to enable smoothing, sfFalse to disable it
///
/// \see isSmooth
///
////////////////////////////////////////////////////////////
procedure sfFont_setSmooth(font: PsfFont; smooth: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfFont_setSmooth';

////////////////////////////////////////////////////////////
/// \brief Tell whether the smooth filter is enabled or disabled
///
/// \param font          Source font
///
/// \return sfTrue if smoothing is enabled, sfFalse if it is disabled
///
/// \see setSmooth
///
////////////////////////////////////////////////////////////
function sfFont_isSmooth(const font: PsfFont): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfFont_isSmooth';

////////////////////////////////////////////////////////////
/// \brief Get the font information
///
/// The returned structure will remain valid only if the font
/// is still valid. If the font is invalid an invalid structure
/// is returned.
///
/// \param font Source font
///
/// \return A structure that holds the font information
///
////////////////////////////////////////////////////////////
function sfFont_getInfo(const font: PsfFont): sfFontInfo; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getInfo';

////////////////////////////////////////////////////////////
/// \brief Create an image
///
/// This image is filled with black pixels.
///
/// \param width  Width of the image
/// \param height Height of the image
///
/// \return A new sfImage object
///
////////////////////////////////////////////////////////////
function sfImage_create(width: Cardinal; height: Cardinal): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_create';

////////////////////////////////////////////////////////////
/// \brief Create an image and fill it with a unique color
///
/// \param width  Width of the image
/// \param height Height of the image
/// \param color  Fill color
///
/// \return A new sfImage object
///
////////////////////////////////////////////////////////////
function sfImage_createFromColor(width: Cardinal; height: Cardinal; color: sfColor): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromColor';

////////////////////////////////////////////////////////////
/// \brief Create an image from an array of pixels
///
/// The \a pixel array is assumed to contain 32-bits RGBA pixels,
/// and have the given \a width and \a height. If not, this is
/// an undefined behaviour.
/// If \a pixels is null, an empty image is created.
///
/// \param width  Width of the image
/// \param height Height of the image
/// \param pixels Array of pixels to copy to the image
///
/// \return A new sfImage object
///
////////////////////////////////////////////////////////////
function sfImage_createFromPixels(width: Cardinal; height: Cardinal; const pixels: PsfUint8): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromPixels';

////////////////////////////////////////////////////////////
/// \brief Create an image from a file on disk
///
/// The supported image formats are bmp, png, tga, jpg, gif,
/// psd, hdr and pic. Some format options are not supported,
/// like progressive jpeg.
/// If this function fails, the image is left unchanged.
///
/// \param filename Path of the image file to load
///
/// \return A new sfImage object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfImage_createFromFile(const filename: PUTF8Char): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromFile';

////////////////////////////////////////////////////////////
/// \brief Create an image from a file in memory
///
/// The supported image formats are bmp, png, tga, jpg, gif,
/// psd, hdr and pic. Some format options are not supported,
/// like progressive jpeg.
/// If this function fails, the image is left unchanged.
///
/// \param data Pointer to the file data in memory
/// \param size Size of the data to load, in bytes
///
/// \return A new sfImage object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfImage_createFromMemory(const data: Pointer; size: NativeUInt): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromMemory';

////////////////////////////////////////////////////////////
/// \brief Create an image from a custom stream
///
/// The supported image formats are bmp, png, tga, jpg, gif,
/// psd, hdr and pic. Some format options are not supported,
/// like progressive jpeg.
/// If this function fails, the image is left unchanged.
///
/// \param stream Source stream to read from
///
/// \return A new sfImage object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfImage_createFromStream(stream: PsfInputStream): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromStream';

////////////////////////////////////////////////////////////
/// \brief Copy an existing image
///
/// \param image Image to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfImage_copy(const image: PsfImage): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing image
///
/// \param image Image to delete
///
////////////////////////////////////////////////////////////
procedure sfImage_destroy(image: PsfImage); cdecl;
  external PSFML_DLL name _PU + 'sfImage_destroy';

////////////////////////////////////////////////////////////
/// \brief Save an image to a file on disk
///
/// The format of the image is automatically deduced from
/// the extension. The supported image formats are bmp, png,
/// tga and jpg. The destination file is overwritten
/// if it already exists. This function fails if the image is empty.
///
/// \param image    Image object
/// \param filename Path of the file to save
///
/// \return sfTrue if saving was successful
///
/// \see sfImage_saveToMemory
///
////////////////////////////////////////////////////////////
function sfImage_saveToFile(const image: PsfImage; const filename: PUTF8Char): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfImage_saveToFile';

////////////////////////////////////////////////////////////
/// \brief Save the image to a buffer in memory
///
/// The format of the image must be specified.
/// The supported image formats are bmp, png, tga and jpg.
/// This function fails if the image is empty, or if
/// the format was invalid.
///
/// \param image  Image object
/// \param output Buffer to fill with encoded data
/// \param format Encoding format to use
///
/// \return sfTrue if saving was successful
///
/// \see sfImage_saveToFile
///
////////////////////////////////////////////////////////////
function sfImage_saveToMemory(const image: PsfImage; output: PsfBuffer; const format: PUTF8Char): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfImage_saveToMemory';

////////////////////////////////////////////////////////////
/// \brief Return the size of an image
///
/// \param image Image object
///
/// \return Size in pixels
///
////////////////////////////////////////////////////////////
function sfImage_getSize(const image: PsfImage): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfImage_getSize';

////////////////////////////////////////////////////////////
/// \brief Create a transparency mask from a specified color-key
///
/// This function sets the alpha value of every pixel matching
/// the given color to \a alpha (0 by default), so that they
/// become transparent.
///
/// \param image Image object
/// \param color Color to make transparent
/// \param alpha Alpha value to assign to transparent pixels
///
////////////////////////////////////////////////////////////
procedure sfImage_createMaskFromColor(image: PsfImage; color: sfColor; alpha: sfUint8); cdecl;
  external PSFML_DLL name _PU + 'sfImage_createMaskFromColor';

////////////////////////////////////////////////////////////
/// \brief Copy pixels from an image onto another
///
/// This function does a slow pixel copy and should not be
/// used intensively. It can be used to prepare a complex
/// static image from several others, but if you need this
/// kind of feature in real-time you'd better use sfRenderTexture.
///
/// If \a sourceRect is empty, the whole image is copied.
/// If \a applyAlpha is set to true, the transparency of
/// source pixels is applied. If it is false, the pixels are
/// copied unchanged with their alpha value.
///
/// \param image      Image object
/// \param source     Source image to copy
/// \param destX      X coordinate of the destination position
/// \param destY      Y coordinate of the destination position
/// \param sourceRect Sub-rectangle of the source image to copy
/// \param applyAlpha Should the copy take in account the source transparency?
///
////////////////////////////////////////////////////////////
procedure sfImage_copyImage(image: PsfImage; const source: PsfImage; destX: Cardinal; destY: Cardinal; sourceRect: sfIntRect; applyAlpha: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfImage_copyImage';

////////////////////////////////////////////////////////////
/// \brief Change the color of a pixel in an image
///
/// This function doesn't check the validity of the pixel
/// coordinates, using out-of-range values will result in
/// an undefined behaviour.
///
/// \param image Image object
/// \param x     X coordinate of pixel to change
/// \param y     Y coordinate of pixel to change
/// \param color New color of the pixel
///
////////////////////////////////////////////////////////////
procedure sfImage_setPixel(image: PsfImage; x: Cardinal; y: Cardinal; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfImage_setPixel';

////////////////////////////////////////////////////////////
/// \brief Get the color of a pixel in an image
///
/// This function doesn't check the validity of the pixel
/// coordinates, using out-of-range values will result in
/// an undefined behaviour.
///
/// \param image Image object
/// \param x     X coordinate of pixel to get
/// \param y     Y coordinate of pixel to get
///
/// \return Color of the pixel at coordinates (x, y)
///
////////////////////////////////////////////////////////////
function sfImage_getPixel(const image: PsfImage; x: Cardinal; y: Cardinal): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfImage_getPixel';

////////////////////////////////////////////////////////////
/// \brief Get a read-only pointer to the array of pixels of an image
///
/// The returned value points to an array of RGBA pixels made of
/// 8 bits integers components. The size of the array is
/// getWidth() * getHeight() * 4.
/// Warning: the returned pointer may become invalid if you
/// modify the image, so you should never store it for too long.
/// If the image is empty, a null pointer is returned.
///
/// \param image Image object
///
/// \return Read-only pointer to the array of pixels
///
////////////////////////////////////////////////////////////
function sfImage_getPixelsPtr(const image: PsfImage): PsfUint8; cdecl;
  external PSFML_DLL name _PU + 'sfImage_getPixelsPtr';

////////////////////////////////////////////////////////////
/// \brief Flip an image horizontally (left <-> right)
///
/// \param image Image object
///
////////////////////////////////////////////////////////////
procedure sfImage_flipHorizontally(image: PsfImage); cdecl;
  external PSFML_DLL name _PU + 'sfImage_flipHorizontally';

////////////////////////////////////////////////////////////
/// \brief Flip an image vertically (top <-> bottom)
///
/// \param image Image object
///
////////////////////////////////////////////////////////////
procedure sfImage_flipVertically(image: PsfImage); cdecl;
  external PSFML_DLL name _PU + 'sfImage_flipVertically';

////////////////////////////////////////////////////////////
/// \brief Create a new rectangle shape
///
/// \return A new sfRectangleShape object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfRectangleShape_create(): PsfRectangleShape; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing rectangle shape
///
/// \param shape Shape to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfRectangleShape_copy(const shape: PsfRectangleShape): PsfRectangleShape; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing rectangle shape
///
/// \param shape Shape to delete
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_destroy(shape: PsfRectangleShape); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a rectangle shape
///
/// This function completely overwrites the previous position.
/// See sfRectangleShape_move to apply an offset based on the previous position instead.
/// The default position of a circle Shape object is (0, 0).
///
/// \param shape    Shape object
/// \param position New position
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setPosition(shape: PsfRectangleShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a rectangle shape
///
/// This function completely overwrites the previous rotation.
/// See sfRectangleShape_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a circle Shape object is 0.
///
/// \param shape Shape object
/// \param angle New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setRotation(shape: PsfRectangleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a rectangle shape
///
/// This function completely overwrites the previous scale.
/// See sfRectangleShape_scale to add a factor based on the previous scale instead.
/// The default scale of a circle Shape object is (1, 1).
///
/// \param shape Shape object
/// \param scale New scale factors
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setScale(shape: PsfRectangleShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a rectangle shape
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a circle Shape object is (0, 0).
///
/// \param shape  Shape object
/// \param origin New origin
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setOrigin(shape: PsfRectangleShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a rectangle shape
///
/// \param shape Shape object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getPosition(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a rectangle shape
///
/// The rotation is always in the range [0, 360].
///
/// \param shape Shape object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getRotation(const shape: PsfRectangleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a rectangle shape
///
/// \param shape Shape object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getScale(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a rectangle shape
///
/// \param shape Shape object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getOrigin(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a rectangle shape by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfRectangleShape_setPosition which overwrites it.
///
/// \param shape  Shape object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_move(shape: PsfRectangleShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a rectangle shape
///
/// This function adds to the current rotation of the object,
/// unlike sfRectangleShape_setRotation which overwrites it.
///
/// \param shape Shape object
/// \param angle Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_rotate(shape: PsfRectangleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a rectangle shape
///
/// This function multiplies the current scale of the object,
/// unlike sfRectangleShape_setScale which overwrites it.
///
/// \param shape   Shape object
/// \param factors Scale factors
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_scale(shape: PsfRectangleShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a rectangle shape
///
/// \param shape shape object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getTransform(const shape: PsfRectangleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a rectangle shape
///
/// \param shape shape object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getInverseTransform(const shape: PsfRectangleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Change the source texture of a rectangle shape
///
/// The \a texture argument refers to a texture that must
/// exist as long as the shape uses it. Indeed, the shape
/// doesn't store its own copy of the texture, but rather keeps
/// a pointer to the one that you passed to this function.
/// If the source texture is destroyed and the shape tries to
/// use it, the behaviour is undefined.
/// \a texture can be NULL to disable texturing.
/// If \a resetRect is true, the TextureRect property of
/// the shape is automatically adjusted to the size of the new
/// texture. If it is false, the texture rect is left unchanged.
///
/// \param shape     Shape object
/// \param texture   New texture
/// \param resetRect Should the texture rect be reset to the size of the new texture?
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setTexture(shape: PsfRectangleShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setTexture';

////////////////////////////////////////////////////////////
/// \brief Set the sub-rectangle of the texture that a rectangle shape will display
///
/// The texture rect is useful when you don't want to display
/// the whole texture, but rather a part of it.
/// By default, the texture rect covers the entire texture.
///
/// \param shape Shape object
/// \param rect  Rectangle defining the region of the texture to display
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setTextureRect(shape: PsfRectangleShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setTextureRect';

////////////////////////////////////////////////////////////
/// \brief Set the fill color of a rectangle shape
///
/// This color is modulated (multiplied) with the shape's
/// texture if any. It can be used to colorize the shape,
/// or change its global opacity.
/// You can use sfTransparent to make the inside of
/// the shape transparent, and have the outline alone.
/// By default, the shape's fill color is opaque white.
///
/// \param shape Shape object
/// \param color New color of the shape
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setFillColor(shape: PsfRectangleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setFillColor';

////////////////////////////////////////////////////////////
/// \brief Set the outline color of a rectangle shape
///
/// You can use sfTransparent to disable the outline.
/// By default, the shape's outline color is opaque white.
///
/// \param shape Shape object
/// \param color New outline color of the shape
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setOutlineColor(shape: PsfRectangleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Set the thickness of a rectangle shape's outline
///
/// This number cannot be negative. Using zero disables
/// the outline.
/// By default, the outline thickness is 0.
///
/// \param shape     Shape object
/// \param thickness New outline thickness
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setOutlineThickness(shape: PsfRectangleShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the source texture of a rectangle shape
///
/// If the shape has no source texture, a NULL pointer is returned.
/// The returned pointer is const, which means that you can't
/// modify the texture when you retrieve it with this function.
///
/// \param shape Shape object
///
/// \return Pointer to the shape's texture
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getTexture(const shape: PsfRectangleShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getTexture';

////////////////////////////////////////////////////////////
/// \brief Get the sub-rectangle of the texture displayed by a rectangle shape
///
/// \param shape Shape object
///
/// \return Texture rectangle of the shape
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getTextureRect(const shape: PsfRectangleShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getTextureRect';

////////////////////////////////////////////////////////////
/// \brief Get the fill color of a rectangle shape
///
/// \param shape Shape object
///
/// \return Fill color of the shape
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getFillColor(const shape: PsfRectangleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getFillColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline color of a rectangle shape
///
/// \param shape Shape object
///
/// \return Outline color of the shape
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getOutlineColor(const shape: PsfRectangleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline thickness of a rectangle shape
///
/// \param shape Shape object
///
/// \return Outline thickness of the shape
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getOutlineThickness(const shape: PsfRectangleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the total number of points of a rectangle shape
///
/// \param shape Shape object
///
/// \return Number of points of the shape
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getPointCount(const shape: PsfRectangleShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getPointCount';

////////////////////////////////////////////////////////////
/// \brief Get a point of a rectangle shape
///
/// The result is undefined if \a index is out of the valid range.
///
/// \param shape Shape object
/// \param index Index of the point to get, in range [0 .. getPointCount() - 1]
///
/// \return Index-th point of the shape
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getPoint(const shape: PsfRectangleShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getPoint';

////////////////////////////////////////////////////////////
/// \brief Set the size of a rectangle shape
///
/// \param shape Shape object
/// \param size  New size of the rectangle
///
////////////////////////////////////////////////////////////
procedure sfRectangleShape_setSize(shape: PsfRectangleShape; size: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setSize';

////////////////////////////////////////////////////////////
/// \brief Get the size of a rectangle shape
///
/// \param shape Shape object
///
/// \return height Size of the rectangle
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getSize(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getSize';

////////////////////////////////////////////////////////////
/// \brief Get the local bounding rectangle of a rectangle shape
///
/// The returned rectangle is in local coordinates, which means
/// that it ignores the transformations (translation, rotation,
/// scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// entity in the entity's coordinate system.
///
/// \param shape Shape object
///
/// \return Local bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getLocalBounds(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getLocalBounds';

////////////////////////////////////////////////////////////
/// \brief Get the global bounding rectangle of a rectangle shape
///
/// The returned rectangle is in global coordinates, which means
/// that it takes in account the transformations (translation,
/// rotation, scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// sprite in the global 2D world's coordinate system.
///
/// \param shape Shape object
///
/// \return Global bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfRectangleShape_getGlobalBounds(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getGlobalBounds';

////////////////////////////////////////////////////////////
/// \brief Define the default values for a RenderState
///
////////////////////////////////////////////////////////////
function sfRenderStates_default(): sfRenderStates; cdecl;
  external PSFML_DLL name _PU + 'sfRenderStates_default';

////////////////////////////////////////////////////////////
/// \brief Construct a new render texture
///
/// \param width       Width of the render texture
/// \param height      Height of the render texture
/// \param depthBuffer Do you want a depth-buffer attached? (useful only if you're doing 3D OpenGL on the rendertexture)
///
/// \return A new sfRenderTexture object, or NULL if it failed
///
/// \deprecated
/// Use sfRenderTexture_createWithSettings instead.
///
////////////////////////////////////////////////////////////
function sfRenderTexture_create(width: Cardinal; height: Cardinal; depthBuffer: sfBool): PsfRenderTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_create';

////////////////////////////////////////////////////////////
/// \brief Construct a new render texture
///
/// \param width    Width of the render texture
/// \param height   Height of the render texture
/// \param settings Settings of the render texture
///
/// \return A new sfRenderTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfRenderTexture_createWithSettings(width: Cardinal; height: Cardinal; const settings: PsfContextSettings): PsfRenderTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_createWithSettings';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing render texture
///
/// \param renderTexture Render texture to destroy
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_destroy(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_destroy';

////////////////////////////////////////////////////////////
/// \brief Get the size of the rendering region of a render texture
///
/// \param renderTexture Render texture object
///
/// \return Size in pixels
///
////////////////////////////////////////////////////////////
function sfRenderTexture_getSize(const renderTexture: PsfRenderTexture): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getSize';

////////////////////////////////////////////////////////////
/// \brief Tell if the render texture will use sRGB encoding when drawing on it
///
/// \param renderTexture Render texture object
///
/// \return sfTrue if the render texture use sRGB encoding, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfRenderTexture_isSrgb(const renderTexture: PsfRenderTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_isSrgb';

////////////////////////////////////////////////////////////
/// \brief Activate or deactivate a render texture as the current target for rendering
///
/// \param renderTexture Render texture object
/// \param active        sfTrue to activate, sfFalse to deactivate
///
/// \return True if operation was successful, false otherwise
///
////////////////////////////////////////////////////////////
function sfRenderTexture_setActive(renderTexture: PsfRenderTexture; active: sfBool): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setActive';

////////////////////////////////////////////////////////////
/// \brief Update the contents of the target texture
///
/// \param renderTexture Render texture object
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_display(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_display';

////////////////////////////////////////////////////////////
/// \brief Clear the rendertexture with the given color
///
/// \param renderTexture Render texture object
/// \param color         Fill color
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_clear(renderTexture: PsfRenderTexture; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_clear';

////////////////////////////////////////////////////////////
/// \brief Change the current active view of a render texture
///
/// \param renderTexture Render texture object
/// \param view          Pointer to the new view
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_setView(renderTexture: PsfRenderTexture; const view: PsfView); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setView';

////////////////////////////////////////////////////////////
/// \brief Get the current active view of a render texture
///
/// \param renderTexture Render texture object
///
/// \return Current active view
///
////////////////////////////////////////////////////////////
function sfRenderTexture_getView(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getView';

////////////////////////////////////////////////////////////
/// \brief Get the default view of a render texture
///
/// \param renderTexture Render texture object
///
/// \return Default view of the rendertexture
///
////////////////////////////////////////////////////////////
function sfRenderTexture_getDefaultView(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getDefaultView';

////////////////////////////////////////////////////////////
/// \brief Get the viewport of a view applied to this target
///
/// \param renderTexture Render texture object
/// \param view          Target view
///
/// \return Viewport rectangle, expressed in pixels in the current target
///
////////////////////////////////////////////////////////////
function sfRenderTexture_getViewport(const renderTexture: PsfRenderTexture; const view: PsfView): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getViewport';

////////////////////////////////////////////////////////////
/// \brief Convert a point from texture coordinates to world coordinates
///
/// This function finds the 2D position that matches the
/// given pixel of the render-texture. In other words, it does
/// the inverse of what the graphics card does, to find the
/// initial position of a rendered pixel.
///
/// Initially, both coordinate systems (world units and target pixels)
/// match perfectly. But if you define a custom view or resize your
/// render-texture, this assertion is not true anymore, ie. a point
/// located at (10, 50) in your render-texture may map to the point
/// (150, 75) in your 2D world -- if the view is translated by (140, 25).
///
/// This version uses a custom view for calculations, see the other
/// overload of the function if you want to use the current view of the
/// render-texture.
///
/// \param renderTexture Render texture object
/// \param point Pixel to convert
/// \param view The view to use for converting the point
///
/// \return The converted point, in "world" units
///
////////////////////////////////////////////////////////////
function sfRenderTexture_mapPixelToCoords(const renderTexture: PsfRenderTexture; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_mapPixelToCoords';

////////////////////////////////////////////////////////////
/// \brief Convert a point from world coordinates to texture coordinates
///
/// This function finds the pixel of the render-texture that matches
/// the given 2D point. In other words, it goes through the same process
/// as the graphics card, to compute the final position of a rendered point.
///
/// Initially, both coordinate systems (world units and target pixels)
/// match perfectly. But if you define a custom view or resize your
/// render-texture, this assertion is not true anymore, ie. a point
/// located at (150, 75) in your 2D world may map to the pixel
/// (10, 50) of your render-texture -- if the view is translated by (140, 25).
///
/// This version uses a custom view for calculations, see the other
/// overload of the function if you want to use the current view of the
/// render-texture.
///
/// \param renderTexture Render texture object
/// \param point Point to convert
/// \param view The view to use for converting the point
///
/// \return The converted point, in target coordinates (pixels)
///
////////////////////////////////////////////////////////////
function sfRenderTexture_mapCoordsToPixel(const renderTexture: PsfRenderTexture; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_mapCoordsToPixel';

////////////////////////////////////////////////////////////
/// \brief Draw a drawable object to the render-target
///
/// \param renderTexture Render texture object
/// \param object        Object to draw
/// \param states        Render states to use for drawing (NULL to use the default states)
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_drawSprite(renderTexture: PsfRenderTexture; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawSprite';

procedure sfRenderTexture_drawText(renderTexture: PsfRenderTexture; const &object: PsfText; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawText';

procedure sfRenderTexture_drawShape(renderTexture: PsfRenderTexture; const &object: PsfShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawShape';

procedure sfRenderTexture_drawCircleShape(renderTexture: PsfRenderTexture; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawCircleShape';

procedure sfRenderTexture_drawConvexShape(renderTexture: PsfRenderTexture; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawConvexShape';

procedure sfRenderTexture_drawRectangleShape(renderTexture: PsfRenderTexture; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawRectangleShape';

procedure sfRenderTexture_drawVertexArray(renderTexture: PsfRenderTexture; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawVertexArray';

procedure sfRenderTexture_drawVertexBuffer(renderTexture: PsfRenderTexture; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawVertexBuffer';

////////////////////////////////////////////////////////////
/// \brief Draw primitives defined by a vertex buffer.
///
/// \param renderTexture render texture object
/// \param vertexBuffer  Vertex buffer object to draw
/// \param firstVertex   Index of the first vertex to render
/// \param vertexCount   Number of vertices to render
/// \param states        Render states to use for drawing
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_drawVertexBufferRange(renderTexture: PsfRenderTexture; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawVertexBufferRange';

////////////////////////////////////////////////////////////
/// \brief Draw primitives defined by an array of vertices to a render texture
///
/// \param renderTexture Render texture object
/// \param vertices      Pointer to the vertices
/// \param vertexCount   Number of vertices in the array
/// \param type          Type of primitives to draw
/// \param states        Render states to use for drawing (NULL to use the default states)
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_drawPrimitives(renderTexture: PsfRenderTexture; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawPrimitives';

////////////////////////////////////////////////////////////
/// \brief Save the current OpenGL render states and matrices
///
/// This function can be used when you mix SFML drawing
/// and direct OpenGL rendering. Combined with popGLStates,
/// it ensures that:
/// \li SFML's internal states are not messed up by your OpenGL code
/// \li your OpenGL states are not modified by a call to a SFML function
///
/// Note that this function is quite expensive: it saves all the
/// possible OpenGL states and matrices, even the ones you
/// don't care about. Therefore it should be used wisely.
/// It is provided for convenience, but the best results will
/// be achieved if you handle OpenGL states yourself (because
/// you know which states have really changed, and need to be
/// saved and restored). Take a look at the resetGLStates
/// function if you do so.
///
/// \param renderTexture Render texture object
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_pushGLStates(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_pushGLStates';

////////////////////////////////////////////////////////////
/// \brief Restore the previously saved OpenGL render states and matrices
///
/// See the description of pushGLStates to get a detailed
/// description of these functions.
///
/// \param renderTexture Render texture object
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_popGLStates(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_popGLStates';

////////////////////////////////////////////////////////////
/// \brief Reset the internal OpenGL states so that the target is ready for drawing
///
/// This function can be used when you mix SFML drawing
/// and direct OpenGL rendering, if you choose not to use
/// pushGLStates/popGLStates. It makes sure that all OpenGL
/// states needed by SFML are set, so that subsequent sfRenderTexture_draw*()
/// calls will work as expected.
///
/// \param renderTexture Render texture object
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_resetGLStates(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_resetGLStates';

////////////////////////////////////////////////////////////
/// \brief Get the target texture of a render texture
///
/// \param renderTexture Render texture object
///
/// \return Pointer to the target texture
///
////////////////////////////////////////////////////////////
function sfRenderTexture_getTexture(const renderTexture: PsfRenderTexture): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getTexture';

////////////////////////////////////////////////////////////
/// \brief Get the maximum anti-aliasing level supported by the system
///
/// \return The maximum anti-aliasing level supported by the system
///
////////////////////////////////////////////////////////////
function sfRenderTexture_getMaximumAntialiasingLevel(): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getMaximumAntialiasingLevel';

////////////////////////////////////////////////////////////
/// \brief Enable or disable the smooth filter on a render texture
///
/// \param renderTexture Render texture object
/// \param smooth        sfTrue to enable smoothing, sfFalse to disable it
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_setSmooth(renderTexture: PsfRenderTexture; smooth: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setSmooth';

////////////////////////////////////////////////////////////
/// \brief Tell whether the smooth filter is enabled or not for a render texture
///
/// \param renderTexture Render texture object
///
/// \return sfTrue if smoothing is enabled, sfFalse if it is disabled
///
////////////////////////////////////////////////////////////
function sfRenderTexture_isSmooth(const renderTexture: PsfRenderTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_isSmooth';

////////////////////////////////////////////////////////////
/// \brief Enable or disable texture repeating
///
/// \param renderTexture Render texture object
/// \param repeated      sfTrue to enable repeating, sfFalse to disable it
///
////////////////////////////////////////////////////////////
procedure sfRenderTexture_setRepeated(renderTexture: PsfRenderTexture; repeated: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setRepeated';

////////////////////////////////////////////////////////////
/// \brief Tell whether the texture is repeated or not
///
/// \param renderTexture Render texture object
///
/// \return sfTrue if repeat mode is enabled, sfFalse if it is disabled
///
////////////////////////////////////////////////////////////
function sfRenderTexture_isRepeated(const renderTexture: PsfRenderTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_isRepeated';

////////////////////////////////////////////////////////////
/// \brief Generate a mipmap using the current texture data
///
/// This function is similar to sfTexture_generateMipmap and operates
/// on the texture used as the target for drawing.
/// Be aware that any draw operation may modify the base level image data.
/// For this reason, calling this function only makes sense after all
/// drawing is completed and display has been called. Not calling display
/// after subsequent drawing will lead to undefined behavior if a mipmap
/// had been previously generated.
///
/// \return sfTrue if mipmap generation was successful, sfFalse if unsuccessful
///
////////////////////////////////////////////////////////////
function sfRenderTexture_generateMipmap(renderTexture: PsfRenderTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_generateMipmap';

////////////////////////////////////////////////////////////
/// \brief Construct a new render window
///
/// \param mode     Video mode to use
/// \param title    Title of the window
/// \param style    Window style
/// \param settings Creation settings (pass NULL to use default values)
///
////////////////////////////////////////////////////////////
function sfRenderWindow_create(mode: sfVideoMode; const title: PUTF8Char; style: sfUint32; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_create';

////////////////////////////////////////////////////////////
/// \brief Construct a new render window (with a UTF-32 title)
///
/// \param mode     Video mode to use
/// \param title    Title of the window (UTF-32)
/// \param style    Window style
/// \param settings Creation settings (pass NULL to use default values)
///
////////////////////////////////////////////////////////////
function sfRenderWindow_createUnicode(mode: sfVideoMode; const title: PsfUint32; style: sfUint32; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_createUnicode';

////////////////////////////////////////////////////////////
/// \brief Construct a render window from an existing control
///
/// \param handle   Platform-specific handle of the control
/// \param settings Creation settings (pass NULL to use default values)
///
////////////////////////////////////////////////////////////
function sfRenderWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_createFromHandle';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing render window
///
/// \param renderWindow Render window to destroy
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_destroy(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_destroy';

////////////////////////////////////////////////////////////
/// \brief Close a render window (but doesn't destroy the internal data)
///
/// \param renderWindow Render window to close
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_close(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_close';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not a render window is opened
///
/// \param renderWindow Render window object
///
////////////////////////////////////////////////////////////
function sfRenderWindow_isOpen(const renderWindow: PsfRenderWindow): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_isOpen';

////////////////////////////////////////////////////////////
/// \brief Get the creation settings of a render window
///
/// \param renderWindow Render window object
///
/// \return Settings used to create the window
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getSettings(const renderWindow: PsfRenderWindow): sfContextSettings; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getSettings';

////////////////////////////////////////////////////////////
/// \brief Get the event on top of event queue of a render window, if any, and pop it
///
/// \param renderWindow Render window object
/// \param event        Event to fill, if any
///
/// \return sfTrue if an event was returned, sfFalse if event queue was empty
///
////////////////////////////////////////////////////////////
function sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_pollEvent';

////////////////////////////////////////////////////////////
/// \brief Wait for an event and return it
///
/// \param renderWindow Render window object
/// \param event        Event to fill
///
/// \return sfFalse if an error occured
///
////////////////////////////////////////////////////////////
function sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; event: PsfEvent): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_waitEvent';

////////////////////////////////////////////////////////////
/// \brief Get the position of a render window
///
/// \param renderWindow Render window object
///
/// \return Position in pixels
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getPosition(const renderWindow: PsfRenderWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getPosition';

////////////////////////////////////////////////////////////
/// \brief Change the position of a render window on screen
///
/// Only works for top-level windows
///
/// \param renderWindow Render window object
/// \param position     New position, in pixels
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: sfVector2i); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setPosition';

////////////////////////////////////////////////////////////
/// \brief Get the size of the rendering region of a render window
///
/// \param renderWindow Render window object
///
/// \return Size in pixels
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getSize(const renderWindow: PsfRenderWindow): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getSize';

////////////////////////////////////////////////////////////
/// \brief Tell if the render window will use sRGB encoding when drawing on it
///
/// \param renderWindow Render window object
///
/// \return sfTrue if the render window use sRGB encoding, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfRenderWindow_isSrgb(const renderWindow: PsfRenderWindow): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_isSrgb';

////////////////////////////////////////////////////////////
/// \brief Change the size of the rendering region of a render window
///
/// \param renderWindow Render window object
/// \param size         New size, in pixels
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setSize';

////////////////////////////////////////////////////////////
/// \brief Change the title of a render window
///
/// \param renderWindow Render window object
/// \param title        New title
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setTitle(renderWindow: PsfRenderWindow; const title: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setTitle';

////////////////////////////////////////////////////////////
/// \brief Change the title of a render window (with a UTF-32 string)
///
/// \param renderWindow Render window object
/// \param title        New title
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; const title: PsfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setUnicodeTitle';

////////////////////////////////////////////////////////////
/// \brief Change a render window's icon
///
/// \param renderWindow Render window object
/// \param width        Icon's width, in pixels
/// \param height       Icon's height, in pixels
/// \param pixels       Pointer to the pixels in memory, format must be RGBA 32 bits
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; width: Cardinal; height: Cardinal; const pixels: PsfUint8); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setIcon';

////////////////////////////////////////////////////////////
/// \brief Show or hide a render window
///
/// \param renderWindow Render window object
/// \param visible      sfTrue to show the window, sfFalse to hide it
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setVisible';

////////////////////////////////////////////////////////////
/// \brief Enable / disable vertical synchronization on a render window
///
/// \param renderWindow Render window object
/// \param enabled      sfTrue to enable v-sync, sfFalse to deactivate
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setVerticalSyncEnabled';

////////////////////////////////////////////////////////////
/// \brief Show or hide the mouse cursor on a render window
///
/// \param renderWindow Render window object
/// \param show         sfTrue to show, sfFalse to hide
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setMouseCursorVisible';

////////////////////////////////////////////////////////////
/// \brief Grab or release the mouse cursor
///
/// If set, grabs the mouse cursor inside this window's client
/// area so it may no longer be moved outside its bounds.
/// Note that grabbing is only active while the window has
/// focus and calling this function for fullscreen windows
/// won't have any effect (fullscreen windows always grab the
/// cursor).
///
/// \param grabbed sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setMouseCursorGrabbed';

////////////////////////////////////////////////////////////
/// \brief Set the displayed cursor to a native system cursor
///
/// Upon window creation, the arrow cursor is used by default.
///
/// \warning The cursor must not be destroyed while in use by
///          the window.
///
/// \warning Features related to Cursor are not supported on
///          iOS and Android.
///
/// \param cursor Native system cursor type to display
///
/// \see sfCursor_createFromSystem
/// \see sfCursor_createFromPixels
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setMouseCursor(window: PsfRenderWindow; const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setMouseCursor';

////////////////////////////////////////////////////////////
/// \brief Enable or disable automatic key-repeat for keydown events
///
/// Automatic key-repeat is enabled by default
///
/// \param renderWindow Render window object
/// \param enabled      sfTrue to enable, sfFalse to disable
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setKeyRepeatEnabled';

////////////////////////////////////////////////////////////
/// \brief Limit the framerate to a maximum fixed frequency for a render window
///
/// \param renderWindow Render window object
/// \param limit        Framerate limit, in frames per seconds (use 0 to disable limit)
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setFramerateLimit(renderWindow: PsfRenderWindow; limit: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setFramerateLimit';

////////////////////////////////////////////////////////////
/// \brief Change the joystick threshold, ie. the value below which no move event will be generated
///
/// \param renderWindow Render window object
/// \param threshold    New threshold, in range [0, 100]
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setJoystickThreshold';

////////////////////////////////////////////////////////////
/// \brief Activate or deactivate a render window as the current target for rendering
///
/// \param renderWindow Render window object
/// \param active       sfTrue to activate, sfFalse to deactivate
///
/// \return True if operation was successful, false otherwise
///
////////////////////////////////////////////////////////////
function sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: sfBool): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setActive';

///////////////////////////////////////////////////////////
/// \brief Request the current render window to be made the active
/// foreground window
///
/// At any given time, only one window may have the input focus
/// to receive input events such as keystrokes or mouse events.
/// If a window requests focus, it only hints to the operating
/// system, that it would like to be focused. The operating system
/// is free to deny the request.
/// This is not to be confused with sfWindow_setActive().
///
///////////////////////////////////////////////////////////
procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_requestFocus';

////////////////////////////////////////////////////////////
/// \brief Check whether the render window has the input focus
///
/// At any given time, only one window may have the input focus
/// to receive input events such as keystrokes or most mouse
/// events.
///
/// \return True if window has focus, false otherwise
///
////////////////////////////////////////////////////////////
function sfRenderWindow_hasFocus(const renderWindow: PsfRenderWindow): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_hasFocus';

////////////////////////////////////////////////////////////
/// \brief Display a render window on screen
///
/// \param renderWindow Render window object
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_display(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_display';

////////////////////////////////////////////////////////////
/// \brief Retrieve the OS-specific handle of a render window
///
/// \param renderWindow Render window object
///
/// \return Window handle
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getSystemHandle(const renderWindow: PsfRenderWindow): sfWindowHandle; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getSystemHandle';

////////////////////////////////////////////////////////////
/// \brief Clear a render window with the given color
///
/// \param renderWindow Render window object
/// \param color        Fill color
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_clear';

////////////////////////////////////////////////////////////
/// \brief Change the current active view of a render window
///
/// \param renderWindow Render window object
/// \param view         Pointer to the new view
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; const view: PsfView); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setView';

////////////////////////////////////////////////////////////
/// \brief Get the current active view of a render window
///
/// \param renderWindow Render window object
///
/// \return Current active view
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getView(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getView';

////////////////////////////////////////////////////////////
/// \brief Get the default view of a render window
///
/// \param renderWindow Render window object
///
/// \return Default view of the render window
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getDefaultView(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getDefaultView';

////////////////////////////////////////////////////////////
/// \brief Get the viewport of a view applied to this target
///
/// \param renderWindow Render window object
/// \param view         Target view
///
/// \return Viewport rectangle, expressed in pixels in the current target
///
////////////////////////////////////////////////////////////
function sfRenderWindow_getViewport(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getViewport';

////////////////////////////////////////////////////////////
/// \brief Convert a point from window coordinates to world coordinates
///
/// This function finds the 2D position that matches the
/// given pixel of the render-window. In other words, it does
/// the inverse of what the graphics card does, to find the
/// initial position of a rendered pixel.
///
/// Initially, both coordinate systems (world units and target pixels)
/// match perfectly. But if you define a custom view or resize your
/// render-window, this assertion is not true anymore, ie. a point
/// located at (10, 50) in your render-window may map to the point
/// (150, 75) in your 2D world -- if the view is translated by (140, 25).
///
/// This function is typically used to find which point (or object) is
/// located below the mouse cursor.
///
/// This version uses a custom view for calculations, see the other
/// overload of the function if you want to use the current view of the
/// render-window.
///
/// \param renderWindow Render window object
/// \param point Pixel to convert
/// \param view The view to use for converting the point
///
/// \return The converted point, in "world" units
///
////////////////////////////////////////////////////////////
function sfRenderWindow_mapPixelToCoords(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_mapPixelToCoords';

////////////////////////////////////////////////////////////
/// \brief Convert a point from world coordinates to window coordinates
///
/// This function finds the pixel of the render-window that matches
/// the given 2D point. In other words, it goes through the same process
/// as the graphics card, to compute the final position of a rendered point.
///
/// Initially, both coordinate systems (world units and target pixels)
/// match perfectly. But if you define a custom view or resize your
/// render-window, this assertion is not true anymore, ie. a point
/// located at (150, 75) in your 2D world may map to the pixel
/// (10, 50) of your render-window -- if the view is translated by (140, 25).
///
/// This version uses a custom view for calculations, see the other
/// overload of the function if you want to use the current view of the
/// render-window.
///
/// \param renderWindow Render window object
/// \param point Point to convert
/// \param view The view to use for converting the point
///
/// \return The converted point, in target coordinates (pixels)
///
////////////////////////////////////////////////////////////
function sfRenderWindow_mapCoordsToPixel(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_mapCoordsToPixel';

////////////////////////////////////////////////////////////
/// \brief Draw a drawable object to the render-target
///
/// \param renderWindow render window object
/// \param object       Object to draw
/// \param states       Render states to use for drawing (NULL to use the default states)
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawSprite';

procedure sfRenderWindow_drawText(renderWindow: PsfRenderWindow; const &object: PsfText; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawText';

procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawShape';

procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawCircleShape';

procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawConvexShape';

procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawRectangleShape';

procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawVertexArray';

procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawVertexBuffer';

////////////////////////////////////////////////////////////
/// \brief Draw primitives defined by a vertex buffer.
///
/// \param renderWindow render window object
/// \param vertexBuffer Vertex buffer object to draw
/// \param firstVertex  Index of the first vertex to render
/// \param vertexCount  Number of vertices to render
/// \param states       Render states to use for drawing
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawVertexBufferRange';

////////////////////////////////////////////////////////////
/// \brief Draw primitives defined by an array of vertices to a render window
///
/// \param renderWindow render window object
/// \param vertices     Pointer to the vertices
/// \param vertexCount  Number of vertices in the array
/// \param type         Type of primitives to draw
/// \param states       Render states to use for drawing (NULL to use the default states)
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawPrimitives';

////////////////////////////////////////////////////////////
/// \brief Save the current OpenGL render states and matrices
///
/// This function can be used when you mix SFML drawing
/// and direct OpenGL rendering. Combined with popGLStates,
/// it ensures that:
/// \li SFML's internal states are not messed up by your OpenGL code
/// \li your OpenGL states are not modified by a call to a SFML function
///
/// Note that this function is quite expensive: it saves all the
/// possible OpenGL states and matrices, even the ones you
/// don't care about. Therefore it should be used wisely.
/// It is provided for convenience, but the best results will
/// be achieved if you handle OpenGL states yourself (because
/// you know which states have really changed, and need to be
/// saved and restored). Take a look at the resetGLStates
/// function if you do so.
///
/// \param renderWindow render window object
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_pushGLStates';

////////////////////////////////////////////////////////////
/// \brief Restore the previously saved OpenGL render states and matrices
///
/// See the description of pushGLStates to get a detailed
/// description of these functions.
///
/// \param renderWindow render window object
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_popGLStates';

////////////////////////////////////////////////////////////
/// \brief Reset the internal OpenGL states so that the target is ready for drawing
///
/// This function can be used when you mix SFML drawing
/// and direct OpenGL rendering, if you choose not to use
/// pushGLStates/popGLStates. It makes sure that all OpenGL
/// states needed by SFML are set, so that subsequent sfRenderWindow_draw*()
/// calls will work as expected.
///
/// \param renderWindow render window object
///
////////////////////////////////////////////////////////////
procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_resetGLStates';

////////////////////////////////////////////////////////////
/// \brief Copy the current contents of the window to an image
///
/// \deprecated
/// Use a sfTexture and its
/// sfTexture_updateFromRenderWindow(sfTexture*, const sfRenderWindow*, unsigned int, unsigned int)
/// function and copy its contents into an sfImage instead.
/// \code
/// sfVector2u windowSize = sfRenderWindow_getSize(window);
/// sfTexture* texture = sfTexture_create(windowSize.x, windowSize.y);
/// sfTexture_updateFromRenderWindow(texture, window, windowSize.x, windowSize.y);
/// sfImage* screenshot = sfTexture_copyToImage(texture);
/// \endcode
///
/// This is a slow operation, whose main purpose is to make
/// screenshots of the application. If you want to update an
/// image with the contents of the window and then use it for
/// drawing, you should rather use a sfTexture and the
/// sfTexture_updateFromWindow(sfTexture*, const sfWindow*, unsigned int, unsigned int) function.
/// You can also draw things directly to a texture with the
/// sfRenderTexture class.
///
/// \return sfImage containing the captured contents.
///
////////////////////////////////////////////////////////////
function sfRenderWindow_capture(const renderWindow: PsfRenderWindow): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_capture';

////////////////////////////////////////////////////////////
/// \brief Get the current position of the mouse relative to a render-window
///
/// This function returns the current position of the mouse
/// cursor relative to the given render-window, or desktop if NULL is passed.
///
/// \param relativeTo Reference window
///
/// \return Position of the mouse cursor, relative to the given render window
///
////////////////////////////////////////////////////////////
function sfMouse_getPositionRenderWindow(const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_getPositionRenderWindow';

////////////////////////////////////////////////////////////
/// \brief Set the current position of the mouse relative to a render window
///
/// This function sets the current position of the mouse
/// cursor relative to the given render-window, or desktop if NULL is passed.
///
/// \param position   New position of the mouse
/// \param relativeTo Reference window
///
////////////////////////////////////////////////////////////
procedure sfMouse_setPositionRenderWindow(position: sfVector2i; const relativeTo: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfMouse_setPositionRenderWindow';

////////////////////////////////////////////////////////////
/// \brief Get the current position of a touch in window coordinates
///
/// This function returns the current touch position
/// relative to the given render window, or desktop if NULL is passed.
///
/// \param finger Finger index
/// \param relativeTo Reference window
///
/// \return Current position of \a finger, or undefined if it's not down
///
////////////////////////////////////////////////////////////
function sfTouch_getPositionRenderWindow(finger: Cardinal; const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_getPositionRenderWindow';

////////////////////////////////////////////////////////////
/// \brief Load the vertex, geometry and fragment shaders from files
///
/// This function loads the vertex, geometry and fragment
/// shaders. Pass NULL if you don't want to load
/// a specific shader.
/// The sources must be text files containing valid shaders
/// in GLSL language. GLSL is a C-like language dedicated to
/// OpenGL shaders; you'll probably need to read a good documentation
/// for it before writing your own shaders.
///
/// \param vertexShaderFilename   Path of the vertex shader file to load, or NULL to skip this shader
/// \param geometryShaderFilename Path of the geometry shader file to load, or NULL to skip this shader
/// \param fragmentShaderFilename Path of the fragment shader file to load, or NULL to skip this shader
///
/// \return A new sfShader object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfShader_createFromFile(const vertexShaderFilename: PUTF8Char; const geometryShaderFilename: PUTF8Char; const fragmentShaderFilename: PUTF8Char): PsfShader; cdecl;
  external PSFML_DLL name _PU + 'sfShader_createFromFile';

////////////////////////////////////////////////////////////
/// \brief Load the vertex, geometry and fragment shaders from source code in memory
///
/// This function loads the vertex, geometry and fragment
/// shaders. Pass NULL if you don't want to load
/// a specific shader.
/// The sources must be valid shaders in GLSL language. GLSL is
/// a C-like language dedicated to OpenGL shaders; you'll
/// probably need to read a good documentation for it before
/// writing your own shaders.
///
/// \param vertexShader   String containing the source code of the vertex shader, or NULL to skip this shader
/// \param geometryShader String containing the source code of the geometry shader, or NULL to skip this shader
/// \param fragmentShader String containing the source code of the fragment shader, or NULL to skip this shader
///
/// \return A new sfShader object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfShader_createFromMemory(const vertexShader: PUTF8Char; const geometryShader: PUTF8Char; const fragmentShader: PUTF8Char): PsfShader; cdecl;
  external PSFML_DLL name _PU + 'sfShader_createFromMemory';

////////////////////////////////////////////////////////////
/// \brief Load the vertex, geometry and fragment shaders from custom streams
///
/// This function loads the vertex, geometry and fragment
/// shaders. Pass NULL if you don't want to load
/// a specific shader.
/// The source codes must be valid shaders in GLSL language.
/// GLSL is a C-like language dedicated to OpenGL shaders;
/// you'll probably need to read a good documentation for
/// it before writing your own shaders.
///
/// \param vertexShaderStream   Source stream to read the vertex shader from, or NULL to skip this shader
/// \param geometryShaderStream Source stream to read the geometry shader from, or NULL to skip this shader
/// \param fragmentShaderStream Source stream to read the fragment shader from, or NULL to skip this shader
///
/// \return A new sfShader object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl;
  external PSFML_DLL name _PU + 'sfShader_createFromStream';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing shader
///
/// \param shader Shader to delete
///
////////////////////////////////////////////////////////////
procedure sfShader_destroy(shader: PsfShader); cdecl;
  external PSFML_DLL name _PU + 'sfShader_destroy';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p float uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param x      Value of the float scalar
///
////////////////////////////////////////////////////////////
procedure sfShader_setFloatUniform(shader: PsfShader; const name: PUTF8Char; x: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloatUniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p vec2 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the vec2 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setVec2Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec2); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec2Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p vec3 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the vec3 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setVec3Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec3Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p vec4 uniform
///
/// sfColor objects can be passed to this function via
/// the use of sfGlslVec4_fromsfColor(sfColor);
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the vec4 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setVec4Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec4Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p vec4 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param color  Value of the vec4 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setColorUniform(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setColorUniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p int uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param x      Value of the integer scalar
///
////////////////////////////////////////////////////////////
procedure sfShader_setIntUniform(shader: PsfShader; const name: PUTF8Char; x: Integer); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIntUniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p ivec2 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the ivec2 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setIvec2Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec2); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIvec2Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p ivec3 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the ivec3 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setIvec3Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIvec3Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p ivec4 uniform
///
/// sfColor objects can be passed to this function via
/// the use of sfGlslIvec4_fromsfColor(sfColor);
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the ivec4 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setIvec4Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIvec4Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p ivec4 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param color  Value of the ivec4 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setIntColorUniform(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIntColorUniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p bool uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param x      Value of the bool scalar
///
////////////////////////////////////////////////////////////
procedure sfShader_setBoolUniform(shader: PsfShader; const name: PUTF8Char; x: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBoolUniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p bvec2 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the bvec2 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setBvec2Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec2); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBvec2Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p Bvec3 uniform
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the Bvec3 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setBvec3Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBvec3Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p bvec4 uniform
///
/// sfColor objects can be passed to this function via
/// the use of sfGlslIvec4_fromsfColor(sfColor);
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param vector Value of the bvec4 vector
///
////////////////////////////////////////////////////////////
procedure sfShader_setBvec4Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBvec4Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p mat3 matrix
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param matrix Value of the mat3 matrix
///
////////////////////////////////////////////////////////////
procedure sfShader_setMat3Uniform(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat3Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify value for \p mat4 matrix
///
/// \param shader Shader object
/// \param name   Name of the uniform variable in GLSL
/// \param matrix Value of the mat4 matrix
///
////////////////////////////////////////////////////////////
procedure sfShader_setMat4Uniform(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat4Uniform';

////////////////////////////////////////////////////////////
/// \brief Specify a texture as \p sampler2D uniform
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 2D texture
/// (\p sampler2D GLSL type).
///
/// Example:
/// \code
/// uniform sampler2D the_texture; // this is the variable in the shader
/// \endcode
/// \code
/// sfTexture texture;
/// ...
/// sfShader_setTextureUniform(shader, "the_texture", &texture);
/// \endcode
/// It is important to note that \a texture must remain alive as long
/// as the shader uses it, no copy is made internally.
///
/// To use the texture of the object being drawn, which cannot be
/// known in advance, you can pass the special value
/// sf::Shader::CurrentTexture:
/// \code
/// shader.setUniform("the_texture", sf::Shader::CurrentTexture).
/// \endcode
///
/// \param shader  Shader object
/// \param name    Name of the texture in the shader
/// \param texture Texture to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setTextureUniform(shader: PsfShader; const name: PUTF8Char; const texture: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setTextureUniform';

////////////////////////////////////////////////////////////
/// \brief Specify current texture as \p sampler2D uniform
///
/// This overload maps a shader texture variable to the
/// texture of the object being drawn, which cannot be
/// known in advance.
/// The corresponding parameter in the shader must be a 2D texture
/// (\p sampler2D GLSL type).
///
/// Example:
/// \code
/// uniform sampler2D current; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setCurrentTextureUniform(shader, "current");
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the texture in the shader
///
////////////////////////////////////////////////////////////
procedure sfShader_setCurrentTextureUniform(shader: PsfShader; const name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setCurrentTextureUniform';

////////////////////////////////////////////////////////////
/// \brief Specify values for \p float[] array uniform
///
/// \param shader      Shader object
/// \param name        Name of the uniform variable in GLSL
/// \param scalarArray pointer to array of \p float values
/// \param length      Number of elements in the array
///
////////////////////////////////////////////////////////////
procedure sfShader_setFloatUniformArray(shader: PsfShader; const name: PUTF8Char; const scalarArray: PSingle; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloatUniformArray';

////////////////////////////////////////////////////////////
/// \brief Specify values for \p vec2[] array uniform
///
/// \param shader      Shader object
/// \param name        Name of the uniform variable in GLSL
/// \param vectorArray pointer to array of \p vec2 values
/// \param length      Number of elements in the array
///
////////////////////////////////////////////////////////////
procedure sfShader_setVec2UniformArray(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec2; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec2UniformArray';

////////////////////////////////////////////////////////////
/// \brief Specify values for \p vec3[] array uniform
///
/// \param shader      Shader object
/// \param name        Name of the uniform variable in GLSL
/// \param vectorArray pointer to array of \p vec3 values
/// \param length      Number of elements in the array
///
////////////////////////////////////////////////////////////
procedure sfShader_setVec3UniformArray(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec3; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec3UniformArray';

////////////////////////////////////////////////////////////
/// \brief Specify values for \p vec4[] array uniform
///
/// \param shader      Shader object
/// \param name        Name of the uniform variable in GLSL
/// \param vectorArray pointer to array of \p vec4 values
/// \param length      Number of elements in the array
///
////////////////////////////////////////////////////////////
procedure sfShader_setVec4UniformArray(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec4; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec4UniformArray';

////////////////////////////////////////////////////////////
/// \brief Specify values for \p mat3[] array uniform
///
/// \param shader      Shader object
/// \param name        Name of the uniform variable in GLSL
/// \param matrixArray pointer to array of \p mat3 values
/// \param length      Number of elements in the array
///
////////////////////////////////////////////////////////////
procedure sfShader_setMat3UniformArray(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat3; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat3UniformArray';

////////////////////////////////////////////////////////////
/// \brief Specify values for \p mat4[] array uniform
///
/// \param shader      Shader object
/// \param name        Name of the uniform variable in GLSL
/// \param matrixArray pointer to array of \p mat4 values
/// \param length      Number of elements in the array
///
////////////////////////////////////////////////////////////
procedure sfShader_setMat4UniformArray(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat4; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat4UniformArray';

////////////////////////////////////////////////////////////
/// \brief Change a float parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a float
/// (float GLSL type).
///
/// Example:
/// \code
/// uniform float myparam; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setFloatParameter(shader, "myparam", 5.2f);
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param x      Value to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setFloatParameter(shader: PsfShader; const name: PUTF8Char; x: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloatParameter';

////////////////////////////////////////////////////////////
/// \brief Change a 2-components vector parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 2x1 vector
/// (vec2 GLSL type).
///
/// Example:
/// \code
/// uniform vec2 myparam; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setFloat2Parameter(shader, "myparam", 5.2f, 6.0f);
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param x      First component of the value to assign
/// \param y      Second component of the value to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setFloat2Parameter(shader: PsfShader; const name: PUTF8Char; x: Single; y: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloat2Parameter';

////////////////////////////////////////////////////////////
/// \brief Change a 3-components vector parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 3x1 vector
/// (vec3 GLSL type).
///
/// Example:
/// \code
/// uniform vec3 myparam; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setFloat3Parameter(shader, "myparam", 5.2f, 6.0f, -8.1f);
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param x      First component of the value to assign
/// \param y      Second component of the value to assign
/// \param z      Third component of the value to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setFloat3Parameter(shader: PsfShader; const name: PUTF8Char; x: Single; y: Single; z: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloat3Parameter';

////////////////////////////////////////////////////////////
/// \brief Change a 4-components vector parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 4x1 vector
/// (vec4 GLSL type).
///
/// Example:
/// \code
/// uniform vec4 myparam; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setFloat4Parameter(shader, "myparam", 5.2f, 6.0f, -8.1f, 0.4f);
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param x      First component of the value to assign
/// \param y      Second component of the value to assign
/// \param z      Third component of the value to assign
/// \param w      Fourth component of the value to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setFloat4Parameter(shader: PsfShader; const name: PUTF8Char; x: Single; y: Single; z: Single; w: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloat4Parameter';

////////////////////////////////////////////////////////////
/// \brief Change a 2-components vector parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 2x1 vector
/// (vec2 GLSL type).
///
/// Example:
/// \code
/// uniform vec2 myparam; // this is the variable in the shader
/// \endcode
/// \code
/// sfVector2f vec = {5.2f, 6.0f};
/// sfShader_setVector2Parameter(shader, "myparam", vec);
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param vector Vector to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setVector2Parameter(shader: PsfShader; const name: PUTF8Char; vector: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVector2Parameter';

////////////////////////////////////////////////////////////
/// \brief Change a 3-components vector parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 3x1 vector
/// (vec3 GLSL type).
///
/// Example:
/// \code
/// uniform vec3 myparam; // this is the variable in the shader
/// \endcode
/// \code
/// sfVector3f vec = {5.2f, 6.0f, -8.1f};
/// sfShader_setVector3Parameter(shader, "myparam", vec);
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param vector Vector to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setVector3Parameter(shader: PsfShader; const name: PUTF8Char; vector: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVector3Parameter';

////////////////////////////////////////////////////////////
/// \brief Change a color parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 4x1 vector
/// (vec4 GLSL type).
///
/// It is important to note that the components of the color are
/// normalized before being passed to the shader. Therefore,
/// they are converted from range [0 .. 255] to range [0 .. 1].
/// For example, a sf::Color(255, 125, 0, 255) will be transformed
/// to a vec4(1.0, 0.5, 0.0, 1.0) in the shader.
///
/// Example:
/// \code
/// uniform vec4 color; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setColorParameter(shader, "color", sfColor_fromRGB(255, 128, 0));
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the parameter in the shader
/// \param color  Color to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setColorParameter(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setColorParameter';

////////////////////////////////////////////////////////////
/// \brief Change a matrix parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 4x4 matrix
/// (mat4 GLSL type).
///
/// Example:
/// \code
/// uniform mat4 matrix; // this is the variable in the shader
/// \endcode
/// \code
/// @todo
/// sfShader_setTransformParameter(shader, "matrix", transform);
/// \endcode
///
/// \param shader    Shader object
/// \param name      Name of the parameter in the shader
/// \param transform Transform to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setTransformParameter(shader: PsfShader; const name: PUTF8Char; transform: sfTransform); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setTransformParameter';

////////////////////////////////////////////////////////////
/// \brief Change a texture parameter of a shader
///
/// \a name is the name of the variable to change in the shader.
/// The corresponding parameter in the shader must be a 2D texture
/// (sampler2D GLSL type).
///
/// Example:
/// \code
/// uniform sampler2D the_texture; // this is the variable in the shader
/// \endcode
/// \code
/// sf::Texture texture;
/// ...
/// sfShader_setTextureParameter(shader, "the_texture", texture);
/// \endcode
/// It is important to note that \a texture must remain alive as long
/// as the shader uses it, no copy is made internally.
///
/// To use the texture of the object being draw, which cannot be
/// known in advance, you can use the special function
/// sfShader_setCurrentTextureParameter:
/// \code
/// sfShader_setCurrentTextureParameter(shader, "the_texture").
/// \endcode
///
/// \param shader  Shader object
/// \param name    Name of the texture in the shader
/// \param texture Texture to assign
///
////////////////////////////////////////////////////////////
procedure sfShader_setTextureParameter(shader: PsfShader; const name: PUTF8Char; const texture: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setTextureParameter';

////////////////////////////////////////////////////////////
/// \brief Change a texture parameter of a shader
///
/// This function maps a shader texture variable to the
/// texture of the object being drawn, which cannot be
/// known in advance.
/// The corresponding parameter in the shader must be a 2D texture
/// (sampler2D GLSL type).
///
/// Example:
/// \code
/// uniform sampler2D current; // this is the variable in the shader
/// \endcode
/// \code
/// sfShader_setCurrentTextureParameter(shader, "current");
/// \endcode
///
/// \param shader Shader object
/// \param name   Name of the texture in the shader
///
////////////////////////////////////////////////////////////
procedure sfShader_setCurrentTextureParameter(shader: PsfShader; const name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setCurrentTextureParameter';

////////////////////////////////////////////////////////////
/// \brief Get the underlying OpenGL handle of the shader.
///
/// You shouldn't need to use this function, unless you have
/// very specific stuff to implement that SFML doesn't support,
/// or implement a temporary workaround until a bug is fixed.
///
/// \param shader Shader object
///
/// \return OpenGL handle of the shader or 0 if not yet loaded
///
////////////////////////////////////////////////////////////
function sfShader_getNativeHandle(const shader: PsfShader): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfShader_getNativeHandle';

////////////////////////////////////////////////////////////
/// \brief Bind a shader for rendering (activate it)
///
/// This function is not part of the graphics API, it mustn't be
/// used when drawing SFML entities. It must be used only if you
/// mix sfShader with OpenGL code.
///
/// \code
/// sfShader *s1, *s2;
/// ...
/// sfShader_bind(s1);
/// // draw OpenGL stuff that use s1...
/// sfShader_bind(s2);
/// // draw OpenGL stuff that use s2...
/// sfShader_bind(0);
/// // draw OpenGL stuff that use no shader...
/// \endcode
///
/// \param shader Shader to bind, can be null to use no shader
///
////////////////////////////////////////////////////////////
procedure sfShader_bind(const shader: PsfShader); cdecl;
  external PSFML_DLL name _PU + 'sfShader_bind';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not the system supports shaders
///
/// This function should always be called before using
/// the shader features. If it returns false, then
/// any attempt to use sfShader will fail.
///
/// \return sfTrue if the system can use shaders, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfShader_isAvailable(): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfShader_isAvailable';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not the system supports geometry shaders
///
/// This function should always be called before using
/// the geometry shader features. If it returns false, then
/// any attempt to use sfShader geometry shader features will fail.
///
/// This function can only return true if isAvailable() would also
/// return true, since shaders in general have to be supported in
/// order for geometry shaders to be supported as well.
///
/// Note: The first call to this function, whether by your
/// code or SFML will result in a context switch.
///
/// \return True if geometry shaders are supported, false otherwise
///
////////////////////////////////////////////////////////////
function sfShader_isGeometryAvailable(): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfShader_isGeometryAvailable';

////////////////////////////////////////////////////////////
/// \brief Create a new shape
///
/// \param getPointCount Callback that provides the point count of the shape
/// \param getPoint      Callback that provides the points of the shape
/// \param userData      Data to pass to the callback functions
///
/// \return A new sfShape object
///
////////////////////////////////////////////////////////////
function sfShape_create(getPointCount: sfShapeGetPointCountCallback; getPoint: sfShapeGetPointCallback; userData: Pointer): PsfShape; cdecl;
  external PSFML_DLL name _PU + 'sfShape_create';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing shape
///
/// \param shape Shape to delete
///
////////////////////////////////////////////////////////////
procedure sfShape_destroy(shape: PsfShape); cdecl;
  external PSFML_DLL name _PU + 'sfShape_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a shape
///
/// This function completely overwrites the previous position.
/// See sfShape_move to apply an offset based on the previous position instead.
/// The default position of a circle Shape object is (0, 0).
///
/// \param shape    Shape object
/// \param position New position
///
////////////////////////////////////////////////////////////
procedure sfShape_setPosition(shape: PsfShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a shape
///
/// This function completely overwrites the previous rotation.
/// See sfShape_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a circle Shape object is 0.
///
/// \param shape Shape object
/// \param angle New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfShape_setRotation(shape: PsfShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a shape
///
/// This function completely overwrites the previous scale.
/// See sfShape_scale to add a factor based on the previous scale instead.
/// The default scale of a circle Shape object is (1, 1).
///
/// \param shape Shape object
/// \param scale New scale factors
///
////////////////////////////////////////////////////////////
procedure sfShape_setScale(shape: PsfShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a shape
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a circle Shape object is (0, 0).
///
/// \param shape  Shape object
/// \param origin New origin
///
////////////////////////////////////////////////////////////
procedure sfShape_setOrigin(shape: PsfShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a shape
///
/// \param shape Shape object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfShape_getPosition(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a shape
///
/// The rotation is always in the range [0, 360].
///
/// \param shape Shape object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfShape_getRotation(const shape: PsfShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a shape
///
/// \param shape Shape object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfShape_getScale(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a shape
///
/// \param shape Shape object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfShape_getOrigin(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a shape by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfShape_setPosition which overwrites it.
///
/// \param shape  Shape object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfShape_move(shape: PsfShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a shape
///
/// This function adds to the current rotation of the object,
/// unlike sfShape_setRotation which overwrites it.
///
/// \param shape Shape object
/// \param angle Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfShape_rotate(shape: PsfShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShape_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a shape
///
/// This function multiplies the current scale of the object,
/// unlike sfShape_setScale which overwrites it.
///
/// \param shape   Shape object
/// \param factors Scale factors
///
////////////////////////////////////////////////////////////
procedure sfShape_scale(shape: PsfShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a shape
///
/// \param shape shape object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfShape_getTransform(const shape: PsfShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a shape
///
/// \param shape shape object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfShape_getInverseTransform(const shape: PsfShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Change the source texture of a shape
///
/// The \a texture argument refers to a texture that must
/// exist as long as the shape uses it. Indeed, the shape
/// doesn't store its own copy of the texture, but rather keeps
/// a pointer to the one that you passed to this function.
/// If the source texture is destroyed and the shape tries to
/// use it, the behaviour is undefined.
/// \a texture can be NULL to disable texturing.
/// If \a resetRect is true, the TextureRect property of
/// the shape is automatically adjusted to the size of the new
/// texture. If it is false, the texture rect is left unchanged.
///
/// \param shape     Shape object
/// \param texture   New texture
/// \param resetRect Should the texture rect be reset to the size of the new texture?
///
////////////////////////////////////////////////////////////
procedure sfShape_setTexture(shape: PsfShape; const texture: PsfTexture; resetRect: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setTexture';

////////////////////////////////////////////////////////////
/// \brief Set the sub-rectangle of the texture that a shape will display
///
/// The texture rect is useful when you don't want to display
/// the whole texture, but rather a part of it.
/// By default, the texture rect covers the entire texture.
///
/// \param shape Shape object
/// \param rect  Rectangle defining the region of the texture to display
///
////////////////////////////////////////////////////////////
procedure sfShape_setTextureRect(shape: PsfShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setTextureRect';

////////////////////////////////////////////////////////////
/// \brief Set the fill color of a shape
///
/// This color is modulated (multiplied) with the shape's
/// texture if any. It can be used to colorize the shape,
/// or change its global opacity.
/// You can use sfTransparent to make the inside of
/// the shape transparent, and have the outline alone.
/// By default, the shape's fill color is opaque white.
///
/// \param shape Shape object
/// \param color New color of the shape
///
////////////////////////////////////////////////////////////
procedure sfShape_setFillColor(shape: PsfShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setFillColor';

////////////////////////////////////////////////////////////
/// \brief Set the outline color of a shape
///
/// You can use sfTransparent to disable the outline.
/// By default, the shape's outline color is opaque white.
///
/// \param shape Shape object
/// \param color New outline color of the shape
///
////////////////////////////////////////////////////////////
procedure sfShape_setOutlineColor(shape: PsfShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Set the thickness of a shape's outline
///
/// This number cannot be negative. Using zero disables
/// the outline.
/// By default, the outline thickness is 0.
///
/// \param shape     Shape object
/// \param thickness New outline thickness
///
////////////////////////////////////////////////////////////
procedure sfShape_setOutlineThickness(shape: PsfShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the source texture of a shape
///
/// If the shape has no source texture, a NULL pointer is returned.
/// The returned pointer is const, which means that you can't
/// modify the texture when you retrieve it with this function.
///
/// \param shape Shape object
///
/// \return Pointer to the shape's texture
///
////////////////////////////////////////////////////////////
function sfShape_getTexture(const shape: PsfShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getTexture';

////////////////////////////////////////////////////////////
/// \brief Get the sub-rectangle of the texture displayed by a shape
///
/// \param shape Shape object
///
/// \return Texture rectangle of the shape
///
////////////////////////////////////////////////////////////
function sfShape_getTextureRect(const shape: PsfShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getTextureRect';

////////////////////////////////////////////////////////////
/// \brief Get the fill color of a shape
///
/// \param shape Shape object
///
/// \return Fill color of the shape
///
////////////////////////////////////////////////////////////
function sfShape_getFillColor(const shape: PsfShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getFillColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline color of a shape
///
/// \param shape Shape object
///
/// \return Outline color of the shape
///
////////////////////////////////////////////////////////////
function sfShape_getOutlineColor(const shape: PsfShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline thickness of a shape
///
/// \param shape Shape object
///
/// \return Outline thickness of the shape
///
////////////////////////////////////////////////////////////
function sfShape_getOutlineThickness(const shape: PsfShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the total number of points of a shape
///
/// \param shape Shape object
///
/// \return Number of points of the shape
///
////////////////////////////////////////////////////////////
function sfShape_getPointCount(const shape: PsfShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getPointCount';

////////////////////////////////////////////////////////////
/// \brief Get a point of a shape
///
/// The result is undefined if \a index is out of the valid range.
///
/// \param shape Shape object
/// \param index Index of the point to get, in range [0 .. getPointCount() - 1]
///
/// \return Index-th point of the shape
///
////////////////////////////////////////////////////////////
function sfShape_getPoint(const shape: PsfShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getPoint';

////////////////////////////////////////////////////////////
/// \brief Get the local bounding rectangle of a shape
///
/// The returned rectangle is in local coordinates, which means
/// that it ignores the transformations (translation, rotation,
/// scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// entity in the entity's coordinate system.
///
/// \param shape Shape object
///
/// \return Local bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfShape_getLocalBounds(const shape: PsfShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getLocalBounds';

////////////////////////////////////////////////////////////
/// \brief Get the global bounding rectangle of a shape
///
/// The returned rectangle is in global coordinates, which means
/// that it takes in account the transformations (translation,
/// rotation, scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// sprite in the global 2D world's coordinate system.
///
/// \param shape Shape object
///
/// \return Global bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfShape_getGlobalBounds(const shape: PsfShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getGlobalBounds';

////////////////////////////////////////////////////////////
/// \brief Recompute the internal geometry of a shape
///
/// This function must be called by specialized shape objects
/// everytime their points change (ie. the result of either
/// the getPointCount or getPoint callbacks is different).
///
////////////////////////////////////////////////////////////
procedure sfShape_update(shape: PsfShape); cdecl;
  external PSFML_DLL name _PU + 'sfShape_update';

////////////////////////////////////////////////////////////
/// \brief Create a new sprite
///
/// \return A new sfSprite object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfSprite_create(): PsfSprite; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing sprite
///
/// \param sprite Sprite to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfSprite_copy(const sprite: PsfSprite): PsfSprite; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing sprite
///
/// \param sprite Sprite to delete
///
////////////////////////////////////////////////////////////
procedure sfSprite_destroy(sprite: PsfSprite); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a sprite
///
/// This function completely overwrites the previous position.
/// See sfSprite_move to apply an offset based on the previous position instead.
/// The default position of a sprite Sprite object is (0, 0).
///
/// \param sprite   Sprite object
/// \param position New position
///
////////////////////////////////////////////////////////////
procedure sfSprite_setPosition(sprite: PsfSprite; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a sprite
///
/// This function completely overwrites the previous rotation.
/// See sfSprite_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a sprite Sprite object is 0.
///
/// \param sprite Sprite object
/// \param angle  New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfSprite_setRotation(sprite: PsfSprite; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a sprite
///
/// This function completely overwrites the previous scale.
/// See sfSprite_scale to add a factor based on the previous scale instead.
/// The default scale of a sprite Sprite object is (1, 1).
///
/// \param sprite Sprite object
/// \param scale  New scale factors
///
////////////////////////////////////////////////////////////
procedure sfSprite_setScale(sprite: PsfSprite; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a sprite
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a sprite Sprite object is (0, 0).
///
/// \param sprite Sprite object
/// \param origin New origin
///
////////////////////////////////////////////////////////////
procedure sfSprite_setOrigin(sprite: PsfSprite; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a sprite
///
/// \param sprite Sprite object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfSprite_getPosition(const sprite: PsfSprite): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a sprite
///
/// The rotation is always in the range [0, 360].
///
/// \param sprite Sprite object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfSprite_getRotation(const sprite: PsfSprite): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a sprite
///
/// \param sprite Sprite object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfSprite_getScale(const sprite: PsfSprite): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a sprite
///
/// \param sprite Sprite object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfSprite_getOrigin(const sprite: PsfSprite): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a sprite by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfSprite_setPosition which overwrites it.
///
/// \param sprite Sprite object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfSprite_move(sprite: PsfSprite; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a sprite
///
/// This function adds to the current rotation of the object,
/// unlike sfSprite_setRotation which overwrites it.
///
/// \param sprite Sprite object
/// \param angle  Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfSprite_rotate(sprite: PsfSprite; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a sprite
///
/// This function multiplies the current scale of the object,
/// unlike sfSprite_setScale which overwrites it.
///
/// \param sprite  Sprite object
/// \param factors Scale factors
///
////////////////////////////////////////////////////////////
procedure sfSprite_scale(sprite: PsfSprite; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a sprite
///
/// \param sprite Sprite object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfSprite_getTransform(const sprite: PsfSprite): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a sprite
///
/// \param sprite Sprite object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfSprite_getInverseTransform(const sprite: PsfSprite): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Change the source texture of a sprite
///
/// The \a texture argument refers to a texture that must
/// exist as long as the sprite uses it. Indeed, the sprite
/// doesn't store its own copy of the texture, but rather keeps
/// a pointer to the one that you passed to this function.
/// If the source texture is destroyed and the sprite tries to
/// use it, the behaviour is undefined.
/// If \a resetRect is true, the TextureRect property of
/// the sprite is automatically adjusted to the size of the new
/// texture. If it is false, the texture rect is left unchanged.
///
/// \param sprite    Sprite object
/// \param texture   New texture
/// \param resetRect Should the texture rect be reset to the size of the new texture?
///
////////////////////////////////////////////////////////////
procedure sfSprite_setTexture(sprite: PsfSprite; const texture: PsfTexture; resetRect: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setTexture';

////////////////////////////////////////////////////////////
/// \brief Set the sub-rectangle of the texture that a sprite will display
///
/// The texture rect is useful when you don't want to display
/// the whole texture, but rather a part of it.
/// By default, the texture rect covers the entire texture.
///
/// \param sprite    Sprite object
/// \param rectangle Rectangle defining the region of the texture to display
///
////////////////////////////////////////////////////////////
procedure sfSprite_setTextureRect(sprite: PsfSprite; rectangle: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setTextureRect';

////////////////////////////////////////////////////////////
/// \brief Set the global color of a sprite
///
/// This color is modulated (multiplied) with the sprite's
/// texture. It can be used to colorize the sprite, or change
/// its global opacity.
/// By default, the sprite's color is opaque white.
///
/// \param sprite Sprite object
/// \param color  New color of the sprite
///
////////////////////////////////////////////////////////////
procedure sfSprite_setColor(sprite: PsfSprite; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setColor';

////////////////////////////////////////////////////////////
/// \brief Get the source texture of a sprite
///
/// If the sprite has no source texture, a NULL pointer is returned.
/// The returned pointer is const, which means that you can't
/// modify the texture when you retrieve it with this function.
///
/// \param sprite Sprite object
///
/// \return Pointer to the sprite's texture
///
////////////////////////////////////////////////////////////
function sfSprite_getTexture(const sprite: PsfSprite): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getTexture';

////////////////////////////////////////////////////////////
/// \brief Get the sub-rectangle of the texture displayed by a sprite
///
/// \param sprite Sprite object
///
/// \return Texture rectangle of the sprite
///
////////////////////////////////////////////////////////////
function sfSprite_getTextureRect(const sprite: PsfSprite): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getTextureRect';

////////////////////////////////////////////////////////////
/// \brief Get the global color of a sprite
///
/// \param sprite Sprite object
///
/// \return Global color of the sprite
///
////////////////////////////////////////////////////////////
function sfSprite_getColor(const sprite: PsfSprite): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getColor';

////////////////////////////////////////////////////////////
/// \brief Get the local bounding rectangle of a sprite
///
/// The returned rectangle is in local coordinates, which means
/// that it ignores the transformations (translation, rotation,
/// scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// entity in the entity's coordinate system.
///
/// \param sprite Sprite object
///
/// \return Local bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfSprite_getLocalBounds(const sprite: PsfSprite): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getLocalBounds';

////////////////////////////////////////////////////////////
/// \brief Get the global bounding rectangle of a sprite
///
/// The returned rectangle is in global coordinates, which means
/// that it takes in account the transformations (translation,
/// rotation, scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// sprite in the global 2D world's coordinate system.
///
/// \param sprite Sprite object
///
/// \return Global bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfSprite_getGlobalBounds(const sprite: PsfSprite): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getGlobalBounds';

////////////////////////////////////////////////////////////
/// \brief Create a new text
///
/// \return A new sfText object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfText_create(): PsfText; cdecl;
  external PSFML_DLL name _PU + 'sfText_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing text
///
/// \param text Text to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfText_copy(const text: PsfText): PsfText; cdecl;
  external PSFML_DLL name _PU + 'sfText_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing text
///
/// \param text Text to delete
///
////////////////////////////////////////////////////////////
procedure sfText_destroy(text: PsfText); cdecl;
  external PSFML_DLL name _PU + 'sfText_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a text
///
/// This function completely overwrites the previous position.
/// See sfText_move to apply an offset based on the previous position instead.
/// The default position of a text Text object is (0, 0).
///
/// \param text     Text object
/// \param position New position
///
////////////////////////////////////////////////////////////
procedure sfText_setPosition(text: PsfText; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a text
///
/// This function completely overwrites the previous rotation.
/// See sfText_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a text Text object is 0.
///
/// \param text  Text object
/// \param angle New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfText_setRotation(text: PsfText; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a text
///
/// This function completely overwrites the previous scale.
/// See sfText_scale to add a factor based on the previous scale instead.
/// The default scale of a text Text object is (1, 1).
///
/// \param text  Text object
/// \param scale New scale factors
///
////////////////////////////////////////////////////////////
procedure sfText_setScale(text: PsfText; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a text
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a text object is (0, 0).
///
/// \param text   Text object
/// \param origin New origin
///
////////////////////////////////////////////////////////////
procedure sfText_setOrigin(text: PsfText; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a text
///
/// \param text Text object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfText_getPosition(const text: PsfText): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a text
///
/// The rotation is always in the range [0, 360].
///
/// \param text Text object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfText_getRotation(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a text
///
/// \param text Text object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfText_getScale(const text: PsfText): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a text
///
/// \param text Text object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfText_getOrigin(const text: PsfText): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a text by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfText_setPosition which overwrites it.
///
/// \param text   Text object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfText_move(text: PsfText; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a text
///
/// This function adds to the current rotation of the object,
/// unlike sfText_setRotation which overwrites it.
///
/// \param text  Text object
/// \param angle Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfText_rotate(text: PsfText; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a text
///
/// This function multiplies the current scale of the object,
/// unlike sfText_setScale which overwrites it.
///
/// \param text    Text object
/// \param factors Scale factors
///
////////////////////////////////////////////////////////////
procedure sfText_scale(text: PsfText; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a text
///
/// \param text Text object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfText_getTransform(const text: PsfText): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfText_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a text
///
/// \param text Text object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfText_getInverseTransform(const text: PsfText): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfText_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Set the string of a text (from an ANSI string)
///
/// A text's string is empty by default.
///
/// \param text   Text object
/// \param string New string
///
////////////////////////////////////////////////////////////
procedure sfText_setString(text: PsfText; const &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfText_setString';

////////////////////////////////////////////////////////////
/// \brief Set the string of a text (from a unicode string)
///
/// \param text   Text object
/// \param string New string
///
////////////////////////////////////////////////////////////
procedure sfText_setUnicodeString(text: PsfText; const &string: PsfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfText_setUnicodeString';

////////////////////////////////////////////////////////////
/// \brief Set the font of a text
///
/// The \a font argument refers to a texture that must
/// exist as long as the text uses it. Indeed, the text
/// doesn't store its own copy of the font, but rather keeps
/// a pointer to the one that you passed to this function.
/// If the font is destroyed and the text tries to
/// use it, the behaviour is undefined.
///
/// \param text Text object
/// \param font New font
///
////////////////////////////////////////////////////////////
procedure sfText_setFont(text: PsfText; const font: PsfFont); cdecl;
  external PSFML_DLL name _PU + 'sfText_setFont';

////////////////////////////////////////////////////////////
/// \brief Set the character size of a text
///
/// The default size is 30.
///
/// \param text Text object
/// \param size New character size, in pixels
///
////////////////////////////////////////////////////////////
procedure sfText_setCharacterSize(text: PsfText; size: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfText_setCharacterSize';

////////////////////////////////////////////////////////////
/// \brief Set the line spacing factor
///
/// The default spacing between lines is defined by the font.
/// This method enables you to set a factor for the spacing
/// between lines. By default the line spacing factor is 1.
///
/// \param text Text object
/// \param spacingFactor New line spacing factor
///
/// \see sfText_getLineSpacing
///
////////////////////////////////////////////////////////////
procedure sfText_setLineSpacing(text: PsfText; spacingFactor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setLineSpacing';

////////////////////////////////////////////////////////////
/// \brief Set the letter spacing factor
///
/// The default spacing between letters is defined by the font.
/// This factor doesn't directly apply to the existing
/// spacing between each character, it rather adds a fixed
/// space between them which is calculated from the font
/// metrics and the character size.
/// Note that factors below 1 (including negative numbers) bring
/// characters closer to each other.
/// By default the letter spacing factor is 1.
///
/// \param text Text object
/// \param spacingFactor New letter spacing factor
///
/// \see sfText_getLetterSpacing
///
////////////////////////////////////////////////////////////
procedure sfText_setLetterSpacing(text: PsfText; spacingFactor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setLetterSpacing';

////////////////////////////////////////////////////////////
/// \brief Set the style of a text
///
/// You can pass a combination of one or more styles, for
/// example sfTextBold | sfTextItalic.
/// The default style is sfTextRegular.
///
/// \param text  Text object
/// \param style New style
///
////////////////////////////////////////////////////////////
procedure sfText_setStyle(text: PsfText; style: sfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfText_setStyle';

////////////////////////////////////////////////////////////
/// \brief Set the fill color of a text
///
/// By default, the text's fill color is opaque white.
/// Setting the fill color to a transparent color with an outline
/// will cause the outline to be displayed in the fill area of the text.
///
/// \param text  Text object
/// \param color New fill color of the text
///
/// \deprecated This function is deprecated and may be removed in future releases.
/// Use sfText_setFillColor instead.
///
////////////////////////////////////////////////////////////
procedure sfText_setColor(text: PsfText; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfText_setColor';

////////////////////////////////////////////////////////////
/// \brief Set the fill color of a text
///
/// By default, the text's fill color is opaque white.
/// Setting the fill color to a transparent color with an outline
/// will cause the outline to be displayed in the fill area of the text.
///
/// \param text  Text object
/// \param color New fill color of the text
///
////////////////////////////////////////////////////////////
procedure sfText_setFillColor(text: PsfText; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfText_setFillColor';

////////////////////////////////////////////////////////////
/// \brief Set the outline color of the text
///
/// By default, the text's outline color is opaque black.
///
/// \param text  Text object
/// \param color New outline color of the text
///
////////////////////////////////////////////////////////////
procedure sfText_setOutlineColor(text: PsfText; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfText_setOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Set the thickness of the text's outline
///
/// By default, the outline thickness is 0.
///
/// Be aware that using a negative value for the outline
/// thickness will cause distorted rendering.
///
/// \param thickness New outline thickness, in pixels
///
/// \see getOutlineThickness
///
////////////////////////////////////////////////////////////
procedure sfText_setOutlineThickness(text: PsfText; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Get the string of a text (returns an ANSI string)
///
/// \param text Text object
///
/// \return String as a locale-dependant ANSI string
///
////////////////////////////////////////////////////////////
function sfText_getString(const text: PsfText): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfText_getString';

////////////////////////////////////////////////////////////
/// \brief Get the string of a text (returns a unicode string)
///
/// \param text Text object
///
/// \return String as UTF-32
///
////////////////////////////////////////////////////////////
function sfText_getUnicodeString(const text: PsfText): PsfUint32; cdecl;
  external PSFML_DLL name _PU + 'sfText_getUnicodeString';

////////////////////////////////////////////////////////////
/// \brief Get the font used by a text
///
/// If the text has no font attached, a NULL pointer is returned.
/// The returned pointer is const, which means that you can't
/// modify the font when you retrieve it with this function.
///
/// \param text Text object
///
/// \return Pointer to the font
///
////////////////////////////////////////////////////////////
function sfText_getFont(const text: PsfText): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfText_getFont';

////////////////////////////////////////////////////////////
/// \brief Get the size of the characters of a text
///
/// \param text Text object
///
/// \return Size of the characters
///
////////////////////////////////////////////////////////////
function sfText_getCharacterSize(const text: PsfText): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfText_getCharacterSize';

////////////////////////////////////////////////////////////
/// \brief Get the size of the letter spacing factor
///
/// \param text Text object
///
/// \return Size of the letter spacing factor
///
/// \see sfText_setLetterSpacing
///
////////////////////////////////////////////////////////////
function sfText_getLetterSpacing(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getLetterSpacing';

////////////////////////////////////////////////////////////
/// \brief Get the size of the line spacing factor
///
/// \param text Text object
///
/// \return Size of the line spacing factor
///
/// \see sfText_setLineSpacing
///
////////////////////////////////////////////////////////////
function sfText_getLineSpacing(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getLineSpacing';

////////////////////////////////////////////////////////////
/// \brief Get the style of a text
///
/// \param text Text object
///
/// \return Current string style (see sfTextStyle enum)
///
////////////////////////////////////////////////////////////
function sfText_getStyle(const text: PsfText): sfUint32; cdecl;
  external PSFML_DLL name _PU + 'sfText_getStyle';

////////////////////////////////////////////////////////////
/// \brief Get the fill color of a text
///
/// \param text Text object
///
/// \return Fill color of the text
///
/// \deprecated This function is deprecated and may be removed in future releases.
/// Use sfText_getFillColor instead.
///
////////////////////////////////////////////////////////////
function sfText_getColor(const text: PsfText): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfText_getColor';

////////////////////////////////////////////////////////////
/// \brief Get the fill color of a text
///
/// \param text Text object
///
/// \return Fill color of the text
///
////////////////////////////////////////////////////////////
function sfText_getFillColor(const text: PsfText): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfText_getFillColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline color of a text
///
/// \param text Text object
///
/// \return Outline color of the text
///
////////////////////////////////////////////////////////////
function sfText_getOutlineColor(const text: PsfText): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfText_getOutlineColor';

////////////////////////////////////////////////////////////
/// \brief Get the outline thickness of a text
///
/// \param text Text object
///
/// \return Outline thickness of a text, in pixels
///
////////////////////////////////////////////////////////////
function sfText_getOutlineThickness(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getOutlineThickness';

////////////////////////////////////////////////////////////
/// \brief Return the position of the \a index-th character in a text
///
/// This function computes the visual position of a character
/// from its index in the string. The returned position is
/// in global coordinates (translation, rotation, scale and
/// origin are applied).
/// If \a index is out of range, the position of the end of
/// the string is returned.
///
/// \param text  Text object
/// \param index Index of the character
///
/// \return Position of the character
///
////////////////////////////////////////////////////////////
function sfText_findCharacterPos(const text: PsfText; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_findCharacterPos';

////////////////////////////////////////////////////////////
/// \brief Get the local bounding rectangle of a text
///
/// The returned rectangle is in local coordinates, which means
/// that it ignores the transformations (translation, rotation,
/// scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// entity in the entity's coordinate system.
///
/// \param text Text object
///
/// \return Local bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfText_getLocalBounds(const text: PsfText): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfText_getLocalBounds';

////////////////////////////////////////////////////////////
/// \brief Get the global bounding rectangle of a text
///
/// The returned rectangle is in global coordinates, which means
/// that it takes in account the transformations (translation,
/// rotation, scale, ...) that are applied to the entity.
/// In other words, this function returns the bounds of the
/// text in the global 2D world's coordinate system.
///
/// \param text Text object
///
/// \return Global bounding rectangle of the entity
///
////////////////////////////////////////////////////////////
function sfText_getGlobalBounds(const text: PsfText): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfText_getGlobalBounds';

////////////////////////////////////////////////////////////
/// \brief Create a new texture
///
/// \param width  Texture width
/// \param height Texture height
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_create(width: Cardinal; height: Cardinal): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_create';

////////////////////////////////////////////////////////////
/// \brief Create a new texture from a file
///
/// \param filename Path of the image file to load
/// \param area     Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createFromFile(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromFile';

////////////////////////////////////////////////////////////
/// \brief Create a new sRGB-enabled texture from a file
///
/// When providing texture data from an image file or memory, it can
/// either be stored in a linear color space or an sRGB color space.
/// Most digital images account for gamma correction already, so they
/// would need to be "uncorrected" back to linear color space before
/// being processed by the hardware. The hardware can automatically
/// convert it from the sRGB color space to a linear color space when
/// it gets sampled. When the rendered image gets output to the final
/// framebuffer, it gets converted back to sRGB.
///
/// This load option is only useful in conjunction with an sRGB capable
/// framebuffer. This can be requested during window creation.
///
/// \param filename Path of the image file to load
/// \param area     Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createSrgbFromFile(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromFile';

////////////////////////////////////////////////////////////
/// \brief Create a new texture from a file in memory
///
/// \param data        Pointer to the file data in memory
/// \param sizeInBytes Size of the data to load, in bytes
/// \param area        Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromMemory';

////////////////////////////////////////////////////////////
/// \brief Create a new sRGB-enabled texture from a file in memory
///
/// \param data        Pointer to the file data in memory
/// \param sizeInBytes Size of the data to load, in bytes
/// \param area        Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createSrgbFromMemory(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromMemory';

////////////////////////////////////////////////////////////
/// \brief Create a new texture from a custom stream
///
/// \param stream Source stream to read from
/// \param area   Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromStream';

////////////////////////////////////////////////////////////
/// \brief Create a new sRGB-enabled texture from a custom stream
///
/// \param stream Source stream to read from
/// \param area   Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createSrgbFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromStream';

////////////////////////////////////////////////////////////
/// \brief Create a new texture from an image
///
/// \param image Image to upload to the texture
/// \param area  Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createFromImage(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromImage';

////////////////////////////////////////////////////////////
/// \brief Create a new sRGB-enabled texture from an image
///
/// \param image Image to upload to the texture
/// \param area  Area of the source image to load (NULL to load the entire image)
///
/// \return A new sfTexture object, or NULL if it failed
///
////////////////////////////////////////////////////////////
function sfTexture_createSrgbFromImage(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromImage';

////////////////////////////////////////////////////////////
/// \brief Copy an existing texture
///
/// \param texture Texture to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfTexture_copy(const texture: PsfTexture): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing texture
///
/// \param texture Texture to delete
///
////////////////////////////////////////////////////////////
procedure sfTexture_destroy(texture: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_destroy';

////////////////////////////////////////////////////////////
/// \brief Return the size of the texture
///
/// \param texture Texture to read
///
/// \return Size in pixels
///
////////////////////////////////////////////////////////////
function sfTexture_getSize(const texture: PsfTexture): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_getSize';

////////////////////////////////////////////////////////////
/// \brief Copy a texture's pixels to an image
///
/// \param texture Texture to copy
///
/// \return Image containing the texture's pixels
///
////////////////////////////////////////////////////////////
function sfTexture_copyToImage(const texture: PsfTexture): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_copyToImage';

////////////////////////////////////////////////////////////
/// \brief Update a texture from an array of pixels
///
/// \param texture Texture to update
/// \param pixels  Array of pixels to copy to the texture
/// \param width   Width of the pixel region contained in \a pixels
/// \param height  Height of the pixel region contained in \a pixels
/// \param x       X offset in the texture where to copy the source pixels
/// \param y       Y offset in the texture where to copy the source pixels
///
////////////////////////////////////////////////////////////
procedure sfTexture_updateFromPixels(texture: PsfTexture; const pixels: PsfUint8; width: Cardinal; height: Cardinal; x: Cardinal; y: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromPixels';

////////////////////////////////////////////////////////////
/// \brief Update a part of this texture from another texture
///
/// No additional check is performed on the size of the texture,
/// passing an invalid combination of texture size and offset
/// will lead to an undefined behavior.
///
/// This function does nothing if either texture was not
/// previously created.
///
/// \param destination Destination texture to copy source texture to
/// \param source      Source texture to copy to destination texture
/// \param x           X offset in this texture where to copy the source texture
/// \param y           Y offset in this texture where to copy the source texture
///
////////////////////////////////////////////////////////////
procedure sfTexture_updateFromTexture(destination: PsfTexture; const source: PsfTexture; x: Cardinal; y: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromTexture';

////////////////////////////////////////////////////////////
/// \brief Update a texture from an image
///
/// \param texture Texture to update
/// \param image   Image to copy to the texture
/// \param x       X offset in the texture where to copy the source pixels
/// \param y       Y offset in the texture where to copy the source pixels
///
////////////////////////////////////////////////////////////
procedure sfTexture_updateFromImage(texture: PsfTexture; const image: PsfImage; x: Cardinal; y: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromImage';

////////////////////////////////////////////////////////////
/// \brief Update a texture from the contents of a window
///
/// \param texture Texture to update
/// \param window  Window to copy to the texture
/// \param x       X offset in the texture where to copy the source pixels
/// \param y       Y offset in the texture where to copy the source pixels
///
////////////////////////////////////////////////////////////
procedure sfTexture_updateFromWindow(texture: PsfTexture; const window: PsfWindow; x: Cardinal; y: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromWindow';

////////////////////////////////////////////////////////////
/// \brief Update a texture from the contents of a render-window
///
/// \param texture      Texture to update
/// \param renderWindow Render-window to copy to the texture
/// \param x            X offset in the texture where to copy the source pixels
/// \param y            Y offset in the texture where to copy the source pixels
///
////////////////////////////////////////////////////////////
procedure sfTexture_updateFromRenderWindow(texture: PsfTexture; const renderWindow: PsfRenderWindow; x: Cardinal; y: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromRenderWindow';

////////////////////////////////////////////////////////////
/// \brief Enable or disable the smooth filter on a texture
///
/// \param texture The texture object
/// \param smooth  sfTrue to enable smoothing, sfFalse to disable it
///
////////////////////////////////////////////////////////////
procedure sfTexture_setSmooth(texture: PsfTexture; smooth: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_setSmooth';

////////////////////////////////////////////////////////////
/// \brief Tell whether the smooth filter is enabled or not for a texture
///
/// \param texture The texture object
///
/// \return sfTrue if smoothing is enabled, sfFalse if it is disabled
///
////////////////////////////////////////////////////////////
function sfTexture_isSmooth(const texture: PsfTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_isSmooth';

////////////////////////////////////////////////////////////
/// \brief Tell whether the texture source is converted from sRGB or not
///
/// \return True if the texture source is converted from sRGB, false if not
///
/// \see sfTexture_createSrgbFromFile
/// \see sfTexture_createSrgbFromMemory
/// \see sfTexture_createSrgbFromStream
/// \see sfTexture_createSrgbFromImage
///
////////////////////////////////////////////////////////////
function sfTexture_isSrgb(const texture: PsfTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_isSrgb';

////////////////////////////////////////////////////////////
/// \brief Enable or disable repeating for a texture
///
/// Repeating is involved when using texture coordinates
/// outside the texture rectangle [0, 0, width, height].
/// In this case, if repeat mode is enabled, the whole texture
/// will be repeated as many times as needed to reach the
/// coordinate (for example, if the X texture coordinate is
/// 3 * width, the texture will be repeated 3 times).
/// If repeat mode is disabled, the "extra space" will instead
/// be filled with border pixels.
/// Warning: on very old graphics cards, white pixels may appear
/// when the texture is repeated. With such cards, repeat mode
/// can be used reliably only if the texture has power-of-two
/// dimensions (such as 256x128).
/// Repeating is disabled by default.
///
/// \param texture  The texture object
/// \param repeated True to repeat the texture, false to disable repeating
///
////////////////////////////////////////////////////////////
procedure sfTexture_setRepeated(texture: PsfTexture; repeated: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_setRepeated';

////////////////////////////////////////////////////////////
/// \brief Tell whether a texture is repeated or not
///
/// \param texture The texture object
///
/// \return sfTrue if repeat mode is enabled, sfFalse if it is disabled
///
////////////////////////////////////////////////////////////
function sfTexture_isRepeated(const texture: PsfTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_isRepeated';

////////////////////////////////////////////////////////////
/// \brief Generate a mipmap using the current texture data
///
/// Mipmaps are pre-computed chains of optimized textures. Each
/// level of texture in a mipmap is generated by halving each of
/// the previous level's dimensions. This is done until the final
/// level has the size of 1x1. The textures generated in this process may
/// make use of more advanced filters which might improve the visual quality
/// of textures when they are applied to objects much smaller than they are.
/// This is known as minification. Because fewer texels (texture elements)
/// have to be sampled from when heavily minified, usage of mipmaps
/// can also improve rendering performance in certain scenarios.
///
/// Mipmap generation relies on the necessary OpenGL extension being
/// available. If it is unavailable or generation fails due to another
/// reason, this function will return false. Mipmap data is only valid from
/// the time it is generated until the next time the base level image is
/// modified, at which point this function will have to be called again to
/// regenerate it.
///
/// \return sfTrue if mipmap generation was successful, sfFalse if unsuccessful
///
////////////////////////////////////////////////////////////
function sfTexture_generateMipmap(texture: PsfTexture): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_generateMipmap';

////////////////////////////////////////////////////////////
/// \brief Swap the contents of a texture with those of another
///
/// \param left  Instance to swap from
/// \param right Instance to swap with
///
////////////////////////////////////////////////////////////
procedure sfTexture_swap(left: PsfTexture; right: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_swap';

////////////////////////////////////////////////////////////
/// \brief Get the underlying OpenGL handle of the texture.
///
/// You shouldn't need to use this function, unless you have
/// very specific stuff to implement that SFML doesn't support,
/// or implement a temporary workaround until a bug is fixed.
///
/// \param texture The texture object
///
/// \return OpenGL handle of the texture or 0 if not yet created
///
////////////////////////////////////////////////////////////
function sfTexture_getNativeHandle(const texture: PsfTexture): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_getNativeHandle';

////////////////////////////////////////////////////////////
/// \brief Bind a texture for rendering
///
/// This function is not part of the graphics API, it mustn't be
/// used when drawing SFML entities. It must be used only if you
/// mix sfTexture with OpenGL code.
///
/// \code
/// sfTexture *t1, *t2;
/// ...
/// sfTexture_bind(t1);
/// // draw OpenGL stuff that use t1...
/// sfTexture_bind(t2);
/// // draw OpenGL stuff that use t2...
/// sfTexture_bind(NULL);
/// // draw OpenGL stuff that use no texture...
/// \endcode
///
/// \param texture Pointer to the texture to bind, can be null to use no texture
///
////////////////////////////////////////////////////////////
procedure sfTexture_bind(const texture: PsfTexture; &type: sfTextureCoordinateType); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_bind';

////////////////////////////////////////////////////////////
/// \brief Get the maximum texture size allowed
///
/// \return Maximum size allowed for textures, in pixels
///
////////////////////////////////////////////////////////////
function sfTexture_getMaximumSize(): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_getMaximumSize';

////////////////////////////////////////////////////////////
/// \brief Create a new transformable
///
/// \return A new sfTransformable object
///
////////////////////////////////////////////////////////////
function sfTransformable_create(): PsfTransformable; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing transformable
///
/// \param transformable Transformable to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfTransformable_copy(const transformable: PsfTransformable): PsfTransformable; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing transformable
///
/// \param transformable Transformable to delete
///
////////////////////////////////////////////////////////////
procedure sfTransformable_destroy(transformable: PsfTransformable); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the position of a transformable
///
/// This function completely overwrites the previous position.
/// See sfTransformable_move to apply an offset based on the previous position instead.
/// The default position of a transformable Transformable object is (0, 0).
///
/// \param transformable Transformable object
/// \param position      New position
///
////////////////////////////////////////////////////////////
procedure sfTransformable_setPosition(transformable: PsfTransformable; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setPosition';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a transformable
///
/// This function completely overwrites the previous rotation.
/// See sfTransformable_rotate to add an angle based on the previous rotation instead.
/// The default rotation of a transformable Transformable object is 0.
///
/// \param transformable Transformable object
/// \param angle         New rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfTransformable_setRotation(transformable: PsfTransformable; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the scale factors of a transformable
///
/// This function completely overwrites the previous scale.
/// See sfTransformable_scale to add a factor based on the previous scale instead.
/// The default scale of a transformable Transformable object is (1, 1).
///
/// \param transformable Transformable object
/// \param scale         New scale factors
///
////////////////////////////////////////////////////////////
procedure sfTransformable_setScale(transformable: PsfTransformable; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setScale';

////////////////////////////////////////////////////////////
/// \brief Set the local origin of a transformable
///
/// The origin of an object defines the center point for
/// all transformations (position, scale, rotation).
/// The coordinates of this point must be relative to the
/// top-left corner of the object, and ignore all
/// transformations (position, scale, rotation).
/// The default origin of a transformable Transformable object is (0, 0).
///
/// \param transformable Transformable object
/// \param origin        New origin
///
////////////////////////////////////////////////////////////
procedure sfTransformable_setOrigin(transformable: PsfTransformable; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setOrigin';

////////////////////////////////////////////////////////////
/// \brief Get the position of a transformable
///
/// \param transformable Transformable object
///
/// \return Current position
///
////////////////////////////////////////////////////////////
function sfTransformable_getPosition(const transformable: PsfTransformable): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getPosition';

////////////////////////////////////////////////////////////
/// \brief Get the orientation of a transformable
///
/// The rotation is always in the range [0, 360].
///
/// \param transformable Transformable object
///
/// \return Current rotation, in degrees
///
////////////////////////////////////////////////////////////
function sfTransformable_getRotation(const transformable: PsfTransformable): Single; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the current scale of a transformable
///
/// \param transformable Transformable object
///
/// \return Current scale factors
///
////////////////////////////////////////////////////////////
function sfTransformable_getScale(const transformable: PsfTransformable): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getScale';

////////////////////////////////////////////////////////////
/// \brief Get the local origin of a transformable
///
/// \param transformable Transformable object
///
/// \return Current origin
///
////////////////////////////////////////////////////////////
function sfTransformable_getOrigin(const transformable: PsfTransformable): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getOrigin';

////////////////////////////////////////////////////////////
/// \brief Move a transformable by a given offset
///
/// This function adds to the current position of the object,
/// unlike sfTransformable_setPosition which overwrites it.
///
/// \param transformable Transformable object
/// \param offset        Offset
///
////////////////////////////////////////////////////////////
procedure sfTransformable_move(transformable: PsfTransformable; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a transformable
///
/// This function adds to the current rotation of the object,
/// unlike sfTransformable_setRotation which overwrites it.
///
/// \param transformable Transformable object
/// \param angle         Angle of rotation, in degrees
///
////////////////////////////////////////////////////////////
procedure sfTransformable_rotate(transformable: PsfTransformable; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_rotate';

////////////////////////////////////////////////////////////
/// \brief Scale a transformable
///
/// This function multiplies the current scale of the object,
/// unlike sfTransformable_setScale which overwrites it.
///
/// \param transformable Transformable object
/// \param factors       Scale factors
///
////////////////////////////////////////////////////////////
procedure sfTransformable_scale(transformable: PsfTransformable; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_scale';

////////////////////////////////////////////////////////////
/// \brief Get the combined transform of a transformable
///
/// \param transformable Transformable object
///
/// \return Transform combining the position/rotation/scale/origin of the object
///
////////////////////////////////////////////////////////////
function sfTransformable_getTransform(const transformable: PsfTransformable): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getTransform';

////////////////////////////////////////////////////////////
/// \brief Get the inverse of the combined transform of a transformable
///
/// \param transformable Transformable object
///
/// \return Inverse of the combined transformations applied to the object
///
////////////////////////////////////////////////////////////
function sfTransformable_getInverseTransform(const transformable: PsfTransformable): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getInverseTransform';

////////////////////////////////////////////////////////////
/// \brief Create a new vertex array
///
/// \return A new sfVertexArray object
///
////////////////////////////////////////////////////////////
function sfVertexArray_create(): PsfVertexArray; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing vertex array
///
/// \param vertexArray Vertex array to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfVertexArray_copy(const vertexArray: PsfVertexArray): PsfVertexArray; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing vertex array
///
/// \param vertexArray Vertex array to delete
///
////////////////////////////////////////////////////////////
procedure sfVertexArray_destroy(vertexArray: PsfVertexArray); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_destroy';

////////////////////////////////////////////////////////////
/// \brief Return the vertex count of a vertex array
///
/// \param vertexArray Vertex array object
///
/// \return Number of vertices in the array
///
////////////////////////////////////////////////////////////
function sfVertexArray_getVertexCount(const vertexArray: PsfVertexArray): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getVertexCount';

////////////////////////////////////////////////////////////
/// \brief Get access to a vertex by its index
///
/// This function doesn't check \a index, it must be in range
/// [0, vertex count - 1]. The behaviour is undefined
/// otherwise.
///
/// \param vertexArray Vertex array object
/// \param index       Index of the vertex to get
///
/// \return Pointer to the index-th vertex
///
////////////////////////////////////////////////////////////
function sfVertexArray_getVertex(vertexArray: PsfVertexArray; index: NativeUInt): PsfVertex; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getVertex';

////////////////////////////////////////////////////////////
/// \brief Clear a vertex array
///
/// This function removes all the vertices from the array.
/// It doesn't deallocate the corresponding memory, so that
/// adding new vertices after clearing doesn't involve
/// reallocating all the memory.
///
/// \param vertexArray Vertex array object
///
////////////////////////////////////////////////////////////
procedure sfVertexArray_clear(vertexArray: PsfVertexArray); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_clear';

////////////////////////////////////////////////////////////
/// \brief Resize the vertex array
///
/// If \a vertexCount is greater than the current size, the previous
/// vertices are kept and new (default-constructed) vertices are
/// added.
/// If \a vertexCount is less than the current size, existing vertices
/// are removed from the array.
///
/// \param vertexArray Vertex array objet
/// \param vertexCount New size of the array (number of vertices)
///
////////////////////////////////////////////////////////////
procedure sfVertexArray_resize(vertexArray: PsfVertexArray; vertexCount: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_resize';

////////////////////////////////////////////////////////////
/// \brief Add a vertex to a vertex array array
///
/// \param vertexArray Vertex array objet
/// \param vertex      Vertex to add
///
////////////////////////////////////////////////////////////
procedure sfVertexArray_append(vertexArray: PsfVertexArray; vertex: sfVertex); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_append';

////////////////////////////////////////////////////////////
/// \brief Set the type of primitives of a vertex array
///
/// This function defines how the vertices must be interpreted
/// when it's time to draw them:
/// \li As points
/// \li As lines
/// \li As triangles
/// \li As quads
/// The default primitive type is sfPoints.
///
/// \param vertexArray Vertex array objet
/// \param type        Type of primitive
///
////////////////////////////////////////////////////////////
procedure sfVertexArray_setPrimitiveType(vertexArray: PsfVertexArray; &type: sfPrimitiveType); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_setPrimitiveType';

////////////////////////////////////////////////////////////
/// \brief Get the type of primitives drawn by a vertex array
///
/// \param vertexArray Vertex array objet
///
/// \return Primitive type
///
////////////////////////////////////////////////////////////
function sfVertexArray_getPrimitiveType(vertexArray: PsfVertexArray): sfPrimitiveType; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getPrimitiveType';

////////////////////////////////////////////////////////////
/// \brief Compute the bounding rectangle of a vertex array
///
/// This function returns the axis-aligned rectangle that
/// contains all the vertices of the array.
///
/// \param vertexArray Vertex array objet
///
/// \return Bounding rectangle of the vertex array
///
////////////////////////////////////////////////////////////
function sfVertexArray_getBounds(vertexArray: PsfVertexArray): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getBounds';

////////////////////////////////////////////////////////////
/// \brief Create a new vertex buffer with a specific
/// sfPrimitiveType and usage specifier.
///
/// Creates the vertex buffer, allocating enough graphcis
/// memory to hold \p vertexCount vertices, and sets its
/// primitive type to \p type and usage to \p usage.
///
/// \param vertexCount Amount of vertices
/// \param type Type of primitive
/// \param usage Usage specifier
///
/// \return A new sfVertexBuffer object
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_create(vertexCount: Cardinal; &type: sfPrimitiveType; usage: sfVertexBufferUsage): PsfVertexBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_create';

////////////////////////////////////////////////////////////
/// \brief Copy an existing vertex buffer
///
/// \param vertexBuffer Vertex buffer to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_copy(const vertexBuffer: PsfVertexBuffer): PsfVertexBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing vertex buffer
///
/// \param vertexBuffer Vertex buffer to delete
///
////////////////////////////////////////////////////////////
procedure sfVertexBuffer_destroy(vertexBuffer: PsfVertexBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_destroy';

////////////////////////////////////////////////////////////
/// \brief Return the vertex count
///
/// \param vertexBuffer Vertex buffer object
///
/// \return Number of vertices in the vertex buffer
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_getVertexCount(const vertexBuffer: PsfVertexBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getVertexCount';

////////////////////////////////////////////////////////////
/// \brief Update a part of the buffer from an array of vertices
///
/// \p offset is specified as the number of vertices to skip
/// from the beginning of the buffer.
///
/// If \p offset is 0 and \p vertexCount is equal to the size of
/// the currently created buffer, its whole contents are replaced.
///
/// If \p offset is 0 and \p vertexCount is greater than the
/// size of the currently created buffer, a new buffer is created
/// containing the vertex data.
///
/// If \p offset is 0 and \p vertexCount is less than the size of
/// the currently created buffer, only the corresponding region
/// is updated.
///
/// If \p offset is not 0 and \p offset + \p vertexCount is greater
/// than the size of the currently created buffer, the update fails.
///
/// No additional check is performed on the size of the vertex
/// array, passing invalid arguments will lead to undefined
/// behavior.
///
/// \param vertices    Array of vertices to copy to the buffer
/// \param vertexCount Number of vertices to copy
/// \param offset      Offset in the buffer to copy to
///
/// \return sfTrue if the update was successful
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_update(vertexBuffer: PsfVertexBuffer; const vertices: PsfVertex; vertexCount: Cardinal; offset: Cardinal): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_update';

////////////////////////////////////////////////////////////
/// \brief Copy the contents of another buffer into this buffer
///
/// \param vertexBuffer Vertex buffer object
/// \param other Vertex buffer whose contents to copy into first vertex buffer
///
/// \return sfTrue if the copy was successful
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_updateFromVertexBuffer(vertexBuffer: PsfVertexBuffer; const other: PsfVertexBuffer): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_updateFromVertexBuffer';

////////////////////////////////////////////////////////////
/// \brief Swap the contents of this vertex buffer with those of another
///
/// \param left Instance to swap
/// \param right Instance to swap with
///
////////////////////////////////////////////////////////////
procedure sfVertexBuffer_swap(left: PsfVertexBuffer; right: PsfVertexBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_swap';

////////////////////////////////////////////////////////////
/// \brief Get the underlying OpenGL handle of the vertex buffer.
///
/// You shouldn't need to use this function, unless you have
/// very specific stuff to implement that SFML doesn't support,
/// or implement a temporary workaround until a bug is fixed.
///
/// \return OpenGL handle of the vertex buffer or 0 if not yet created
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_getNativeHandle(vertexBuffer: PsfVertexBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getNativeHandle';

////////////////////////////////////////////////////////////
/// \brief Set the type of primitives to draw
///
/// This function defines how the vertices must be interpreted
/// when it's time to draw them.
///
/// The default primitive type is sf::Points.
///
/// \param vertexBuffer Vertex buffer object
/// \param type Type of primitive
///
////////////////////////////////////////////////////////////
procedure sfVertexBuffer_setPrimitiveType(vertexBuffer: PsfVertexBuffer; &type: sfPrimitiveType); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_setPrimitiveType';

////////////////////////////////////////////////////////////
/// \brief Get the type of primitives drawn by the vertex buffer
///
/// \param vertexBuffer Vertex buffer object
///
/// \return Primitive type
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_getPrimitiveType(const vertexBuffer: PsfVertexBuffer): sfPrimitiveType; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getPrimitiveType';

////////////////////////////////////////////////////////////
/// \brief Set the usage specifier of this vertex buffer
///
/// This function provides a hint about how this vertex buffer is
/// going to be used in terms of data update frequency.
///
/// After changing the usage specifier, the vertex buffer has
/// to be updated with new data for the usage specifier to
/// take effect.
///
/// The default primitive type is sfVertexBufferStream.
///
/// \param vertexBuffer Vertex buffer object
/// \param usage Usage specifier
///
////////////////////////////////////////////////////////////
procedure sfVertexBuffer_setUsage(vertexBuffer: PsfVertexBuffer; usage: sfVertexBufferUsage); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_setUsage';

////////////////////////////////////////////////////////////
/// \brief Get the usage specifier of this vertex buffer
///
/// \param vertexBuffer Vertex buffer object
///
/// \return Usage specifier
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_getUsage(const vertexBuffer: PsfVertexBuffer): sfVertexBufferUsage; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getUsage';

////////////////////////////////////////////////////////////
/// \brief Bind a vertex buffer for rendering
///
/// This function is not part of the graphics API, it mustn't be
/// used when drawing SFML entities. It must be used only if you
/// mix sfVertexBuffer with OpenGL code.
///
/// \code
/// sfVertexBuffer* vb1, vb2;
/// ...
/// sfVertexBuffer_bind(vb1);
/// // draw OpenGL stuff that use vb1...
/// sfVertexBuffer_bind(vb2);
/// // draw OpenGL stuff that use vb2...
/// sfVertexBuffer_bind(NULL);
/// // draw OpenGL stuff that use no vertex buffer...
/// \endcode
///
/// \param vertexBuffer Pointer to the vertex buffer to bind, can be null to use no vertex buffer
///
////////////////////////////////////////////////////////////
procedure sfVertexBuffer_bind(const vertexBuffer: PsfVertexBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_bind';

////////////////////////////////////////////////////////////
/// \brief Tell whether or not the system supports vertex buffers
///
/// This function should always be called before using
/// the vertex buffer features. If it returns false, then
/// any attempt to use sf::VertexBuffer will fail.
///
/// \return True if vertex buffers are supported, false otherwise
///
////////////////////////////////////////////////////////////
function sfVertexBuffer_isAvailable(): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_isAvailable';

////////////////////////////////////////////////////////////
/// \brief Create a default view
///
/// This function creates a default view of (0, 0, 1000, 1000)
///
/// \return A new sfView object
///
////////////////////////////////////////////////////////////
function sfView_create(): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfView_create';

////////////////////////////////////////////////////////////
/// \brief Construct a view from a rectangle
///
/// \param rectangle Rectangle defining the zone to display
///
/// \return A new sfView object
///
////////////////////////////////////////////////////////////
function sfView_createFromRect(rectangle: sfFloatRect): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfView_createFromRect';

////////////////////////////////////////////////////////////
/// \brief Copy an existing view
///
/// \param view View to copy
///
/// \return Copied object
///
////////////////////////////////////////////////////////////
function sfView_copy(const view: PsfView): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfView_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy an existing view
///
/// \param view View to destroy
///
////////////////////////////////////////////////////////////
procedure sfView_destroy(view: PsfView); cdecl;
  external PSFML_DLL name _PU + 'sfView_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the center of a view
///
/// \param view   View object
/// \param center New center
///
////////////////////////////////////////////////////////////
procedure sfView_setCenter(view: PsfView; center: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfView_setCenter';

////////////////////////////////////////////////////////////
/// \brief Set the size of a view
///
/// \param view View object
/// \param size New size of the view
///
////////////////////////////////////////////////////////////
procedure sfView_setSize(view: PsfView; size: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfView_setSize';

////////////////////////////////////////////////////////////
/// \brief Set the orientation of a view
///
/// The default rotation of a view is 0 degree.
///
/// \param view  View object
/// \param angle New angle, in degrees
///
////////////////////////////////////////////////////////////
procedure sfView_setRotation(view: PsfView; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfView_setRotation';

////////////////////////////////////////////////////////////
/// \brief Set the target viewport of a view
///
/// The viewport is the rectangle into which the contents of the
/// view are displayed, expressed as a factor (between 0 and 1)
/// of the size of the render target to which the view is applied.
/// For example, a view which takes the left side of the target would
/// be defined by a rect of (0, 0, 0.5, 1).
/// By default, a view has a viewport which covers the entire target.
///
/// \param view     View object
/// \param viewport New viewport rectangle
///
////////////////////////////////////////////////////////////
procedure sfView_setViewport(view: PsfView; viewport: sfFloatRect); cdecl;
  external PSFML_DLL name _PU + 'sfView_setViewport';

////////////////////////////////////////////////////////////
/// \brief Reset a view to the given rectangle
///
/// Note that this function resets the rotation angle to 0.
///
/// \param view      View object
/// \param rectangle Rectangle defining the zone to display
///
////////////////////////////////////////////////////////////
procedure sfView_reset(view: PsfView; rectangle: sfFloatRect); cdecl;
  external PSFML_DLL name _PU + 'sfView_reset';

////////////////////////////////////////////////////////////
/// \brief Get the center of a view
///
/// \param view View object
///
/// \return Center of the view
///
////////////////////////////////////////////////////////////
function sfView_getCenter(const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfView_getCenter';

////////////////////////////////////////////////////////////
/// \brief Get the size of a view
///
/// \param view View object
///
/// \return Size of the view
///
////////////////////////////////////////////////////////////
function sfView_getSize(const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfView_getSize';

////////////////////////////////////////////////////////////
/// \brief Get the current orientation of a view
///
/// \param view View object
///
/// \return Rotation angle of the view, in degrees
///
////////////////////////////////////////////////////////////
function sfView_getRotation(const view: PsfView): Single; cdecl;
  external PSFML_DLL name _PU + 'sfView_getRotation';

////////////////////////////////////////////////////////////
/// \brief Get the target viewport rectangle of a view
///
/// \param view View object
///
/// \return Viewport rectangle, expressed as a factor of the target size
///
////////////////////////////////////////////////////////////
function sfView_getViewport(const view: PsfView): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfView_getViewport';

////////////////////////////////////////////////////////////
/// \brief Move a view relatively to its current position
///
/// \param view   View object
/// \param offset Offset
///
////////////////////////////////////////////////////////////
procedure sfView_move(view: PsfView; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfView_move';

////////////////////////////////////////////////////////////
/// \brief Rotate a view relatively to its current orientation
///
/// \param view  View object
/// \param angle Angle to rotate, in degrees
///
////////////////////////////////////////////////////////////
procedure sfView_rotate(view: PsfView; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfView_rotate';

////////////////////////////////////////////////////////////
/// \brief Resize a view rectangle relatively to its current size
///
/// Resizing the view simulates a zoom, as the zone displayed on
/// screen grows or shrinks.
/// \a factor is a multiplier:
/// \li 1 keeps the size unchanged
/// \li > 1 makes the view bigger (objects appear smaller)
/// \li < 1 makes the view smaller (objects appear bigger)
///
/// \param view   View object
/// \param factor Zoom factor to apply
///
////////////////////////////////////////////////////////////
procedure sfView_zoom(view: PsfView; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfView_zoom';

////////////////////////////////////////////////////////////
/// \brief Create an address from a string
///
/// Here \a address can be either a decimal address
/// (ex: "192.168.1.56") or a network name (ex: "localhost").
///
/// \param address IP address or network name
///
/// \return Resulting address
///
////////////////////////////////////////////////////////////
function sfIpAddress_fromString(const address: PUTF8Char): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_fromString';

////////////////////////////////////////////////////////////
/// \brief Create an address from 4 bytes
///
/// Calling sfIpAddress_fromBytes(a, b, c, d) is equivalent
/// to calling sfIpAddress_fromString("a.b.c.d"), but safer
/// as it doesn't have to parse a string to get the address
/// components.
///
/// \param byte0 First byte of the address
/// \param byte1 Second byte of the address
/// \param byte2 Third byte of the address
/// \param byte3 Fourth byte of the address
///
/// \return Resulting address
///
////////////////////////////////////////////////////////////
function sfIpAddress_fromBytes(byte0: sfUint8; byte1: sfUint8; byte2: sfUint8; byte3: sfUint8): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_fromBytes';

////////////////////////////////////////////////////////////
/// \brief Construct an address from a 32-bits integer
///
/// This function uses the internal representation of
/// the address directly. It should be used for optimization
/// purposes, and only if you got that representation from
/// sfIpAddress_ToInteger.
///
/// \param address 4 bytes of the address packed into a 32-bits integer
///
/// \return Resulting address
///
////////////////////////////////////////////////////////////
function sfIpAddress_fromInteger(address: sfUint32): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_fromInteger';

////////////////////////////////////////////////////////////
/// \brief Get a string representation of an address
///
/// The returned string is the decimal representation of the
/// IP address (like "192.168.1.56"), even if it was constructed
/// from a host name.
///
/// \param address Address object
/// \param string  String where the string representation will be stored
///
////////////////////////////////////////////////////////////
procedure sfIpAddress_toString(address: sfIpAddress; &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_toString';

////////////////////////////////////////////////////////////
/// \brief Get an integer representation of the address
///
/// The returned number is the internal representation of the
/// address, and should be used for optimization purposes only
/// (like sending the address through a socket).
/// The integer produced by this function can then be converted
/// back to a sfIpAddress with sfIpAddress_FromInteger.
///
/// \param address Address object
///
/// \return 32-bits unsigned integer representation of the address
///
////////////////////////////////////////////////////////////
function sfIpAddress_toInteger(address: sfIpAddress): sfUint32; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_toInteger';

////////////////////////////////////////////////////////////
/// \brief Get the computer's local address
///
/// The local address is the address of the computer from the
/// LAN point of view, i.e. something like 192.168.1.56. It is
/// meaningful only for communications over the local network.
/// Unlike sfIpAddress_getPublicAddress, this function is fast
/// and may be used safely anywhere.
///
/// \return Local IP address of the computer
///
////////////////////////////////////////////////////////////
function sfIpAddress_getLocalAddress(): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_getLocalAddress';

////////////////////////////////////////////////////////////
/// \brief Get the computer's public address
///
/// The public address is the address of the computer from the
/// internet point of view, i.e. something like 89.54.1.169.
/// It is necessary for communications over the world wide web.
/// The only way to get a public address is to ask it to a
/// distant website; as a consequence, this function depends on
/// both your network connection and the server, and may be
/// very slow. You should use it as few as possible. Because
/// this function depends on the network connection and on a distant
/// server, you may use a time limit if you don't want your program
/// to be possibly stuck waiting in case there is a problem; use
/// 0 to deactivate this limit.
///
/// \param timeout Maximum time to wait
///
/// \return Public IP address of the computer
///
////////////////////////////////////////////////////////////
function sfIpAddress_getPublicAddress(timeout: sfTime): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_getPublicAddress';

////////////////////////////////////////////////////////////
/// \brief Destroy a FTP listing response
///
/// \param ftpListingResponse Ftp listing response to destroy
///
////////////////////////////////////////////////////////////
procedure sfFtpListingResponse_destroy(ftpListingResponse: PsfFtpListingResponse); cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_destroy';

////////////////////////////////////////////////////////////
/// \brief Check if a FTP listing response status code means a success
///
/// This function is defined for convenience, it is
/// equivalent to testing if the status code is < 400.
///
/// \param ftpListingResponse Ftp listing response
///
/// \return sfTrue if the status is a success, sfFalse if it is a failure
///
////////////////////////////////////////////////////////////
function sfFtpListingResponse_isOk(const ftpListingResponse: PsfFtpListingResponse): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_isOk';

////////////////////////////////////////////////////////////
/// \brief Get the status code of a FTP listing response
///
/// \param ftpListingResponse Ftp listing response
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfFtpListingResponse_getStatus(const ftpListingResponse: PsfFtpListingResponse): sfFtpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getStatus';

////////////////////////////////////////////////////////////
/// \brief Get the full message contained in a FTP listing response
///
/// \param ftpListingResponse Ftp listing response
///
/// \return The response message
///
////////////////////////////////////////////////////////////
function sfFtpListingResponse_getMessage(const ftpListingResponse: PsfFtpListingResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getMessage';

////////////////////////////////////////////////////////////
/// \brief Return the number of directory/file names contained in a FTP listing response
///
/// \param ftpListingResponse Ftp listing response
///
/// \return Total number of names available
///
////////////////////////////////////////////////////////////
function sfFtpListingResponse_getCount(const ftpListingResponse: PsfFtpListingResponse): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getCount';

////////////////////////////////////////////////////////////
/// \brief Return a directory/file name contained in a FTP listing response
///
/// \param ftpListingResponse Ftp listing response
/// \param index              Index of the name to get (in range [0 .. getCount])
///
/// \return The requested name
///
////////////////////////////////////////////////////////////
function sfFtpListingResponse_getName(const ftpListingResponse: PsfFtpListingResponse; index: NativeUInt): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getName';

////////////////////////////////////////////////////////////
/// \brief Destroy a FTP directory response
///
/// \param ftpDirectoryResponse Ftp directory response to destroy
///
////////////////////////////////////////////////////////////
procedure sfFtpDirectoryResponse_destroy(ftpDirectoryResponse: PsfFtpDirectoryResponse); cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_destroy';

////////////////////////////////////////////////////////////
/// \brief Check if a FTP directory response status code means a success
///
/// This function is defined for convenience, it is
/// equivalent to testing if the status code is < 400.
///
/// \param ftpDirectoryResponse Ftp directory response
///
/// \return sfTrue if the status is a success, sfFalse if it is a failure
///
////////////////////////////////////////////////////////////
function sfFtpDirectoryResponse_isOk(const ftpDirectoryResponse: PsfFtpDirectoryResponse): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_isOk';

////////////////////////////////////////////////////////////
/// \brief Get the status code of a FTP directory response
///
/// \param ftpDirectoryResponse Ftp directory response
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfFtpDirectoryResponse_getStatus(const ftpDirectoryResponse: PsfFtpDirectoryResponse): sfFtpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getStatus';

////////////////////////////////////////////////////////////
/// \brief Get the full message contained in a FTP directory response
///
/// \param ftpDirectoryResponse Ftp directory response
///
/// \return The response message
///
////////////////////////////////////////////////////////////
function sfFtpDirectoryResponse_getMessage(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getMessage';

////////////////////////////////////////////////////////////
/// \brief Get the directory returned in a FTP directory response
///
/// \param ftpDirectoryResponse Ftp directory response
///
/// \return Directory name
///
////////////////////////////////////////////////////////////
function sfFtpDirectoryResponse_getDirectory(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getDirectory';

////////////////////////////////////////////////////////////
/// \brief Destroy a FTP response
///
/// \param ftpResponse Ftp response to destroy
///
////////////////////////////////////////////////////////////
procedure sfFtpResponse_destroy(ftpResponse: PsfFtpResponse); cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_destroy';

////////////////////////////////////////////////////////////
/// \brief Check if a FTP response status code means a success
///
/// This function is defined for convenience, it is
/// equivalent to testing if the status code is < 400.
///
/// \param ftpResponse Ftp response object
///
/// \return sfTrue if the status is a success, sfFalse if it is a failure
///
////////////////////////////////////////////////////////////
function sfFtpResponse_isOk(const ftpResponse: PsfFtpResponse): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_isOk';

////////////////////////////////////////////////////////////
/// \brief Get the status code of a FTP response
///
/// \param ftpResponse Ftp response object
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfFtpResponse_getStatus(const ftpResponse: PsfFtpResponse): sfFtpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_getStatus';

////////////////////////////////////////////////////////////
/// \brief Get the full message contained in a FTP response
///
/// \param ftpResponse Ftp response object
///
/// \return The response message
///
////////////////////////////////////////////////////////////
function sfFtpResponse_getMessage(const ftpResponse: PsfFtpResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_getMessage';

////////////////////////////////////////////////////////////
/// \brief Create a new Ftp object
///
/// \return A new sfFtp object
///
////////////////////////////////////////////////////////////
function sfFtp_create(): PsfFtp; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a Ftp object
///
/// \param ftp Ftp object to destroy
///
////////////////////////////////////////////////////////////
procedure sfFtp_destroy(ftp: PsfFtp); cdecl;
  external PSFML_DLL name _PU + 'sfFtp_destroy';

////////////////////////////////////////////////////////////
/// \brief Connect to the specified FTP server
///
/// The port should be 21, which is the standard
/// port used by the FTP protocol. You shouldn't use a different
/// value, unless you really know what you do.
/// This function tries to connect to the server so it may take
/// a while to complete, especially if the server is not
/// reachable. To avoid blocking your application for too long,
/// you can use a timeout. Using 0 means that the
/// system timeout will be used (which is usually pretty long).
///
/// \param ftp     Ftp object
/// \param server  Name or address of the FTP server to connect to
/// \param port    Port used for the connection
/// \param timeout Maximum time to wait
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_connect(ftp: PsfFtp; server: sfIpAddress; port: Word; timeout: sfTime): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_connect';

////////////////////////////////////////////////////////////
/// \brief Log in using an anonymous account
///
/// Logging in is mandatory after connecting to the server.
/// Users that are not logged in cannot perform any operation.
///
/// \param ftp Ftp object
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_loginAnonymous(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_loginAnonymous';

////////////////////////////////////////////////////////////
/// \brief Log in using a username and a password
///
/// Logging in is mandatory after connecting to the server.
/// Users that are not logged in cannot perform any operation.
///
/// \param ftp      Ftp object
/// \param name     User name
/// \param password Password
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_login(ftp: PsfFtp; const name: PUTF8Char; const password: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_login';

////////////////////////////////////////////////////////////
/// \brief Close the connection with the server
///
/// \param ftp Ftp object
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_disconnect(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_disconnect';

////////////////////////////////////////////////////////////
/// \brief Send a null command to keep the connection alive
///
/// This command is useful because the server may close the
/// connection automatically if no command is sent.
///
/// \param ftp Ftp object
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_keepAlive(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_keepAlive';

////////////////////////////////////////////////////////////
/// \brief Get the current working directory
///
/// The working directory is the root path for subsequent
/// operations involving directories and/or filenames.
///
/// \param ftp Ftp object
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_getWorkingDirectory(ftp: PsfFtp): PsfFtpDirectoryResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_getWorkingDirectory';

////////////////////////////////////////////////////////////
/// \brief Get the contents of the given directory
///
/// This function retrieves the sub-directories and files
/// contained in the given directory. It is not recursive.
/// The \a directory parameter is relative to the current
/// working directory.
///
/// \param ftp       Ftp object
/// \param directory Directory to list
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_getDirectoryListing(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpListingResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_getDirectoryListing';

////////////////////////////////////////////////////////////
/// \brief Change the current working directory
///
/// The new directory must be relative to the current one.
///
/// \param ftp       Ftp object
/// \param directory New working directory
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_changeDirectory(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_changeDirectory';

////////////////////////////////////////////////////////////
/// \brief Go to the parent directory of the current one
///
/// \param ftp Ftp object
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_parentDirectory(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_parentDirectory';

////////////////////////////////////////////////////////////
/// \brief Create a new directory
///
/// The new directory is created as a child of the current
/// working directory.
///
/// \param ftp  Ftp object
/// \param name Name of the directory to create
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_createDirectory(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_createDirectory';

////////////////////////////////////////////////////////////
/// \brief Remove an existing directory
///
/// The directory to remove must be relative to the
/// current working directory.
/// Use this function with caution, the directory will
/// be removed permanently!
///
/// \param ftp  Ftp object
/// \param name Name of the directory to remove
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_deleteDirectory(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_deleteDirectory';

////////////////////////////////////////////////////////////
/// \brief Rename an existing file
///
/// The filenames must be relative to the current working
/// directory.
///
/// \param ftp     Ftp object
/// \param file    File to rename
/// \param newName New name of the file
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_renameFile(ftp: PsfFtp; const &file: PUTF8Char; const newName: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_renameFile';

////////////////////////////////////////////////////////////
/// \brief Remove an existing file
///
/// The file name must be relative to the current working
/// directory.
/// Use this function with caution, the file will be
/// removed permanently!
///
/// \param ftp  Ftp object
/// \param name File to remove
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_deleteFile(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_deleteFile';

////////////////////////////////////////////////////////////
/// \brief Download a file from a FTP server
///
/// The filename of the distant file is relative to the
/// current working directory of the server, and the local
/// destination path is relative to the current directory
/// of your application.
///
/// \param ftp        Ftp object
/// \param remoteFile Filename of the distant file to download
/// \param localPath  Where to put to file on the local computer
/// \param mode       Transfer mode
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_download(ftp: PsfFtp; const remoteFile: PUTF8Char; const localPath: PUTF8Char; mode: sfFtpTransferMode): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_download';

////////////////////////////////////////////////////////////
/// \brief Upload a file to a FTP server
///
/// The name of the local file is relative to the current
/// working directory of your application, and the
/// remote path is relative to the current directory of the
/// FTP server.
///
/// \param ftp        Ftp object
/// \param localFile  Path of the local file to upload
/// \param remotePath Where to put to file on the server
/// \param mode       Transfer mode
/// \param append     Pass sfTrue to append to or sfFalse to overwrite the remote file if it already exists
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_upload(ftp: PsfFtp; const localFile: PUTF8Char; const remotePath: PUTF8Char; mode: sfFtpTransferMode; append: sfBool): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_upload';

////////////////////////////////////////////////////////////
/// \brief Send a command to the FTP server
///
/// While the most often used commands are provided as
/// specific functions, this function can be used to send
/// any FTP command to the server. If the command requires
/// one or more parameters, they can be specified in
/// \a parameter. Otherwise you should pass NULL.
/// If the server returns information, you can extract it
/// from the response using sfResponse_getMessage().
///
/// \param ftp       Ftp object
/// \param command   Command to send
/// \param parameter Command parameter
///
/// \return Server response to the request
///
////////////////////////////////////////////////////////////
function sfFtp_sendCommand(ftp: PsfFtp; const command: PUTF8Char; const parameter: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_sendCommand';

////////////////////////////////////////////////////////////
/// \brief Create a new HTTP request
///
/// \return A new sfHttpRequest object
///
////////////////////////////////////////////////////////////
function sfHttpRequest_create(): PsfHttpRequest; cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a HTTP request
///
/// \param httpRequest HTTP request to destroy
///
////////////////////////////////////////////////////////////
procedure sfHttpRequest_destroy(httpRequest: PsfHttpRequest); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the value of a header field of a HTTP request
///
/// The field is created if it doesn't exist. The name of
/// the field is case insensitive.
/// By default, a request doesn't contain any field (but the
/// mandatory fields are added later by the HTTP client when
/// sending the request).
///
/// \param httpRequest HTTP request
/// \param field       Name of the field to set
/// \param value       Value of the field
///
////////////////////////////////////////////////////////////
procedure sfHttpRequest_setField(httpRequest: PsfHttpRequest; const field: PUTF8Char; const value: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setField';

////////////////////////////////////////////////////////////
/// \brief Set a HTTP request method
///
/// See the sfHttpMethod enumeration for a complete list of all
/// the availale methods.
/// The method is sfHttpGet by default.
///
/// \param httpRequest HTTP request
/// \param method      Method to use for the request
///
////////////////////////////////////////////////////////////
procedure sfHttpRequest_setMethod(httpRequest: PsfHttpRequest; method: sfHttpMethod); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setMethod';

////////////////////////////////////////////////////////////
/// \brief Set a HTTP request URI
///
/// The URI is the resource (usually a web page or a file)
/// that you want to get or post.
/// The URI is "/" (the root page) by default.
///
/// \param httpRequest HTTP request
/// \param uri         URI to request, relative to the host
///
////////////////////////////////////////////////////////////
procedure sfHttpRequest_setUri(httpRequest: PsfHttpRequest; const uri: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setUri';

////////////////////////////////////////////////////////////
/// \brief Set the HTTP version of a HTTP request
///
/// The HTTP version is 1.0 by default.
///
/// \param httpRequest HTTP request
/// \param major       Major HTTP version number
/// \param minor       Minor HTTP version number
///
////////////////////////////////////////////////////////////
procedure sfHttpRequest_setHttpVersion(httpRequest: PsfHttpRequest; major: Cardinal; minor: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setHttpVersion';

////////////////////////////////////////////////////////////
/// \brief Set the body of a HTTP request
///
/// The body of a request is optional and only makes sense
/// for POST requests. It is ignored for all other methods.
/// The body is empty by default.
///
/// \param httpRequest HTTP request
/// \param body        Content of the body
///
////////////////////////////////////////////////////////////
procedure sfHttpRequest_setBody(httpRequest: PsfHttpRequest; const body: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setBody';

////////////////////////////////////////////////////////////
/// \brief Destroy a HTTP response
///
/// \param httpResponse HTTP response to destroy
///
////////////////////////////////////////////////////////////
procedure sfHttpResponse_destroy(httpResponse: PsfHttpResponse); cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_destroy';

////////////////////////////////////////////////////////////
/// \brief Get the value of a field of a HTTP response
///
/// If the field \a field is not found in the response header,
/// the empty string is returned. This function uses
/// case-insensitive comparisons.
///
/// \param httpResponse HTTP response
/// \param field        Name of the field to get
///
/// \return Value of the field, or empty string if not found
///
////////////////////////////////////////////////////////////
function sfHttpResponse_getField(const httpResponse: PsfHttpResponse; const field: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getField';

////////////////////////////////////////////////////////////
/// \brief Get the status code of a HTTP reponse
///
/// The status code should be the first thing to be checked
/// after receiving a response, it defines whether it is a
/// success, a failure or anything else (see the sfHttpStatus
/// enumeration).
///
/// \param httpResponse HTTP response
///
/// \return Status code of the response
///
////////////////////////////////////////////////////////////
function sfHttpResponse_getStatus(const httpResponse: PsfHttpResponse): sfHttpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getStatus';

////////////////////////////////////////////////////////////
/// \brief Get the major HTTP version number of a HTTP response
///
/// \param httpResponse HTTP response
///
/// \return Major HTTP version number
///
////////////////////////////////////////////////////////////
function sfHttpResponse_getMajorVersion(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getMajorVersion';

////////////////////////////////////////////////////////////
/// \brief Get the minor HTTP version number of a HTTP response
///
/// \param httpResponse HTTP response
///
/// \return Minor HTTP version number
///
////////////////////////////////////////////////////////////
function sfHttpResponse_getMinorVersion(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getMinorVersion';

////////////////////////////////////////////////////////////
/// \brief Get the body of a HTTP response
///
/// The body of a response may contain:
/// \li the requested page (for GET requests)
/// \li a response from the server (for POST requests)
/// \li nothing (for HEAD requests)
/// \li an error message (in case of an error)
///
/// \param httpResponse HTTP response
///
/// \return The response body
///
////////////////////////////////////////////////////////////
function sfHttpResponse_getBody(const httpResponse: PsfHttpResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getBody';

////////////////////////////////////////////////////////////
/// \brief Create a new Http object
///
/// \return A new sfHttp object
///
////////////////////////////////////////////////////////////
function sfHttp_create(): PsfHttp; cdecl;
  external PSFML_DLL name _PU + 'sfHttp_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a Http object
///
/// \param http Http object to destroy
///
////////////////////////////////////////////////////////////
procedure sfHttp_destroy(http: PsfHttp); cdecl;
  external PSFML_DLL name _PU + 'sfHttp_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the target host of a HTTP object
///
/// This function just stores the host address and port, it
/// doesn't actually connect to it until you send a request.
/// If the port is 0, it means that the HTTP client will use
/// the right port according to the protocol used
/// (80 for HTTP, 443 for HTTPS). You should
/// leave it like this unless you really need a port other
/// than the standard one, or use an unknown protocol.
///
/// \param http Http object
/// \param host Web server to connect to
/// \param port Port to use for connection
///
////////////////////////////////////////////////////////////
procedure sfHttp_setHost(http: PsfHttp; const host: PUTF8Char; port: Word); cdecl;
  external PSFML_DLL name _PU + 'sfHttp_setHost';

////////////////////////////////////////////////////////////
/// \brief Send a HTTP request and return the server's response.
///
/// You must have a valid host before sending a request (see sfHttp_setHost).
/// Any missing mandatory header field in the request will be added
/// with an appropriate value.
/// Warning: this function waits for the server's response and may
/// not return instantly; use a thread if you don't want to block your
/// application, or use a timeout to limit the time to wait. A value
/// of 0 means that the client will use the system defaut timeout
/// (which is usually pretty long).
///
/// \param http    Http object
/// \param request Request to send
/// \param timeout Maximum time to wait
///
/// \return Server's response
///
////////////////////////////////////////////////////////////
function sfHttp_sendRequest(http: PsfHttp; const request: PsfHttpRequest; timeout: sfTime): PsfHttpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfHttp_sendRequest';

////////////////////////////////////////////////////////////
/// \brief Create a new packet
///
/// \return A new sfPacket object
///
////////////////////////////////////////////////////////////
function sfPacket_create(): PsfPacket; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_create';

////////////////////////////////////////////////////////////
/// \brief Create a new packet by copying an existing one
///
/// \param packet Packet to copy
///
/// \return A new sfPacket object which is a copy of \a packet
///
////////////////////////////////////////////////////////////
function sfPacket_copy(const packet: PsfPacket): PsfPacket; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy a packet
///
/// \param packet Packet to destroy
///
////////////////////////////////////////////////////////////
procedure sfPacket_destroy(packet: PsfPacket); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_destroy';

////////////////////////////////////////////////////////////
/// \brief Append data to the end of a packet
///
/// \param packet      Packet object
/// \param data        Pointer to the sequence of bytes to append
/// \param sizeInBytes Number of bytes to append
///
////////////////////////////////////////////////////////////
procedure sfPacket_append(packet: PsfPacket; const data: Pointer; sizeInBytes: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_append';

////////////////////////////////////////////////////////////
/// \brief Get the current reading position in the packet
///
/// The next read operation will read data from this position
///
/// \return The byte offset of the current read position
///
/// \see append
///
////////////////////////////////////////////////////////////
function sfPacket_getReadPosition(const packet: PsfPacket): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_getReadPosition';

////////////////////////////////////////////////////////////
/// \brief Clear a packet
///
/// After calling Clear, the packet is empty.
///
/// \param packet Packet object
///
///////////////////////////////////////////////////////////
procedure sfPacket_clear(packet: PsfPacket); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_clear';

////////////////////////////////////////////////////////////
/// \brief Get a pointer to the data contained in a packet
///
/// Warning: the returned pointer may become invalid after
/// you append data to the packet, therefore it should never
/// be stored.
/// The return pointer is NULL if the packet is empty.
///
/// \param packet Packet object
///
/// \return Pointer to the data
///
////////////////////////////////////////////////////////////
function sfPacket_getData(const packet: PsfPacket): Pointer; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_getData';

////////////////////////////////////////////////////////////
/// \brief Get the size of the data contained in a packet
///
/// This function returns the number of bytes pointed to by
/// what sfPacket_getData returns.
///
/// \param packet Packet object
///
/// \return Data size, in bytes
///
////////////////////////////////////////////////////////////
function sfPacket_getDataSize(const packet: PsfPacket): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_getDataSize';

////////////////////////////////////////////////////////////
/// \brief Tell if the reading position has reached the
///        end of a packet
///
/// This function is useful to know if there is some data
/// left to be read, without actually reading it.
///
/// \param packet Packet object
///
/// \return sfTrue if all data was read, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfPacket_endOfPacket(const packet: PsfPacket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_endOfPacket';

////////////////////////////////////////////////////////////
/// \brief Test the validity of a packet, for reading
///
/// This function allows to test the packet, to check if
/// a reading operation was successful.
///
/// A packet will be in an invalid state if it has no more
/// data to read.
///
/// \param packet Packet object
///
/// \return sfTrue if last data extraction from packet was successful
///
////////////////////////////////////////////////////////////
function sfPacket_canRead(const packet: PsfPacket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_canRead';

////////////////////////////////////////////////////////////
/// \brief Functions to extract data from a packet
///
/// \param packet Packet object
///
////////////////////////////////////////////////////////////
function sfPacket_readBool(packet: PsfPacket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readBool';

function sfPacket_readInt8(packet: PsfPacket): sfInt8; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readInt8';

function sfPacket_readUint8(packet: PsfPacket): sfUint8; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readUint8';

function sfPacket_readInt16(packet: PsfPacket): sfInt16; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readInt16';

function sfPacket_readUint16(packet: PsfPacket): sfUint16; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readUint16';

function sfPacket_readInt32(packet: PsfPacket): sfInt32; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readInt32';

function sfPacket_readUint32(packet: PsfPacket): sfUint32; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readUint32';

function sfPacket_readFloat(packet: PsfPacket): Single; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readFloat';

function sfPacket_readDouble(packet: PsfPacket): Double; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readDouble';

procedure sfPacket_readString(packet: PsfPacket; &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readString';

procedure sfPacket_readWideString(packet: PsfPacket; &string: PWideChar); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readWideString';

////////////////////////////////////////////////////////////
/// \brief Functions to insert data into a packet
///
/// \param packet Packet object
///
////////////////////////////////////////////////////////////
procedure sfPacket_writeBool(packet: PsfPacket; p2: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeBool';

procedure sfPacket_writeInt8(packet: PsfPacket; p2: sfInt8); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeInt8';

procedure sfPacket_writeUint8(packet: PsfPacket; p2: sfUint8); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeUint8';

procedure sfPacket_writeInt16(packet: PsfPacket; p2: sfInt16); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeInt16';

procedure sfPacket_writeUint16(packet: PsfPacket; p2: sfUint16); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeUint16';

procedure sfPacket_writeInt32(packet: PsfPacket; p2: sfInt32); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeInt32';

procedure sfPacket_writeUint32(packet: PsfPacket; p2: sfUint32); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeUint32';

procedure sfPacket_writeFloat(packet: PsfPacket; p2: Single); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeFloat';

procedure sfPacket_writeDouble(packet: PsfPacket; p2: Double); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeDouble';

procedure sfPacket_writeString(packet: PsfPacket; const &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeString';

procedure sfPacket_writeWideString(packet: PsfPacket; const &string: PWideChar); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeWideString';

////////////////////////////////////////////////////////////
/// \brief Create a new selector
///
/// \return A new sfSocketSelector object
///
////////////////////////////////////////////////////////////
function sfSocketSelector_create(): PsfSocketSelector; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_create';

////////////////////////////////////////////////////////////
/// \brief Create a new socket selector by copying an existing one
///
/// \param selector Socket selector to copy
///
/// \return A new sfSocketSelector object which is a copy of \a selector
///
////////////////////////////////////////////////////////////
function sfSocketSelector_copy(const selector: PsfSocketSelector): PsfSocketSelector; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_copy';

////////////////////////////////////////////////////////////
/// \brief Destroy a socket selector
///
/// \param selector Socket selector to destroy
///
////////////////////////////////////////////////////////////
procedure sfSocketSelector_destroy(selector: PsfSocketSelector); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_destroy';

////////////////////////////////////////////////////////////
/// \brief Add a new socket to a socket selector
///
/// This function keeps a weak pointer to the socket,
/// so you have to make sure that the socket is not destroyed
/// while it is stored in the selector.
///
/// \param selector Socket selector object
/// \param socket   Pointer to the socket to add
///
////////////////////////////////////////////////////////////
procedure sfSocketSelector_addTcpListener(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_addTcpListener';

procedure sfSocketSelector_addTcpSocket(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_addTcpSocket';

procedure sfSocketSelector_addUdpSocket(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_addUdpSocket';

////////////////////////////////////////////////////////////
/// \brief Remove a socket from a socket selector
///
/// This function doesn't destroy the socket, it simply
/// removes the pointer that the selector has to it.
///
/// \param selector Socket selector object
/// \param socket   POointer to the socket to remove
///
////////////////////////////////////////////////////////////
procedure sfSocketSelector_removeTcpListener(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_removeTcpListener';

procedure sfSocketSelector_removeTcpSocket(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_removeTcpSocket';

procedure sfSocketSelector_removeUdpSocket(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_removeUdpSocket';

////////////////////////////////////////////////////////////
/// \brief Remove all the sockets stored in a selector
///
/// This function doesn't destroy any instance, it simply
/// removes all the pointers that the selector has to
/// external sockets.
///
/// \param selector Socket selector object
///
////////////////////////////////////////////////////////////
procedure sfSocketSelector_clear(selector: PsfSocketSelector); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_clear';

////////////////////////////////////////////////////////////
/// \brief Wait until one or more sockets are ready to receive
///
/// This function returns as soon as at least one socket has
/// some data available to be received. To know which sockets are
/// ready, use the sfSocketSelector_isXxxReady functions.
/// If you use a timeout and no socket is ready before the timeout
/// is over, the function returns sfFalse.
///
/// \param selector Socket selector object
/// \param timeout  Maximum time to wait (use sfTimeZero for infinity)
///
/// \return sfTrue if there are sockets ready, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfSocketSelector_wait(selector: PsfSocketSelector; timeout: sfTime): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_wait';

////////////////////////////////////////////////////////////
/// \brief Test a socket to know if it is ready to receive data
///
/// This function must be used after a call to
/// sfSocketSelector_wait, to know which sockets are ready to
/// receive data. If a socket is ready, a call to Receive will
/// never block because we know that there is data available to read.
/// Note that if this function returns sfTrue for a sfTcpListener,
/// this means that it is ready to accept a new connection.
///
/// \param selector Socket selector object
/// \param socket   Socket to test
///
/// \return sfTrue if the socket is ready to read, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfSocketSelector_isTcpListenerReady(const selector: PsfSocketSelector; socket: PsfTcpListener): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_isTcpListenerReady';

function sfSocketSelector_isTcpSocketReady(const selector: PsfSocketSelector; socket: PsfTcpSocket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_isTcpSocketReady';

function sfSocketSelector_isUdpSocketReady(const selector: PsfSocketSelector; socket: PsfUdpSocket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_isUdpSocketReady';

////////////////////////////////////////////////////////////
/// \brief Create a new TCP listener
///
/// \return A new sfTcpListener object
///
////////////////////////////////////////////////////////////
function sfTcpListener_create(): PsfTcpListener; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a TCP listener
///
/// \param listener TCP listener to destroy
///
////////////////////////////////////////////////////////////
procedure sfTcpListener_destroy(listener: PsfTcpListener); cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the blocking state of a TCP listener
///
/// In blocking mode, calls will not return until they have
/// completed their task. For example, a call to
/// sfTcpListener_accept in blocking mode won't return until
/// a new connection was actually received.
/// In non-blocking mode, calls will always return immediately,
/// using the return code to signal whether there was data
/// available or not.
/// By default, all sockets are blocking.
///
/// \param listener TCP listener object
/// \param blocking sfTrue to set the socket as blocking, sfFalse for non-blocking
///
////////////////////////////////////////////////////////////
procedure sfTcpListener_setBlocking(listener: PsfTcpListener; blocking: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_setBlocking';

////////////////////////////////////////////////////////////
/// \brief Tell whether a TCP listener is in blocking or non-blocking mode
///
/// \param listener TCP listener object
///
/// \return sfTrue if the socket is blocking, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfTcpListener_isBlocking(const listener: PsfTcpListener): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_isBlocking';

////////////////////////////////////////////////////////////
/// \brief Get the port to which a TCP listener is bound locally
///
/// If the socket is not listening to a port, this function
/// returns 0.
///
/// \param listener TCP listener object
///
/// \return Port to which the TCP listener is bound
///
////////////////////////////////////////////////////////////
function sfTcpListener_getLocalPort(const listener: PsfTcpListener): Word; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_getLocalPort';

////////////////////////////////////////////////////////////
/// \brief Start listening for connections
///
/// This functions makes the socket listen to the specified
/// port, waiting for new connections.
/// If the socket was previously listening to another port,
/// it will be stopped first and bound to the new port.
///
/// If there is no specific address to listen to, pass sfIpAddress_Any
///
/// \param listener TCP listener object
/// \param port     Port to listen for new connections
/// \param address  Address of the interface to listen on
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpListener_listen(listener: PsfTcpListener; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_listen';

////////////////////////////////////////////////////////////
/// \brief Accept a new connection
///
/// If the socket is in blocking mode, this function will
/// not return until a connection is actually received.
///
/// The \a connected argument points to a valid sfTcpSocket pointer
/// in case of success (the function returns sfSocketDone), it points
/// to a NULL pointer otherwise.
///
/// \param listener  TCP listener object
/// \param connected Socket that will hold the new connection
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpListener_accept(listener: PsfTcpListener; connected: PPsfTcpSocket): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_accept';

////////////////////////////////////////////////////////////
/// \brief Create a new TCP socket
///
/// \return A new sfTcpSocket object
///
////////////////////////////////////////////////////////////
function sfTcpSocket_create(): PsfTcpSocket; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a TCP socket
///
/// \param socket TCP socket to destroy
///
////////////////////////////////////////////////////////////
procedure sfTcpSocket_destroy(socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the blocking state of a TCP listener
///
/// In blocking mode, calls will not return until they have
/// completed their task. For example, a call to
/// sfTcpSocket_receive in blocking mode won't return until
/// new data was actually received.
/// In non-blocking mode, calls will always return immediately,
/// using the return code to signal whether there was data
/// available or not.
/// By default, all sockets are blocking.
///
/// \param socket   TCP socket object
/// \param blocking sfTrue to set the socket as blocking, sfFalse for non-blocking
///
////////////////////////////////////////////////////////////
procedure sfTcpSocket_setBlocking(socket: PsfTcpSocket; blocking: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_setBlocking';

////////////////////////////////////////////////////////////
/// \brief Tell whether a TCP socket is in blocking or non-blocking mode
///
/// \param socket TCP socket object
///
/// \return sfTrue if the socket is blocking, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfTcpSocket_isBlocking(const socket: PsfTcpSocket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_isBlocking';

////////////////////////////////////////////////////////////
/// \brief Get the port to which a TCP socket is bound locally
///
/// If the socket is not connected, this function returns 0.
///
/// \param socket TCP socket object
///
/// \return Port to which the socket is bound
///
////////////////////////////////////////////////////////////
function sfTcpSocket_getLocalPort(const socket: PsfTcpSocket): Word; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_getLocalPort';

////////////////////////////////////////////////////////////
/// \brief Get the address of the connected peer of a TCP socket
///
/// It the socket is not connected, this function returns
/// sfIpAddress_None.
///
/// \param socket TCP socket object
///
/// \return Address of the remote peer
///
////////////////////////////////////////////////////////////
function sfTcpSocket_getRemoteAddress(const socket: PsfTcpSocket): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_getRemoteAddress';

////////////////////////////////////////////////////////////
/// \brief Get the port of the connected peer to which
///        a TCP socket is connected
///
/// If the socket is not connected, this function returns 0.
///
/// \param socket TCP socket object
///
/// \return Remote port to which the socket is connected
///
////////////////////////////////////////////////////////////
function sfTcpSocket_getRemotePort(const socket: PsfTcpSocket): Word; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_getRemotePort';

////////////////////////////////////////////////////////////
/// \brief Connect a TCP socket to a remote peer
///
/// In blocking mode, this function may take a while, especially
/// if the remote peer is not reachable. The last parameter allows
/// you to stop trying to connect after a given timeout.
/// If the socket was previously connected, it is first disconnected.
///
/// \param socket        TCP socket object
/// \param remoteAddress Address of the remote peer
/// \param remotePort    Port of the remote peer
/// \param timeout       Maximum time to wait
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpSocket_connect(socket: PsfTcpSocket; remoteAddress: sfIpAddress; remotePort: Word; timeout: sfTime): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_connect';

////////////////////////////////////////////////////////////
/// \brief Disconnect a TCP socket from its remote peer
///
/// This function gracefully closes the connection. If the
/// socket is not connected, this function has no effect.
///
/// \param socket TCP socket object
///
////////////////////////////////////////////////////////////
procedure sfTcpSocket_disconnect(socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_disconnect';

////////////////////////////////////////////////////////////
/// \brief Send raw data to the remote peer of a TCP socket
///
/// To be able to handle partial sends over non-blocking
/// sockets, use the sfTcpSocket_sendPartial(sfTcpSocket*, const void*, std::size_t, size_t*)
/// overload instead.
/// This function will fail if the socket is not connected.
///
/// \param socket TCP socket object
/// \param data   Pointer to the sequence of bytes to send
/// \param size   Number of bytes to send
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpSocket_send(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_send';

////////////////////////////////////////////////////////////
/// \brief Send raw data to the remote peer
///
/// This function will fail if the socket is not connected.
///
/// \param socket TCP socket object
/// \param data   Pointer to the sequence of bytes to send
/// \param size   Number of bytes to send
/// \param sent   The number of bytes sent will be written here
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpSocket_sendPartial(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt; sent: PNativeUInt): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_sendPartial';

////////////////////////////////////////////////////////////
/// \brief Receive raw data from the remote peer of a TCP socket
///
/// In blocking mode, this function will wait until some
/// bytes are actually received.
/// This function will fail if the socket is not connected.
///
/// \param socket   TCP socket object
/// \param data     Pointer to the array to fill with the received bytes
/// \param size     Maximum number of bytes that can be received
/// \param received This variable is filled with the actual number of bytes received
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpSocket_receive(socket: PsfTcpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_receive';

////////////////////////////////////////////////////////////
/// \brief Send a formatted packet of data to the remote peer of a TCP socket
///
/// In non-blocking mode, if this function returns sfSocketPartial,
/// you must retry sending the same unmodified packet before sending
/// anything else in order to guarantee the packet arrives at the remote
/// peer uncorrupted.
/// This function will fail if the socket is not connected.
///
/// \param socket TCP socket object
/// \param packet Packet to send
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpSocket_sendPacket(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_sendPacket';

////////////////////////////////////////////////////////////
/// \brief Receive a formatted packet of data from the remote peer
///
/// In blocking mode, this function will wait until the whole packet
/// has been received.
/// This function will fail if the socket is not connected.
///
/// \param socket TCP socket object
/// \param packet Packet to fill with the received data
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfTcpSocket_receivePacket(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_receivePacket';

////////////////////////////////////////////////////////////
/// \brief Create a new UDP socket
///
/// \return A new sfUdpSocket object
///
////////////////////////////////////////////////////////////
function sfUdpSocket_create(): PsfUdpSocket; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_create';

////////////////////////////////////////////////////////////
/// \brief Destroy a UDP socket
///
/// \param socket UDP socket to destroy
///
////////////////////////////////////////////////////////////
procedure sfUdpSocket_destroy(socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_destroy';

////////////////////////////////////////////////////////////
/// \brief Set the blocking state of a UDP listener
///
/// In blocking mode, calls will not return until they have
/// completed their task. For example, a call to
/// sfUDPSocket_receive in blocking mode won't return until
/// new data was actually received.
/// In non-blocking mode, calls will always return immediately,
/// using the return code to signal whether there was data
/// available or not.
/// By default, all sockets are blocking.
///
/// \param socket   UDP socket object
/// \param blocking sfTrue to set the socket as blocking, sfFalse for non-blocking
///
////////////////////////////////////////////////////////////
procedure sfUdpSocket_setBlocking(socket: PsfUdpSocket; blocking: sfBool); cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_setBlocking';

////////////////////////////////////////////////////////////
/// \brief Tell whether a UDP socket is in blocking or non-blocking mode
///
/// \param socket UDP socket object
///
/// \return sfTrue if the socket is blocking, sfFalse otherwise
///
////////////////////////////////////////////////////////////
function sfUdpSocket_isBlocking(const socket: PsfUdpSocket): sfBool; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_isBlocking';

////////////////////////////////////////////////////////////
/// \brief Get the port to which a UDP socket is bound locally
///
/// If the socket is not bound to a port, this function
/// returns 0.
///
/// \param socket UDP socket object
///
/// \return Port to which the socket is bound
///
////////////////////////////////////////////////////////////
function sfUdpSocket_getLocalPort(const socket: PsfUdpSocket): Word; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_getLocalPort';

////////////////////////////////////////////////////////////
/// \brief Bind a UDP socket to a specific port
///
/// Binding the socket to a port is necessary for being
/// able to receive data on that port.
/// You can use the special value 0 to tell the
/// system to automatically pick an available port, and then
/// call sfUdpSocket_getLocalPort to retrieve the chosen port.
///
/// If there is no specific address to listen to, pass sfIpAddress_Any
///
/// \param socket  UDP socket object
/// \param port    Port to bind the socket to
/// \param address Address of the interface to bind to
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfUdpSocket_bind(socket: PsfUdpSocket; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_bind';

////////////////////////////////////////////////////////////
/// \brief Unbind a UDP socket from the local port to which it is bound
///
/// The port that the socket was previously using is immediately
/// available after this function is called. If the
/// socket is not bound to a port, this function has no effect.
///
/// \param socket UDP socket object
///
////////////////////////////////////////////////////////////
procedure sfUdpSocket_unbind(socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_unbind';

////////////////////////////////////////////////////////////
/// \brief Send raw data to a remote peer with a UDP socket
///
/// Make sure that \a size is not greater than
/// sfUdpSocket_maxDatagramSize(), otherwise this function will
/// fail and no data will be sent.
///
/// \param socket        UDP socket object
/// \param data          Pointer to the sequence of bytes to send
/// \param size          Number of bytes to send
/// \param remoteAddress Address of the receiver
/// \param remotePort    Port of the receiver to send the data to
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfUdpSocket_send(socket: PsfUdpSocket; const data: Pointer; size: NativeUInt; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_send';

////////////////////////////////////////////////////////////
/// \brief Receive raw data from a remote peer with a UDP socket
///
/// In blocking mode, this function will wait until some
/// bytes are actually received.
/// Be careful to use a buffer which is large enough for
/// the data that you intend to receive, if it is too small
/// then an error will be returned and *all* the data will
/// be lost.
///
/// \param socket        UDP socket object
/// \param data          Pointer to the array to fill with the received bytes
/// \param size          Maximum number of bytes that can be received
/// \param received      This variable is filled with the actual number of bytes received
/// \param remoteAddress Address of the peer that sent the data
/// \param remotePort    Port of the peer that sent the data
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfUdpSocket_receive(socket: PsfUdpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_receive';

////////////////////////////////////////////////////////////
/// \brief Send a formatted packet of data to a remote peer with a UDP socket
///
/// Make sure that the packet size is not greater than
/// sfUdpSocket_maxDatagramSize(), otherwise this function will
/// fail and no data will be sent.
///
/// \param socket        UDP socket object
/// \param packet        Packet to send
/// \param remoteAddress Address of the receiver
/// \param remotePort    Port of the receiver to send the data to
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfUdpSocket_sendPacket(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_sendPacket';

////////////////////////////////////////////////////////////
/// \brief Receive a formatted packet of data from a remote peer with a UDP socket
///
/// In blocking mode, this function will wait until the whole packet
/// has been received.
///
/// \param packet        Packet to fill with the received data
/// \param remoteAddress Address of the peer that sent the data
/// \param remotePort    Port of the peer that sent the data
///
/// \return Status code
///
////////////////////////////////////////////////////////////
function sfUdpSocket_receivePacket(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_receivePacket';

////////////////////////////////////////////////////////////
/// \brief Return the maximum number of bytes that can be
///        sent in a single UDP datagram
///
/// \return The maximum size of a UDP datagram (message)
///
////////////////////////////////////////////////////////////
function sfUdpSocket_maxDatagramSize(): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_maxDatagramSize';

function plm_create_with_filename(const filename: PUTF8Char): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_filename';

function plm_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_file';

function plm_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_memory';

function plm_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_buffer';

procedure plm_destroy(self: Pplm_t); cdecl;
  external PSFML_DLL name _PU + 'plm_destroy';

function plm_has_headers(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_has_headers';

function plm_get_video_enabled(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_video_enabled';

procedure plm_set_video_enabled(self: Pplm_t; enabled: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_video_enabled';

function plm_get_num_video_streams(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_num_video_streams';

function plm_get_width(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_width';

function plm_get_height(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_height';

function plm_get_framerate(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_framerate';

function plm_get_audio_enabled(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_audio_enabled';

procedure plm_set_audio_enabled(self: Pplm_t; enabled: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_enabled';

function plm_get_num_audio_streams(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_num_audio_streams';

procedure plm_set_audio_stream(self: Pplm_t; stream_index: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_stream';

function plm_get_samplerate(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_samplerate';

function plm_get_audio_lead_time(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_audio_lead_time';

procedure plm_set_audio_lead_time(self: Pplm_t; lead_time: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_lead_time';

function plm_get_time(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_time';

function plm_get_duration(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_duration';

procedure plm_rewind(self: Pplm_t); cdecl;
  external PSFML_DLL name _PU + 'plm_rewind';

function plm_get_loop(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_loop';

procedure plm_set_loop(self: Pplm_t; loop: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_loop';

function plm_has_ended(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_has_ended';

procedure plm_set_video_decode_callback(self: Pplm_t; fp: plm_video_decode_callback; user: Pointer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_video_decode_callback';

procedure plm_set_audio_decode_callback(self: Pplm_t; fp: plm_audio_decode_callback; user: Pointer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_decode_callback';

procedure plm_decode(self: Pplm_t; seconds: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_decode';

function plm_decode_video(self: Pplm_t): Pplm_frame_t; cdecl;
  external PSFML_DLL name _PU + 'plm_decode_video';

function plm_decode_audio(self: Pplm_t): Pplm_samples_t; cdecl;
  external PSFML_DLL name _PU + 'plm_decode_audio';

function plm_seek(self: Pplm_t; time: Double; seek_exact: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_seek';

function plm_seek_frame(self: Pplm_t; time: Double; seek_exact: Integer): Pplm_frame_t; cdecl;
  external PSFML_DLL name _PU + 'plm_seek_frame';

function plm_buffer_create_with_filename(const filename: PUTF8Char): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_filename';

function plm_buffer_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_file';

function plm_buffer_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_memory';

function plm_buffer_create_with_capacity(capacity: NativeUInt): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_capacity';

function plm_buffer_create_for_appending(initial_capacity: NativeUInt): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_for_appending';

procedure plm_buffer_destroy(self: Pplm_buffer_t); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_destroy';

function plm_buffer_write(self: Pplm_buffer_t; bytes: PUInt8; length: NativeUInt): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_write';

procedure plm_buffer_signal_end(self: Pplm_buffer_t); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_signal_end';

procedure plm_buffer_set_load_callback(self: Pplm_buffer_t; fp: plm_buffer_load_callback; user: Pointer); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_set_load_callback';

procedure plm_buffer_rewind(self: Pplm_buffer_t); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_rewind';

function plm_buffer_get_size(self: Pplm_buffer_t): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_get_size';

function plm_buffer_get_remaining(self: Pplm_buffer_t): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_get_remaining';

function plm_buffer_has_ended(self: Pplm_buffer_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_has_ended';

function plm_demux_create(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_demux_t; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_create';

procedure plm_demux_destroy(self: Pplm_demux_t); cdecl;
  external PSFML_DLL name _PU + 'plm_demux_destroy';

function plm_demux_has_headers(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_has_headers';

function plm_demux_get_num_video_streams(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_num_video_streams';

function plm_demux_get_num_audio_streams(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_num_audio_streams';

procedure plm_demux_rewind(self: Pplm_demux_t); cdecl;
  external PSFML_DLL name _PU + 'plm_demux_rewind';

function plm_demux_has_ended(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_has_ended';

function plm_demux_seek(self: Pplm_demux_t; time: Double; &type: Integer; force_intra: Integer): Pplm_packet_t; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_seek';

function plm_demux_get_start_time(self: Pplm_demux_t; &type: Integer): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_start_time';

function plm_demux_get_duration(self: Pplm_demux_t; &type: Integer): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_duration';

function plm_demux_decode(self: Pplm_demux_t): Pplm_packet_t; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_decode';

function plm_video_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_video_t; cdecl;
  external PSFML_DLL name _PU + 'plm_video_create_with_buffer';

procedure plm_video_destroy(self: Pplm_video_t); cdecl;
  external PSFML_DLL name _PU + 'plm_video_destroy';

function plm_video_has_header(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_has_header';

function plm_video_get_framerate(self: Pplm_video_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_framerate';

function plm_video_get_width(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_width';

function plm_video_get_height(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_height';

procedure plm_video_set_no_delay(self: Pplm_video_t; no_delay: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_video_set_no_delay';

function plm_video_get_time(self: Pplm_video_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_time';

procedure plm_video_set_time(self: Pplm_video_t; time: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_video_set_time';

procedure plm_video_rewind(self: Pplm_video_t); cdecl;
  external PSFML_DLL name _PU + 'plm_video_rewind';

function plm_video_has_ended(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_has_ended';

function plm_video_decode(self: Pplm_video_t): Pplm_frame_t; cdecl;
  external PSFML_DLL name _PU + 'plm_video_decode';

procedure plm_frame_to_rgb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_rgb';

procedure plm_frame_to_bgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_bgr';

procedure plm_frame_to_rgba(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_rgba';

procedure plm_frame_to_bgra(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_bgra';

procedure plm_frame_to_argb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_argb';

procedure plm_frame_to_abgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_abgr';

function plm_audio_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_audio_t; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_create_with_buffer';

procedure plm_audio_destroy(self: Pplm_audio_t); cdecl;
  external PSFML_DLL name _PU + 'plm_audio_destroy';

function plm_audio_has_header(self: Pplm_audio_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_has_header';

function plm_audio_get_samplerate(self: Pplm_audio_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_get_samplerate';

function plm_audio_get_time(self: Pplm_audio_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_get_time';

procedure plm_audio_set_time(self: Pplm_audio_t; time: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_audio_set_time';

procedure plm_audio_rewind(self: Pplm_audio_t); cdecl;
  external PSFML_DLL name _PU + 'plm_audio_rewind';

function plm_audio_has_ended(self: Pplm_audio_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_has_ended';

function plm_audio_decode(self: Pplm_audio_t): Pplm_samples_t; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_decode';

function crc32(crc: uLong; const buf: PBytef; len: uInt): uLong; cdecl;
  external PSFML_DLL name _PU + 'crc32';

function unzOpen64(const path: Pointer): unzFile; cdecl;
  external PSFML_DLL name _PU + 'unzOpen64';

function unzLocateFile(&file: unzFile; const szFileName: PUTF8Char; iCaseSensitivity: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzLocateFile';

function unzClose(&file: unzFile): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzClose';

function unzOpenCurrentFilePassword(&file: unzFile; const password: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzOpenCurrentFilePassword';

function unzGetCurrentFileInfo64(&file: unzFile; pfile_info: Punz_file_info64; szFileName: PUTF8Char; fileNameBufferSize: uLong; extraField: Pointer; extraFieldBufferSize: uLong; szComment: PUTF8Char; commentBufferSize: uLong): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzGetCurrentFileInfo64';

function unzReadCurrentFile(&file: unzFile; buf: voidp; len: Cardinal): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzReadCurrentFile';

function unzCloseCurrentFile(&file: unzFile): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzCloseCurrentFile';

function unztell64(&file: unzFile): UInt64; cdecl;
  external PSFML_DLL name _PU + 'unztell64';

function zipOpen64(const pathname: Pointer; append: Integer): zipFile; cdecl;
  external PSFML_DLL name _PU + 'zipOpen64';

function zipOpenNewFileInZip3_64(&file: zipFile; const filename: PUTF8Char; const zipfi: Pzip_fileinfo; const extrafield_local: Pointer; size_extrafield_local: uInt; const extrafield_global: Pointer; size_extrafield_global: uInt; const comment: PUTF8Char; method: Integer; level: Integer; raw: Integer; windowBits: Integer; memLevel: Integer; strategy: Integer; const password: PUTF8Char; crcForCrypting: uLong; zip64: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipOpenNewFileInZip3_64';

function zipWriteInFileInZip(&file: zipFile; const buf: Pointer; len: Cardinal): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipWriteInFileInZip';

function zipCloseFileInZip(&file: zipFile): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipCloseFileInZip';

function zipClose(&file: zipFile; const global_comment: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipClose';

function ImVec2_ImVec2_Nil(): PImVec2; cdecl;
  external PSFML_DLL name _PU + 'ImVec2_ImVec2_Nil';

procedure ImVec2_destroy(self: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImVec2_destroy';

function ImVec2_ImVec2_Float(_x: Single; _y: Single): PImVec2; cdecl;
  external PSFML_DLL name _PU + 'ImVec2_ImVec2_Float';

function ImVec4_ImVec4_Nil(): PImVec4; cdecl;
  external PSFML_DLL name _PU + 'ImVec4_ImVec4_Nil';

procedure ImVec4_destroy(self: PImVec4); cdecl;
  external PSFML_DLL name _PU + 'ImVec4_destroy';

function ImVec4_ImVec4_Float(_x: Single; _y: Single; _z: Single; _w: Single): PImVec4; cdecl;
  external PSFML_DLL name _PU + 'ImVec4_ImVec4_Float';

function igCreateContext(shared_font_atlas: PImFontAtlas): PImGuiContext; cdecl;
  external PSFML_DLL name _PU + 'igCreateContext';

procedure igDestroyContext(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDestroyContext';

function igGetCurrentContext(): PImGuiContext; cdecl;
  external PSFML_DLL name _PU + 'igGetCurrentContext';

procedure igSetCurrentContext(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igSetCurrentContext';

function igGetIO(): PImGuiIO; cdecl;
  external PSFML_DLL name _PU + 'igGetIO';

function igGetStyle(): PImGuiStyle; cdecl;
  external PSFML_DLL name _PU + 'igGetStyle';

procedure igNewFrame(); cdecl;
  external PSFML_DLL name _PU + 'igNewFrame';

procedure igEndFrame(); cdecl;
  external PSFML_DLL name _PU + 'igEndFrame';

procedure igRender(); cdecl;
  external PSFML_DLL name _PU + 'igRender';

function igGetDrawData(): PImDrawData; cdecl;
  external PSFML_DLL name _PU + 'igGetDrawData';

procedure igShowDemoWindow(p_open: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igShowDemoWindow';

procedure igShowMetricsWindow(p_open: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igShowMetricsWindow';

procedure igShowDebugLogWindow(p_open: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igShowDebugLogWindow';

procedure igShowIDStackToolWindow(p_open: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igShowIDStackToolWindow';

procedure igShowAboutWindow(p_open: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igShowAboutWindow';

procedure igShowStyleEditor(ref: PImGuiStyle); cdecl;
  external PSFML_DLL name _PU + 'igShowStyleEditor';

function igShowStyleSelector(const &label: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igShowStyleSelector';

procedure igShowFontSelector(const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igShowFontSelector';

procedure igShowUserGuide(); cdecl;
  external PSFML_DLL name _PU + 'igShowUserGuide';

function igGetVersion(): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igGetVersion';

procedure igStyleColorsDark(dst: PImGuiStyle); cdecl;
  external PSFML_DLL name _PU + 'igStyleColorsDark';

procedure igStyleColorsLight(dst: PImGuiStyle); cdecl;
  external PSFML_DLL name _PU + 'igStyleColorsLight';

procedure igStyleColorsClassic(dst: PImGuiStyle); cdecl;
  external PSFML_DLL name _PU + 'igStyleColorsClassic';

function igBegin(const name: PUTF8Char; p_open: PBoolean; flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBegin';

procedure igEnd(); cdecl;
  external PSFML_DLL name _PU + 'igEnd';

function igBeginChild_Str(const str_id: PUTF8Char; size: ImVec2; child_flags: ImGuiChildFlags; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginChild_Str';

function igBeginChild_ID(id: ImGuiID; size: ImVec2; child_flags: ImGuiChildFlags; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginChild_ID';

procedure igEndChild(); cdecl;
  external PSFML_DLL name _PU + 'igEndChild';

function igIsWindowAppearing(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowAppearing';

function igIsWindowCollapsed(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowCollapsed';

function igIsWindowFocused(flags: ImGuiFocusedFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowFocused';

function igIsWindowHovered(flags: ImGuiHoveredFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowHovered';

function igGetWindowDrawList(): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowDrawList';

function igGetWindowDpiScale(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowDpiScale';

procedure igGetWindowPos(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetWindowPos';

procedure igGetWindowSize(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetWindowSize';

function igGetWindowWidth(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowWidth';

function igGetWindowHeight(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowHeight';

function igGetWindowViewport(): PImGuiViewport; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowViewport';

procedure igSetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowPos';

procedure igSetNextWindowSize(size: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowSize';

procedure igSetNextWindowSizeConstraints(size_min: ImVec2; size_max: ImVec2; custom_callback: ImGuiSizeCallback; custom_callback_data: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowSizeConstraints';

procedure igSetNextWindowContentSize(size: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowContentSize';

procedure igSetNextWindowCollapsed(collapsed: Boolean; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowCollapsed';

procedure igSetNextWindowFocus(); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowFocus';

procedure igSetNextWindowScroll(scroll: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowScroll';

procedure igSetNextWindowBgAlpha(alpha: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowBgAlpha';

procedure igSetNextWindowViewport(viewport_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowViewport';

procedure igSetWindowPos_Vec2(pos: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowPos_Vec2';

procedure igSetWindowSize_Vec2(size: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowSize_Vec2';

procedure igSetWindowCollapsed_Bool(collapsed: Boolean; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowCollapsed_Bool';

procedure igSetWindowFocus_Nil(); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowFocus_Nil';

procedure igSetWindowFontScale(scale: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowFontScale';

procedure igSetWindowPos_Str(const name: PUTF8Char; pos: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowPos_Str';

procedure igSetWindowSize_Str(const name: PUTF8Char; size: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowSize_Str';

procedure igSetWindowCollapsed_Str(const name: PUTF8Char; collapsed: Boolean; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowCollapsed_Str';

procedure igSetWindowFocus_Str(const name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowFocus_Str';

procedure igGetContentRegionAvail(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetContentRegionAvail';

procedure igGetContentRegionMax(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetContentRegionMax';

procedure igGetWindowContentRegionMin(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetWindowContentRegionMin';

procedure igGetWindowContentRegionMax(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetWindowContentRegionMax';

function igGetScrollX(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetScrollX';

function igGetScrollY(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetScrollY';

procedure igSetScrollX_Float(scroll_x: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollX_Float';

procedure igSetScrollY_Float(scroll_y: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollY_Float';

function igGetScrollMaxX(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetScrollMaxX';

function igGetScrollMaxY(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetScrollMaxY';

procedure igSetScrollHereX(center_x_ratio: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollHereX';

procedure igSetScrollHereY(center_y_ratio: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollHereY';

procedure igSetScrollFromPosX_Float(local_x: Single; center_x_ratio: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollFromPosX_Float';

procedure igSetScrollFromPosY_Float(local_y: Single; center_y_ratio: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollFromPosY_Float';

procedure igPushFont(font: PImFont); cdecl;
  external PSFML_DLL name _PU + 'igPushFont';

procedure igPopFont(); cdecl;
  external PSFML_DLL name _PU + 'igPopFont';

procedure igPushStyleColor_U32(idx: ImGuiCol; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igPushStyleColor_U32';

procedure igPushStyleColor_Vec4(idx: ImGuiCol; col: ImVec4); cdecl;
  external PSFML_DLL name _PU + 'igPushStyleColor_Vec4';

procedure igPopStyleColor(count: Integer); cdecl;
  external PSFML_DLL name _PU + 'igPopStyleColor';

procedure igPushStyleVar_Float(idx: ImGuiStyleVar; val: Single); cdecl;
  external PSFML_DLL name _PU + 'igPushStyleVar_Float';

procedure igPushStyleVar_Vec2(idx: ImGuiStyleVar; val: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igPushStyleVar_Vec2';

procedure igPopStyleVar(count: Integer); cdecl;
  external PSFML_DLL name _PU + 'igPopStyleVar';

procedure igPushTabStop(tab_stop: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igPushTabStop';

procedure igPopTabStop(); cdecl;
  external PSFML_DLL name _PU + 'igPopTabStop';

procedure igPushButtonRepeat(&repeat: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igPushButtonRepeat';

procedure igPopButtonRepeat(); cdecl;
  external PSFML_DLL name _PU + 'igPopButtonRepeat';

procedure igPushItemWidth(item_width: Single); cdecl;
  external PSFML_DLL name _PU + 'igPushItemWidth';

procedure igPopItemWidth(); cdecl;
  external PSFML_DLL name _PU + 'igPopItemWidth';

procedure igSetNextItemWidth(item_width: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetNextItemWidth';

function igCalcItemWidth(): Single; cdecl;
  external PSFML_DLL name _PU + 'igCalcItemWidth';

procedure igPushTextWrapPos(wrap_local_pos_x: Single); cdecl;
  external PSFML_DLL name _PU + 'igPushTextWrapPos';

procedure igPopTextWrapPos(); cdecl;
  external PSFML_DLL name _PU + 'igPopTextWrapPos';

function igGetFont(): PImFont; cdecl;
  external PSFML_DLL name _PU + 'igGetFont';

function igGetFontSize(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetFontSize';

procedure igGetFontTexUvWhitePixel(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetFontTexUvWhitePixel';

function igGetColorU32_Col(idx: ImGuiCol; alpha_mul: Single): ImU32; cdecl;
  external PSFML_DLL name _PU + 'igGetColorU32_Col';

function igGetColorU32_Vec4(col: ImVec4): ImU32; cdecl;
  external PSFML_DLL name _PU + 'igGetColorU32_Vec4';

function igGetColorU32_U32(col: ImU32): ImU32; cdecl;
  external PSFML_DLL name _PU + 'igGetColorU32_U32';

function igGetStyleColorVec4(idx: ImGuiCol): PImVec4; cdecl;
  external PSFML_DLL name _PU + 'igGetStyleColorVec4';

procedure igGetCursorScreenPos(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetCursorScreenPos';

procedure igSetCursorScreenPos(pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igSetCursorScreenPos';

procedure igGetCursorPos(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetCursorPos';

function igGetCursorPosX(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetCursorPosX';

function igGetCursorPosY(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetCursorPosY';

procedure igSetCursorPos(local_pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igSetCursorPos';

procedure igSetCursorPosX(local_x: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetCursorPosX';

procedure igSetCursorPosY(local_y: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetCursorPosY';

procedure igGetCursorStartPos(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetCursorStartPos';

procedure igSeparator(); cdecl;
  external PSFML_DLL name _PU + 'igSeparator';

procedure igSameLine(offset_from_start_x: Single; spacing: Single); cdecl;
  external PSFML_DLL name _PU + 'igSameLine';

procedure igNewLine(); cdecl;
  external PSFML_DLL name _PU + 'igNewLine';

procedure igSpacing(); cdecl;
  external PSFML_DLL name _PU + 'igSpacing';

procedure igDummy(size: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igDummy';

procedure igIndent(indent_w: Single); cdecl;
  external PSFML_DLL name _PU + 'igIndent';

procedure igUnindent(indent_w: Single); cdecl;
  external PSFML_DLL name _PU + 'igUnindent';

procedure igBeginGroup(); cdecl;
  external PSFML_DLL name _PU + 'igBeginGroup';

procedure igEndGroup(); cdecl;
  external PSFML_DLL name _PU + 'igEndGroup';

procedure igAlignTextToFramePadding(); cdecl;
  external PSFML_DLL name _PU + 'igAlignTextToFramePadding';

function igGetTextLineHeight(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetTextLineHeight';

function igGetTextLineHeightWithSpacing(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetTextLineHeightWithSpacing';

function igGetFrameHeight(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetFrameHeight';

function igGetFrameHeightWithSpacing(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetFrameHeightWithSpacing';

procedure igPushID_Str(const str_id: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igPushID_Str';

procedure igPushID_StrStr(const str_id_begin: PUTF8Char; const str_id_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igPushID_StrStr';

procedure igPushID_Ptr(const ptr_id: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igPushID_Ptr';

procedure igPushID_Int(int_id: Integer); cdecl;
  external PSFML_DLL name _PU + 'igPushID_Int';

procedure igPopID(); cdecl;
  external PSFML_DLL name _PU + 'igPopID';

function igGetID_Str(const str_id: PUTF8Char): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetID_Str';

function igGetID_StrStr(const str_id_begin: PUTF8Char; const str_id_end: PUTF8Char): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetID_StrStr';

function igGetID_Ptr(const ptr_id: Pointer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetID_Ptr';

procedure igTextUnformatted(const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igTextUnformatted';

procedure igText(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igText';

procedure igTextV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igTextV';

procedure igTextColored(col: ImVec4; const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igTextColored';

procedure igTextColoredV(col: ImVec4; const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igTextColoredV';

procedure igTextDisabled(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igTextDisabled';

procedure igTextDisabledV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igTextDisabledV';

procedure igTextWrapped(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igTextWrapped';

procedure igTextWrappedV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igTextWrappedV';

procedure igLabelText(const &label: PUTF8Char; const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igLabelText';

procedure igLabelTextV(const &label: PUTF8Char; const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igLabelTextV';

procedure igBulletText(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igBulletText';

procedure igBulletTextV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igBulletTextV';

procedure igSeparatorText(const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igSeparatorText';

function igButton(const &label: PUTF8Char; size: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igButton';

function igSmallButton(const &label: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSmallButton';

function igInvisibleButton(const str_id: PUTF8Char; size: ImVec2; flags: ImGuiButtonFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInvisibleButton';

function igArrowButton(const str_id: PUTF8Char; dir: ImGuiDir): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igArrowButton';

function igCheckbox(const &label: PUTF8Char; v: PBoolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCheckbox';

function igCheckboxFlags_IntPtr(const &label: PUTF8Char; flags: PInteger; flags_value: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCheckboxFlags_IntPtr';

function igCheckboxFlags_UintPtr(const &label: PUTF8Char; flags: PCardinal; flags_value: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCheckboxFlags_UintPtr';

function igRadioButton_Bool(const &label: PUTF8Char; active: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igRadioButton_Bool';

function igRadioButton_IntPtr(const &label: PUTF8Char; v: PInteger; v_button: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igRadioButton_IntPtr';

procedure igProgressBar(fraction: Single; size_arg: ImVec2; const overlay: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igProgressBar';

procedure igBullet(); cdecl;
  external PSFML_DLL name _PU + 'igBullet';

procedure igImage(user_texture_id: ImTextureID; image_size: ImVec2; uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4); cdecl;
  external PSFML_DLL name _PU + 'igImage';

function igImageButton(const str_id: PUTF8Char; user_texture_id: ImTextureID; image_size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImageButton';

function igBeginCombo(const &label: PUTF8Char; const preview_value: PUTF8Char; flags: ImGuiComboFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginCombo';

procedure igEndCombo(); cdecl;
  external PSFML_DLL name _PU + 'igEndCombo';

function igCombo_Str_arr(const &label: PUTF8Char; current_item: PInteger; items: PPUTF8Char; items_count: Integer; popup_max_height_in_items: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCombo_Str_arr';

function igCombo_Str(const &label: PUTF8Char; current_item: PInteger; const items_separated_by_zeros: PUTF8Char; popup_max_height_in_items: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCombo_Str';

type
  igCombo_FnStrPtr_getter = function(user_data: Pointer; idx: Integer): PUTF8Char; cdecl;

function igCombo_FnStrPtr(const &label: PUTF8Char; current_item: PInteger; getter: igCombo_FnStrPtr_getter; user_data: Pointer; items_count: Integer; popup_max_height_in_items: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCombo_FnStrPtr';

function igDragFloat(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragFloat';

function igDragFloat2(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragFloat2';

function igDragFloat3(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragFloat3';

function igDragFloat4(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragFloat4';

function igDragFloatRange2(const &label: PUTF8Char; v_current_min: PSingle; v_current_max: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; const format_max: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragFloatRange2';

function igDragInt(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragInt';

function igDragInt2(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragInt2';

function igDragInt3(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragInt3';

function igDragInt4(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragInt4';

function igDragIntRange2(const &label: PUTF8Char; v_current_min: PInteger; v_current_max: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; const format_max: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragIntRange2';

function igDragScalar(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; v_speed: Single; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragScalar';

function igDragScalarN(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; components: Integer; v_speed: Single; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragScalarN';

function igSliderFloat(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderFloat';

function igSliderFloat2(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderFloat2';

function igSliderFloat3(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderFloat3';

function igSliderFloat4(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderFloat4';

function igSliderAngle(const &label: PUTF8Char; v_rad: PSingle; v_degrees_min: Single; v_degrees_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderAngle';

function igSliderInt(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderInt';

function igSliderInt2(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderInt2';

function igSliderInt3(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderInt3';

function igSliderInt4(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderInt4';

function igSliderScalar(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderScalar';

function igSliderScalarN(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; components: Integer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderScalarN';

function igVSliderFloat(const &label: PUTF8Char; size: ImVec2; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igVSliderFloat';

function igVSliderInt(const &label: PUTF8Char; size: ImVec2; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igVSliderInt';

function igVSliderScalar(const &label: PUTF8Char; size: ImVec2; data_type: ImGuiDataType; p_data: Pointer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igVSliderScalar';

function igInputText(const &label: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputText';

function igInputTextMultiline(const &label: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt; size: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputTextMultiline';

function igInputTextWithHint(const &label: PUTF8Char; const hint: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputTextWithHint';

function igInputFloat(const &label: PUTF8Char; v: PSingle; step: Single; step_fast: Single; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputFloat';

function igInputFloat2(const &label: PUTF8Char; v: PSingle; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputFloat2';

function igInputFloat3(const &label: PUTF8Char; v: PSingle; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputFloat3';

function igInputFloat4(const &label: PUTF8Char; v: PSingle; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputFloat4';

function igInputInt(const &label: PUTF8Char; v: PInteger; step: Integer; step_fast: Integer; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputInt';

function igInputInt2(const &label: PUTF8Char; v: PInteger; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputInt2';

function igInputInt3(const &label: PUTF8Char; v: PInteger; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputInt3';

function igInputInt4(const &label: PUTF8Char; v: PInteger; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputInt4';

function igInputDouble(const &label: PUTF8Char; v: PDouble; step: Double; step_fast: Double; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputDouble';

function igInputScalar(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const p_step: Pointer; const p_step_fast: Pointer; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputScalar';

function igInputScalarN(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; components: Integer; const p_step: Pointer; const p_step_fast: Pointer; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputScalarN';

function igColorEdit3(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igColorEdit3';

function igColorEdit4(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igColorEdit4';

function igColorPicker3(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igColorPicker3';

function igColorPicker4(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags; const ref_col: PSingle): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igColorPicker4';

function igColorButton(const desc_id: PUTF8Char; col: ImVec4; flags: ImGuiColorEditFlags; size: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igColorButton';

procedure igSetColorEditOptions(flags: ImGuiColorEditFlags); cdecl;
  external PSFML_DLL name _PU + 'igSetColorEditOptions';

function igTreeNode_Str(const &label: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNode_Str';

function igTreeNode_StrStr(const str_id: PUTF8Char; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external PSFML_DLL name _PU + 'igTreeNode_StrStr';

function igTreeNode_Ptr(const ptr_id: Pointer; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external PSFML_DLL name _PU + 'igTreeNode_Ptr';

function igTreeNodeV_Str(const str_id: PUTF8Char; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeV_Str';

function igTreeNodeV_Ptr(const ptr_id: Pointer; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeV_Ptr';

function igTreeNodeEx_Str(const &label: PUTF8Char; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeEx_Str';

function igTreeNodeEx_StrStr(const str_id: PUTF8Char; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeEx_StrStr';

function igTreeNodeEx_Ptr(const ptr_id: Pointer; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeEx_Ptr';

function igTreeNodeExV_Str(const str_id: PUTF8Char; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeExV_Str';

function igTreeNodeExV_Ptr(const ptr_id: Pointer; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeExV_Ptr';

procedure igTreePush_Str(const str_id: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igTreePush_Str';

procedure igTreePush_Ptr(const ptr_id: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igTreePush_Ptr';

procedure igTreePop(); cdecl;
  external PSFML_DLL name _PU + 'igTreePop';

function igGetTreeNodeToLabelSpacing(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetTreeNodeToLabelSpacing';

function igCollapsingHeader_TreeNodeFlags(const &label: PUTF8Char; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCollapsingHeader_TreeNodeFlags';

function igCollapsingHeader_BoolPtr(const &label: PUTF8Char; p_visible: PBoolean; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCollapsingHeader_BoolPtr';

procedure igSetNextItemOpen(is_open: Boolean; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetNextItemOpen';

function igSelectable_Bool(const &label: PUTF8Char; selected: Boolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSelectable_Bool';

function igSelectable_BoolPtr(const &label: PUTF8Char; p_selected: PBoolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSelectable_BoolPtr';

function igBeginListBox(const &label: PUTF8Char; size: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginListBox';

procedure igEndListBox(); cdecl;
  external PSFML_DLL name _PU + 'igEndListBox';

function igListBox_Str_arr(const &label: PUTF8Char; current_item: PInteger; items: PPUTF8Char; items_count: Integer; height_in_items: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igListBox_Str_arr';

type
  igListBox_FnStrPtr_getter = function(user_data: Pointer; idx: Integer): PUTF8Char; cdecl;

function igListBox_FnStrPtr(const &label: PUTF8Char; current_item: PInteger; getter: igListBox_FnStrPtr_getter; user_data: Pointer; items_count: Integer; height_in_items: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igListBox_FnStrPtr';

procedure igPlotLines_FloatPtr(const &label: PUTF8Char; const values: PSingle; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'igPlotLines_FloatPtr';

type
  igPlotLines_FnFloatPtr_values_getter = function(data: Pointer; idx: Integer): Single; cdecl;

procedure igPlotLines_FnFloatPtr(const &label: PUTF8Char; values_getter: igPlotLines_FnFloatPtr_values_getter; data: Pointer; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igPlotLines_FnFloatPtr';

procedure igPlotHistogram_FloatPtr(const &label: PUTF8Char; const values: PSingle; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'igPlotHistogram_FloatPtr';

type
  igPlotHistogram_FnFloatPtr_values_getter = function(data: Pointer; idx: Integer): Single; cdecl;

procedure igPlotHistogram_FnFloatPtr(const &label: PUTF8Char; values_getter: igPlotHistogram_FnFloatPtr_values_getter; data: Pointer; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igPlotHistogram_FnFloatPtr';

procedure igValue_Bool(const prefix: PUTF8Char; b: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igValue_Bool';

procedure igValue_Int(const prefix: PUTF8Char; v: Integer); cdecl;
  external PSFML_DLL name _PU + 'igValue_Int';

procedure igValue_Uint(const prefix: PUTF8Char; v: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'igValue_Uint';

procedure igValue_Float(const prefix: PUTF8Char; v: Single; const float_format: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igValue_Float';

function igBeginMenuBar(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginMenuBar';

procedure igEndMenuBar(); cdecl;
  external PSFML_DLL name _PU + 'igEndMenuBar';

function igBeginMainMenuBar(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginMainMenuBar';

procedure igEndMainMenuBar(); cdecl;
  external PSFML_DLL name _PU + 'igEndMainMenuBar';

function igBeginMenu(const &label: PUTF8Char; enabled: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginMenu';

procedure igEndMenu(); cdecl;
  external PSFML_DLL name _PU + 'igEndMenu';

function igMenuItem_Bool(const &label: PUTF8Char; const shortcut: PUTF8Char; selected: Boolean; enabled: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igMenuItem_Bool';

function igMenuItem_BoolPtr(const &label: PUTF8Char; const shortcut: PUTF8Char; p_selected: PBoolean; enabled: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igMenuItem_BoolPtr';

function igBeginTooltip(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTooltip';

procedure igEndTooltip(); cdecl;
  external PSFML_DLL name _PU + 'igEndTooltip';

procedure igSetTooltip(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igSetTooltip';

procedure igSetTooltipV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igSetTooltipV';

function igBeginItemTooltip(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginItemTooltip';

procedure igSetItemTooltip(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igSetItemTooltip';

procedure igSetItemTooltipV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igSetItemTooltipV';

function igBeginPopup(const str_id: PUTF8Char; flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginPopup';

function igBeginPopupModal(const name: PUTF8Char; p_open: PBoolean; flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginPopupModal';

procedure igEndPopup(); cdecl;
  external PSFML_DLL name _PU + 'igEndPopup';

procedure igOpenPopup_Str(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags); cdecl;
  external PSFML_DLL name _PU + 'igOpenPopup_Str';

procedure igOpenPopup_ID(id: ImGuiID; popup_flags: ImGuiPopupFlags); cdecl;
  external PSFML_DLL name _PU + 'igOpenPopup_ID';

procedure igOpenPopupOnItemClick(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags); cdecl;
  external PSFML_DLL name _PU + 'igOpenPopupOnItemClick';

procedure igCloseCurrentPopup(); cdecl;
  external PSFML_DLL name _PU + 'igCloseCurrentPopup';

function igBeginPopupContextItem(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginPopupContextItem';

function igBeginPopupContextWindow(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginPopupContextWindow';

function igBeginPopupContextVoid(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginPopupContextVoid';

function igIsPopupOpen_Str(const str_id: PUTF8Char; flags: ImGuiPopupFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsPopupOpen_Str';

function igBeginTable(const str_id: PUTF8Char; column: Integer; flags: ImGuiTableFlags; outer_size: ImVec2; inner_width: Single): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTable';

procedure igEndTable(); cdecl;
  external PSFML_DLL name _PU + 'igEndTable';

procedure igTableNextRow(row_flags: ImGuiTableRowFlags; min_row_height: Single); cdecl;
  external PSFML_DLL name _PU + 'igTableNextRow';

function igTableNextColumn(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTableNextColumn';

function igTableSetColumnIndex(column_n: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTableSetColumnIndex';

procedure igTableSetupColumn(const &label: PUTF8Char; flags: ImGuiTableColumnFlags; init_width_or_weight: Single; user_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igTableSetupColumn';

procedure igTableSetupScrollFreeze(cols: Integer; rows: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableSetupScrollFreeze';

procedure igTableHeader(const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igTableHeader';

procedure igTableHeadersRow(); cdecl;
  external PSFML_DLL name _PU + 'igTableHeadersRow';

procedure igTableAngledHeadersRow(); cdecl;
  external PSFML_DLL name _PU + 'igTableAngledHeadersRow';

function igTableGetSortSpecs(): PImGuiTableSortSpecs; cdecl;
  external PSFML_DLL name _PU + 'igTableGetSortSpecs';

function igTableGetColumnCount(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnCount';

function igTableGetColumnIndex(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnIndex';

function igTableGetRowIndex(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTableGetRowIndex';

function igTableGetColumnName_Int(column_n: Integer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnName_Int';

function igTableGetColumnFlags(column_n: Integer): ImGuiTableColumnFlags; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnFlags';

procedure igTableSetColumnEnabled(column_n: Integer; v: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igTableSetColumnEnabled';

procedure igTableSetBgColor(target: ImGuiTableBgTarget; color: ImU32; column_n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableSetBgColor';

procedure igColumns(count: Integer; const id: PUTF8Char; border: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igColumns';

procedure igNextColumn(); cdecl;
  external PSFML_DLL name _PU + 'igNextColumn';

function igGetColumnIndex(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnIndex';

function igGetColumnWidth(column_index: Integer): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnWidth';

procedure igSetColumnWidth(column_index: Integer; width: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetColumnWidth';

function igGetColumnOffset(column_index: Integer): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnOffset';

procedure igSetColumnOffset(column_index: Integer; offset_x: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetColumnOffset';

function igGetColumnsCount(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnsCount';

function igBeginTabBar(const str_id: PUTF8Char; flags: ImGuiTabBarFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTabBar';

procedure igEndTabBar(); cdecl;
  external PSFML_DLL name _PU + 'igEndTabBar';

function igBeginTabItem(const &label: PUTF8Char; p_open: PBoolean; flags: ImGuiTabItemFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTabItem';

procedure igEndTabItem(); cdecl;
  external PSFML_DLL name _PU + 'igEndTabItem';

function igTabItemButton(const &label: PUTF8Char; flags: ImGuiTabItemFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTabItemButton';

procedure igSetTabItemClosed(const tab_or_docked_window_label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igSetTabItemClosed';

function igDockSpace(id: ImGuiID; size: ImVec2; flags: ImGuiDockNodeFlags; const window_class: PImGuiWindowClass): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igDockSpace';

function igDockSpaceOverViewport(const viewport: PImGuiViewport; flags: ImGuiDockNodeFlags; const window_class: PImGuiWindowClass): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igDockSpaceOverViewport';

procedure igSetNextWindowDockID(dock_id: ImGuiID; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowDockID';

procedure igSetNextWindowClass(const window_class: PImGuiWindowClass); cdecl;
  external PSFML_DLL name _PU + 'igSetNextWindowClass';

function igGetWindowDockID(): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowDockID';

function igIsWindowDocked(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowDocked';

procedure igLogToTTY(auto_open_depth: Integer); cdecl;
  external PSFML_DLL name _PU + 'igLogToTTY';

procedure igLogToFile(auto_open_depth: Integer; const filename: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igLogToFile';

procedure igLogToClipboard(auto_open_depth: Integer); cdecl;
  external PSFML_DLL name _PU + 'igLogToClipboard';

procedure igLogFinish(); cdecl;
  external PSFML_DLL name _PU + 'igLogFinish';

procedure igLogButtons(); cdecl;
  external PSFML_DLL name _PU + 'igLogButtons';

procedure igLogTextV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igLogTextV';

function igBeginDragDropSource(flags: ImGuiDragDropFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginDragDropSource';

function igSetDragDropPayload(const &type: PUTF8Char; const data: Pointer; sz: NativeUInt; cond: ImGuiCond): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSetDragDropPayload';

procedure igEndDragDropSource(); cdecl;
  external PSFML_DLL name _PU + 'igEndDragDropSource';

function igBeginDragDropTarget(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginDragDropTarget';

function igAcceptDragDropPayload(const &type: PUTF8Char; flags: ImGuiDragDropFlags): PImGuiPayload; cdecl;
  external PSFML_DLL name _PU + 'igAcceptDragDropPayload';

procedure igEndDragDropTarget(); cdecl;
  external PSFML_DLL name _PU + 'igEndDragDropTarget';

function igGetDragDropPayload(): PImGuiPayload; cdecl;
  external PSFML_DLL name _PU + 'igGetDragDropPayload';

procedure igBeginDisabled(disabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igBeginDisabled';

procedure igEndDisabled(); cdecl;
  external PSFML_DLL name _PU + 'igEndDisabled';

procedure igPushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igPushClipRect';

procedure igPopClipRect(); cdecl;
  external PSFML_DLL name _PU + 'igPopClipRect';

procedure igSetItemDefaultFocus(); cdecl;
  external PSFML_DLL name _PU + 'igSetItemDefaultFocus';

procedure igSetKeyboardFocusHere(offset: Integer); cdecl;
  external PSFML_DLL name _PU + 'igSetKeyboardFocusHere';

procedure igSetNextItemAllowOverlap(); cdecl;
  external PSFML_DLL name _PU + 'igSetNextItemAllowOverlap';

function igIsItemHovered(flags: ImGuiHoveredFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemHovered';

function igIsItemActive(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemActive';

function igIsItemFocused(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemFocused';

function igIsItemClicked(mouse_button: ImGuiMouseButton): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemClicked';

function igIsItemVisible(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemVisible';

function igIsItemEdited(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemEdited';

function igIsItemActivated(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemActivated';

function igIsItemDeactivated(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemDeactivated';

function igIsItemDeactivatedAfterEdit(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemDeactivatedAfterEdit';

function igIsItemToggledOpen(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemToggledOpen';

function igIsAnyItemHovered(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsAnyItemHovered';

function igIsAnyItemActive(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsAnyItemActive';

function igIsAnyItemFocused(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsAnyItemFocused';

function igGetItemID(): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetItemID';

procedure igGetItemRectMin(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetItemRectMin';

procedure igGetItemRectMax(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetItemRectMax';

procedure igGetItemRectSize(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetItemRectSize';

function igGetMainViewport(): PImGuiViewport; cdecl;
  external PSFML_DLL name _PU + 'igGetMainViewport';

function igGetBackgroundDrawList_Nil(): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'igGetBackgroundDrawList_Nil';

function igGetForegroundDrawList_Nil(): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'igGetForegroundDrawList_Nil';

function igGetBackgroundDrawList_ViewportPtr(viewport: PImGuiViewport): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'igGetBackgroundDrawList_ViewportPtr';

function igGetForegroundDrawList_ViewportPtr(viewport: PImGuiViewport): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'igGetForegroundDrawList_ViewportPtr';

function igIsRectVisible_Nil(size: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsRectVisible_Nil';

function igIsRectVisible_Vec2(rect_min: ImVec2; rect_max: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsRectVisible_Vec2';

function igGetTime(): Double; cdecl;
  external PSFML_DLL name _PU + 'igGetTime';

function igGetFrameCount(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igGetFrameCount';

function igGetDrawListSharedData(): PImDrawListSharedData; cdecl;
  external PSFML_DLL name _PU + 'igGetDrawListSharedData';

function igGetStyleColorName(idx: ImGuiCol): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igGetStyleColorName';

procedure igSetStateStorage(storage: PImGuiStorage); cdecl;
  external PSFML_DLL name _PU + 'igSetStateStorage';

function igGetStateStorage(): PImGuiStorage; cdecl;
  external PSFML_DLL name _PU + 'igGetStateStorage';

procedure igCalcTextSize(pOut: PImVec2; const text: PUTF8Char; const text_end: PUTF8Char; hide_text_after_double_hash: Boolean; wrap_width: Single); cdecl;
  external PSFML_DLL name _PU + 'igCalcTextSize';

procedure igColorConvertU32ToFloat4(pOut: PImVec4; &in: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igColorConvertU32ToFloat4';

function igColorConvertFloat4ToU32(&in: ImVec4): ImU32; cdecl;
  external PSFML_DLL name _PU + 'igColorConvertFloat4ToU32';

procedure igColorConvertRGBtoHSV(r: Single; g: Single; b: Single; out_h: PSingle; out_s: PSingle; out_v: PSingle); cdecl;
  external PSFML_DLL name _PU + 'igColorConvertRGBtoHSV';

procedure igColorConvertHSVtoRGB(h: Single; s: Single; v: Single; out_r: PSingle; out_g: PSingle; out_b: PSingle); cdecl;
  external PSFML_DLL name _PU + 'igColorConvertHSVtoRGB';

function igIsKeyDown_Nil(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyDown_Nil';

function igIsKeyPressed_Bool(key: ImGuiKey; &repeat: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyPressed_Bool';

function igIsKeyReleased_Nil(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyReleased_Nil';

function igIsKeyChordPressed_Nil(key_chord: ImGuiKeyChord): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyChordPressed_Nil';

function igGetKeyPressedAmount(key: ImGuiKey; repeat_delay: Single; rate: Single): Integer; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyPressedAmount';

function igGetKeyName(key: ImGuiKey): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyName';

procedure igSetNextFrameWantCaptureKeyboard(want_capture_keyboard: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igSetNextFrameWantCaptureKeyboard';

function igIsMouseDown_Nil(button: ImGuiMouseButton): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseDown_Nil';

function igIsMouseClicked_Bool(button: ImGuiMouseButton; &repeat: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseClicked_Bool';

function igIsMouseReleased_Nil(button: ImGuiMouseButton): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseReleased_Nil';

function igIsMouseDoubleClicked_Nil(button: ImGuiMouseButton): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseDoubleClicked_Nil';

function igGetMouseClickedCount(button: ImGuiMouseButton): Integer; cdecl;
  external PSFML_DLL name _PU + 'igGetMouseClickedCount';

function igIsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2; clip: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseHoveringRect';

function igIsMousePosValid(const mouse_pos: PImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMousePosValid';

function igIsAnyMouseDown(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsAnyMouseDown';

procedure igGetMousePos(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetMousePos';

procedure igGetMousePosOnOpeningCurrentPopup(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetMousePosOnOpeningCurrentPopup';

function igIsMouseDragging(button: ImGuiMouseButton; lock_threshold: Single): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseDragging';

procedure igGetMouseDragDelta(pOut: PImVec2; button: ImGuiMouseButton; lock_threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'igGetMouseDragDelta';

procedure igResetMouseDragDelta(button: ImGuiMouseButton); cdecl;
  external PSFML_DLL name _PU + 'igResetMouseDragDelta';

function igGetMouseCursor(): ImGuiMouseCursor; cdecl;
  external PSFML_DLL name _PU + 'igGetMouseCursor';

procedure igSetMouseCursor(cursor_type: ImGuiMouseCursor); cdecl;
  external PSFML_DLL name _PU + 'igSetMouseCursor';

procedure igSetNextFrameWantCaptureMouse(want_capture_mouse: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igSetNextFrameWantCaptureMouse';

function igGetClipboardText(): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igGetClipboardText';

procedure igSetClipboardText(const text: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igSetClipboardText';

procedure igLoadIniSettingsFromDisk(const ini_filename: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igLoadIniSettingsFromDisk';

procedure igLoadIniSettingsFromMemory(const ini_data: PUTF8Char; ini_size: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'igLoadIniSettingsFromMemory';

procedure igSaveIniSettingsToDisk(const ini_filename: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igSaveIniSettingsToDisk';

function igSaveIniSettingsToMemory(out_ini_size: PNativeUInt): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igSaveIniSettingsToMemory';

procedure igDebugTextEncoding(const text: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugTextEncoding';

procedure igDebugFlashStyleColor(idx: ImGuiCol); cdecl;
  external PSFML_DLL name _PU + 'igDebugFlashStyleColor';

function igDebugCheckVersionAndDataLayout(const version_str: PUTF8Char; sz_io: NativeUInt; sz_style: NativeUInt; sz_vec2: NativeUInt; sz_vec4: NativeUInt; sz_drawvert: NativeUInt; sz_drawidx: NativeUInt): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDebugCheckVersionAndDataLayout';

procedure igSetAllocatorFunctions(alloc_func: ImGuiMemAllocFunc; free_func: ImGuiMemFreeFunc; user_data: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igSetAllocatorFunctions';

procedure igGetAllocatorFunctions(p_alloc_func: PImGuiMemAllocFunc; p_free_func: PImGuiMemFreeFunc; p_user_data: PPointer); cdecl;
  external PSFML_DLL name _PU + 'igGetAllocatorFunctions';

function igMemAlloc(size: NativeUInt): Pointer; cdecl;
  external PSFML_DLL name _PU + 'igMemAlloc';

procedure igMemFree(ptr: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igMemFree';

function igGetPlatformIO(): PImGuiPlatformIO; cdecl;
  external PSFML_DLL name _PU + 'igGetPlatformIO';

procedure igUpdatePlatformWindows(); cdecl;
  external PSFML_DLL name _PU + 'igUpdatePlatformWindows';

procedure igRenderPlatformWindowsDefault(platform_render_arg: Pointer; renderer_render_arg: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igRenderPlatformWindowsDefault';

procedure igDestroyPlatformWindows(); cdecl;
  external PSFML_DLL name _PU + 'igDestroyPlatformWindows';

function igFindViewportByID(id: ImGuiID): PImGuiViewport; cdecl;
  external PSFML_DLL name _PU + 'igFindViewportByID';

function igFindViewportByPlatformHandle(platform_handle: Pointer): PImGuiViewport; cdecl;
  external PSFML_DLL name _PU + 'igFindViewportByPlatformHandle';

function ImGuiTableSortSpecs_ImGuiTableSortSpecs(): PImGuiTableSortSpecs; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableSortSpecs_ImGuiTableSortSpecs';

procedure ImGuiTableSortSpecs_destroy(self: PImGuiTableSortSpecs); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableSortSpecs_destroy';

function ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs(): PImGuiTableColumnSortSpecs; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs';

procedure ImGuiTableColumnSortSpecs_destroy(self: PImGuiTableColumnSortSpecs); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableColumnSortSpecs_destroy';

function ImGuiStyle_ImGuiStyle(): PImGuiStyle; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyle_ImGuiStyle';

procedure ImGuiStyle_destroy(self: PImGuiStyle); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyle_destroy';

procedure ImGuiStyle_ScaleAllSizes(self: PImGuiStyle; scale_factor: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyle_ScaleAllSizes';

procedure ImGuiIO_AddKeyEvent(self: PImGuiIO; key: ImGuiKey; down: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddKeyEvent';

procedure ImGuiIO_AddKeyAnalogEvent(self: PImGuiIO; key: ImGuiKey; down: Boolean; v: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddKeyAnalogEvent';

procedure ImGuiIO_AddMousePosEvent(self: PImGuiIO; x: Single; y: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddMousePosEvent';

procedure ImGuiIO_AddMouseButtonEvent(self: PImGuiIO; button: Integer; down: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddMouseButtonEvent';

procedure ImGuiIO_AddMouseWheelEvent(self: PImGuiIO; wheel_x: Single; wheel_y: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddMouseWheelEvent';

procedure ImGuiIO_AddMouseSourceEvent(self: PImGuiIO; source: ImGuiMouseSource); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddMouseSourceEvent';

procedure ImGuiIO_AddMouseViewportEvent(self: PImGuiIO; id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddMouseViewportEvent';

procedure ImGuiIO_AddFocusEvent(self: PImGuiIO; focused: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddFocusEvent';

procedure ImGuiIO_AddInputCharacter(self: PImGuiIO; c: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddInputCharacter';

procedure ImGuiIO_AddInputCharacterUTF16(self: PImGuiIO; c: ImWchar16); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddInputCharacterUTF16';

procedure ImGuiIO_AddInputCharactersUTF8(self: PImGuiIO; const str: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_AddInputCharactersUTF8';

procedure ImGuiIO_SetKeyEventNativeData(self: PImGuiIO; key: ImGuiKey; native_keycode: Integer; native_scancode: Integer; native_legacy_index: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_SetKeyEventNativeData';

procedure ImGuiIO_SetAppAcceptingEvents(self: PImGuiIO; accepting_events: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_SetAppAcceptingEvents';

procedure ImGuiIO_ClearEventsQueue(self: PImGuiIO); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_ClearEventsQueue';

procedure ImGuiIO_ClearInputKeys(self: PImGuiIO); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_ClearInputKeys';

function ImGuiIO_ImGuiIO(): PImGuiIO; cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_ImGuiIO';

procedure ImGuiIO_destroy(self: PImGuiIO); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIO_destroy';

function ImGuiInputTextCallbackData_ImGuiInputTextCallbackData(): PImGuiInputTextCallbackData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_ImGuiInputTextCallbackData';

procedure ImGuiInputTextCallbackData_destroy(self: PImGuiInputTextCallbackData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_destroy';

procedure ImGuiInputTextCallbackData_DeleteChars(self: PImGuiInputTextCallbackData; pos: Integer; bytes_count: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_DeleteChars';

procedure ImGuiInputTextCallbackData_InsertChars(self: PImGuiInputTextCallbackData; pos: Integer; const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_InsertChars';

procedure ImGuiInputTextCallbackData_SelectAll(self: PImGuiInputTextCallbackData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_SelectAll';

procedure ImGuiInputTextCallbackData_ClearSelection(self: PImGuiInputTextCallbackData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_ClearSelection';

function ImGuiInputTextCallbackData_HasSelection(self: PImGuiInputTextCallbackData): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextCallbackData_HasSelection';

function ImGuiWindowClass_ImGuiWindowClass(): PImGuiWindowClass; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindowClass_ImGuiWindowClass';

procedure ImGuiWindowClass_destroy(self: PImGuiWindowClass); cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindowClass_destroy';

function ImGuiPayload_ImGuiPayload(): PImGuiPayload; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPayload_ImGuiPayload';

procedure ImGuiPayload_destroy(self: PImGuiPayload); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPayload_destroy';

procedure ImGuiPayload_Clear(self: PImGuiPayload); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPayload_Clear';

function ImGuiPayload_IsDataType(self: PImGuiPayload; const &type: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPayload_IsDataType';

function ImGuiPayload_IsPreview(self: PImGuiPayload): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPayload_IsPreview';

function ImGuiPayload_IsDelivery(self: PImGuiPayload): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPayload_IsDelivery';

function ImGuiOnceUponAFrame_ImGuiOnceUponAFrame(): PImGuiOnceUponAFrame; cdecl;
  external PSFML_DLL name _PU + 'ImGuiOnceUponAFrame_ImGuiOnceUponAFrame';

procedure ImGuiOnceUponAFrame_destroy(self: PImGuiOnceUponAFrame); cdecl;
  external PSFML_DLL name _PU + 'ImGuiOnceUponAFrame_destroy';

function ImGuiTextFilter_ImGuiTextFilter(const default_filter: PUTF8Char): PImGuiTextFilter; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_ImGuiTextFilter';

procedure ImGuiTextFilter_destroy(self: PImGuiTextFilter); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_destroy';

function ImGuiTextFilter_Draw(self: PImGuiTextFilter; const &label: PUTF8Char; width: Single): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_Draw';

function ImGuiTextFilter_PassFilter(self: PImGuiTextFilter; const text: PUTF8Char; const text_end: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_PassFilter';

procedure ImGuiTextFilter_Build(self: PImGuiTextFilter); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_Build';

procedure ImGuiTextFilter_Clear(self: PImGuiTextFilter); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_Clear';

function ImGuiTextFilter_IsActive(self: PImGuiTextFilter): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextFilter_IsActive';

function ImGuiTextRange_ImGuiTextRange_Nil(): PImGuiTextRange; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextRange_ImGuiTextRange_Nil';

procedure ImGuiTextRange_destroy(self: PImGuiTextRange); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextRange_destroy';

function ImGuiTextRange_ImGuiTextRange_Str(const _b: PUTF8Char; const _e: PUTF8Char): PImGuiTextRange; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextRange_ImGuiTextRange_Str';

function ImGuiTextRange_empty(self: PImGuiTextRange): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextRange_empty';

procedure ImGuiTextRange_split(self: PImGuiTextRange; separator: UTF8Char; &out: PImVector_ImGuiTextRange); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextRange_split';

function ImGuiTextBuffer_ImGuiTextBuffer(): PImGuiTextBuffer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_ImGuiTextBuffer';

procedure ImGuiTextBuffer_destroy(self: PImGuiTextBuffer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_destroy';

function ImGuiTextBuffer_begin(self: PImGuiTextBuffer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_begin';

function ImGuiTextBuffer_end(self: PImGuiTextBuffer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_end';

function ImGuiTextBuffer_size(self: PImGuiTextBuffer): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_size';

function ImGuiTextBuffer_empty(self: PImGuiTextBuffer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_empty';

procedure ImGuiTextBuffer_clear(self: PImGuiTextBuffer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_clear';

procedure ImGuiTextBuffer_reserve(self: PImGuiTextBuffer; capacity: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_reserve';

function ImGuiTextBuffer_c_str(self: PImGuiTextBuffer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_c_str';

procedure ImGuiTextBuffer_append(self: PImGuiTextBuffer; const str: PUTF8Char; const str_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_append';

procedure ImGuiTextBuffer_appendfv(self: PImGuiTextBuffer; const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_appendfv';

function ImGuiStoragePair_ImGuiStoragePair_Int(_key: ImGuiID; _val: Integer): PImGuiStoragePair; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStoragePair_ImGuiStoragePair_Int';

procedure ImGuiStoragePair_destroy(self: PImGuiStoragePair); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStoragePair_destroy';

function ImGuiStoragePair_ImGuiStoragePair_Float(_key: ImGuiID; _val: Single): PImGuiStoragePair; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStoragePair_ImGuiStoragePair_Float';

function ImGuiStoragePair_ImGuiStoragePair_Ptr(_key: ImGuiID; _val: Pointer): PImGuiStoragePair; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStoragePair_ImGuiStoragePair_Ptr';

procedure ImGuiStorage_Clear(self: PImGuiStorage); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_Clear';

function ImGuiStorage_GetInt(self: PImGuiStorage; key: ImGuiID; default_val: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetInt';

procedure ImGuiStorage_SetInt(self: PImGuiStorage; key: ImGuiID; val: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_SetInt';

function ImGuiStorage_GetBool(self: PImGuiStorage; key: ImGuiID; default_val: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetBool';

procedure ImGuiStorage_SetBool(self: PImGuiStorage; key: ImGuiID; val: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_SetBool';

function ImGuiStorage_GetFloat(self: PImGuiStorage; key: ImGuiID; default_val: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetFloat';

procedure ImGuiStorage_SetFloat(self: PImGuiStorage; key: ImGuiID; val: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_SetFloat';

function ImGuiStorage_GetVoidPtr(self: PImGuiStorage; key: ImGuiID): Pointer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetVoidPtr';

procedure ImGuiStorage_SetVoidPtr(self: PImGuiStorage; key: ImGuiID; val: Pointer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_SetVoidPtr';

function ImGuiStorage_GetIntRef(self: PImGuiStorage; key: ImGuiID; default_val: Integer): PInteger; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetIntRef';

function ImGuiStorage_GetBoolRef(self: PImGuiStorage; key: ImGuiID; default_val: Boolean): PBoolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetBoolRef';

function ImGuiStorage_GetFloatRef(self: PImGuiStorage; key: ImGuiID; default_val: Single): PSingle; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetFloatRef';

function ImGuiStorage_GetVoidPtrRef(self: PImGuiStorage; key: ImGuiID; default_val: Pointer): PPointer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_GetVoidPtrRef';

procedure ImGuiStorage_BuildSortByKey(self: PImGuiStorage); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_BuildSortByKey';

procedure ImGuiStorage_SetAllInt(self: PImGuiStorage; val: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStorage_SetAllInt';

function ImGuiListClipper_ImGuiListClipper(): PImGuiListClipper; cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_ImGuiListClipper';

procedure ImGuiListClipper_destroy(self: PImGuiListClipper); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_destroy';

procedure ImGuiListClipper_Begin(self: PImGuiListClipper; items_count: Integer; items_height: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_Begin';

procedure ImGuiListClipper_End(self: PImGuiListClipper); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_End';

function ImGuiListClipper_Step(self: PImGuiListClipper): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_Step';

procedure ImGuiListClipper_IncludeItemByIndex(self: PImGuiListClipper; item_index: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_IncludeItemByIndex';

procedure ImGuiListClipper_IncludeItemsByIndex(self: PImGuiListClipper; item_begin: Integer; item_end: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipper_IncludeItemsByIndex';

function ImColor_ImColor_Nil(): PImColor; cdecl;
  external PSFML_DLL name _PU + 'ImColor_ImColor_Nil';

procedure ImColor_destroy(self: PImColor); cdecl;
  external PSFML_DLL name _PU + 'ImColor_destroy';

function ImColor_ImColor_Float(r: Single; g: Single; b: Single; a: Single): PImColor; cdecl;
  external PSFML_DLL name _PU + 'ImColor_ImColor_Float';

function ImColor_ImColor_Vec4(col: ImVec4): PImColor; cdecl;
  external PSFML_DLL name _PU + 'ImColor_ImColor_Vec4';

function ImColor_ImColor_Int(r: Integer; g: Integer; b: Integer; a: Integer): PImColor; cdecl;
  external PSFML_DLL name _PU + 'ImColor_ImColor_Int';

function ImColor_ImColor_U32(rgba: ImU32): PImColor; cdecl;
  external PSFML_DLL name _PU + 'ImColor_ImColor_U32';

procedure ImColor_SetHSV(self: PImColor; h: Single; s: Single; v: Single; a: Single); cdecl;
  external PSFML_DLL name _PU + 'ImColor_SetHSV';

procedure ImColor_HSV(pOut: PImColor; h: Single; s: Single; v: Single; a: Single); cdecl;
  external PSFML_DLL name _PU + 'ImColor_HSV';

function ImDrawCmd_ImDrawCmd(): PImDrawCmd; cdecl;
  external PSFML_DLL name _PU + 'ImDrawCmd_ImDrawCmd';

procedure ImDrawCmd_destroy(self: PImDrawCmd); cdecl;
  external PSFML_DLL name _PU + 'ImDrawCmd_destroy';

function ImDrawCmd_GetTexID(self: PImDrawCmd): ImTextureID; cdecl;
  external PSFML_DLL name _PU + 'ImDrawCmd_GetTexID';

function ImDrawListSplitter_ImDrawListSplitter(): PImDrawListSplitter; cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_ImDrawListSplitter';

procedure ImDrawListSplitter_destroy(self: PImDrawListSplitter); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_destroy';

procedure ImDrawListSplitter_Clear(self: PImDrawListSplitter); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_Clear';

procedure ImDrawListSplitter_ClearFreeMemory(self: PImDrawListSplitter); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_ClearFreeMemory';

procedure ImDrawListSplitter_Split(self: PImDrawListSplitter; draw_list: PImDrawList; count: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_Split';

procedure ImDrawListSplitter_Merge(self: PImDrawListSplitter; draw_list: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_Merge';

procedure ImDrawListSplitter_SetCurrentChannel(self: PImDrawListSplitter; draw_list: PImDrawList; channel_idx: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSplitter_SetCurrentChannel';

function ImDrawList_ImDrawList(shared_data: PImDrawListSharedData): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_ImDrawList';

procedure ImDrawList_destroy(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_destroy';

procedure ImDrawList_PushClipRect(self: PImDrawList; clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PushClipRect';

procedure ImDrawList_PushClipRectFullScreen(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PushClipRectFullScreen';

procedure ImDrawList_PopClipRect(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PopClipRect';

procedure ImDrawList_PushTextureID(self: PImDrawList; texture_id: ImTextureID); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PushTextureID';

procedure ImDrawList_PopTextureID(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PopTextureID';

procedure ImDrawList_GetClipRectMin(pOut: PImVec2; self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_GetClipRectMin';

procedure ImDrawList_GetClipRectMax(pOut: PImVec2; self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_GetClipRectMax';

procedure ImDrawList_AddLine(self: PImDrawList; p1: ImVec2; p2: ImVec2; col: ImU32; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddLine';

procedure ImDrawList_AddRect(self: PImDrawList; p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddRect';

procedure ImDrawList_AddRectFilled(self: PImDrawList; p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddRectFilled';

procedure ImDrawList_AddRectFilledMultiColor(self: PImDrawList; p_min: ImVec2; p_max: ImVec2; col_upr_left: ImU32; col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddRectFilledMultiColor';

procedure ImDrawList_AddQuad(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddQuad';

procedure ImDrawList_AddQuadFilled(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddQuadFilled';

procedure ImDrawList_AddTriangle(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddTriangle';

procedure ImDrawList_AddTriangleFilled(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddTriangleFilled';

procedure ImDrawList_AddCircle(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddCircle';

procedure ImDrawList_AddCircleFilled(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddCircleFilled';

procedure ImDrawList_AddNgon(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddNgon';

procedure ImDrawList_AddNgonFilled(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddNgonFilled';

procedure ImDrawList_AddEllipse(self: PImDrawList; center: ImVec2; radius_x: Single; radius_y: Single; col: ImU32; rot: Single; num_segments: Integer; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddEllipse';

procedure ImDrawList_AddEllipseFilled(self: PImDrawList; center: ImVec2; radius_x: Single; radius_y: Single; col: ImU32; rot: Single; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddEllipseFilled';

procedure ImDrawList_AddText_Vec2(self: PImDrawList; pos: ImVec2; col: ImU32; const text_begin: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddText_Vec2';

procedure ImDrawList_AddText_FontPtr(self: PImDrawList; const font: PImFont; font_size: Single; pos: ImVec2; col: ImU32; const text_begin: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single; const cpu_fine_clip_rect: PImVec4); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddText_FontPtr';

procedure ImDrawList_AddPolyline(self: PImDrawList; const points: PImVec2; num_points: Integer; col: ImU32; flags: ImDrawFlags; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddPolyline';

procedure ImDrawList_AddConvexPolyFilled(self: PImDrawList; const points: PImVec2; num_points: Integer; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddConvexPolyFilled';

procedure ImDrawList_AddBezierCubic(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddBezierCubic';

procedure ImDrawList_AddBezierQuadratic(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32; thickness: Single; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddBezierQuadratic';

procedure ImDrawList_AddImage(self: PImDrawList; user_texture_id: ImTextureID; p_min: ImVec2; p_max: ImVec2; uv_min: ImVec2; uv_max: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddImage';

procedure ImDrawList_AddImageQuad(self: PImDrawList; user_texture_id: ImTextureID; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; uv1: ImVec2; uv2: ImVec2; uv3: ImVec2; uv4: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddImageQuad';

procedure ImDrawList_AddImageRounded(self: PImDrawList; user_texture_id: ImTextureID; p_min: ImVec2; p_max: ImVec2; uv_min: ImVec2; uv_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddImageRounded';

procedure ImDrawList_PathClear(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathClear';

procedure ImDrawList_PathLineTo(self: PImDrawList; pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathLineTo';

procedure ImDrawList_PathLineToMergeDuplicate(self: PImDrawList; pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathLineToMergeDuplicate';

procedure ImDrawList_PathFillConvex(self: PImDrawList; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathFillConvex';

procedure ImDrawList_PathStroke(self: PImDrawList; col: ImU32; flags: ImDrawFlags; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathStroke';

procedure ImDrawList_PathArcTo(self: PImDrawList; center: ImVec2; radius: Single; a_min: Single; a_max: Single; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathArcTo';

procedure ImDrawList_PathArcToFast(self: PImDrawList; center: ImVec2; radius: Single; a_min_of_12: Integer; a_max_of_12: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathArcToFast';

procedure ImDrawList_PathEllipticalArcTo(self: PImDrawList; center: ImVec2; radius_x: Single; radius_y: Single; rot: Single; a_min: Single; a_max: Single; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathEllipticalArcTo';

procedure ImDrawList_PathBezierCubicCurveTo(self: PImDrawList; p2: ImVec2; p3: ImVec2; p4: ImVec2; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathBezierCubicCurveTo';

procedure ImDrawList_PathBezierQuadraticCurveTo(self: PImDrawList; p2: ImVec2; p3: ImVec2; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathBezierQuadraticCurveTo';

procedure ImDrawList_PathRect(self: PImDrawList; rect_min: ImVec2; rect_max: ImVec2; rounding: Single; flags: ImDrawFlags); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PathRect';

procedure ImDrawList_AddCallback(self: PImDrawList; callback: ImDrawCallback; callback_data: Pointer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddCallback';

procedure ImDrawList_AddDrawCmd(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_AddDrawCmd';

function ImDrawList_CloneOutput(self: PImDrawList): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_CloneOutput';

procedure ImDrawList_ChannelsSplit(self: PImDrawList; count: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_ChannelsSplit';

procedure ImDrawList_ChannelsMerge(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_ChannelsMerge';

procedure ImDrawList_ChannelsSetCurrent(self: PImDrawList; n: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_ChannelsSetCurrent';

procedure ImDrawList_PrimReserve(self: PImDrawList; idx_count: Integer; vtx_count: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimReserve';

procedure ImDrawList_PrimUnreserve(self: PImDrawList; idx_count: Integer; vtx_count: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimUnreserve';

procedure ImDrawList_PrimRect(self: PImDrawList; a: ImVec2; b: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimRect';

procedure ImDrawList_PrimRectUV(self: PImDrawList; a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimRectUV';

procedure ImDrawList_PrimQuadUV(self: PImDrawList; a: ImVec2; b: ImVec2; c: ImVec2; d: ImVec2; uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimQuadUV';

procedure ImDrawList_PrimWriteVtx(self: PImDrawList; pos: ImVec2; uv: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimWriteVtx';

procedure ImDrawList_PrimWriteIdx(self: PImDrawList; idx: ImDrawIdx); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimWriteIdx';

procedure ImDrawList_PrimVtx(self: PImDrawList; pos: ImVec2; uv: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList_PrimVtx';

procedure ImDrawList__ResetForNewFrame(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__ResetForNewFrame';

procedure ImDrawList__ClearFreeMemory(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__ClearFreeMemory';

procedure ImDrawList__PopUnusedDrawCmd(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__PopUnusedDrawCmd';

procedure ImDrawList__TryMergeDrawCmds(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__TryMergeDrawCmds';

procedure ImDrawList__OnChangedClipRect(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__OnChangedClipRect';

procedure ImDrawList__OnChangedTextureID(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__OnChangedTextureID';

procedure ImDrawList__OnChangedVtxOffset(self: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__OnChangedVtxOffset';

function ImDrawList__CalcCircleAutoSegmentCount(self: PImDrawList; radius: Single): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__CalcCircleAutoSegmentCount';

procedure ImDrawList__PathArcToFastEx(self: PImDrawList; center: ImVec2; radius: Single; a_min_sample: Integer; a_max_sample: Integer; a_step: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__PathArcToFastEx';

procedure ImDrawList__PathArcToN(self: PImDrawList; center: ImVec2; radius: Single; a_min: Single; a_max: Single; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImDrawList__PathArcToN';

function ImDrawData_ImDrawData(): PImDrawData; cdecl;
  external PSFML_DLL name _PU + 'ImDrawData_ImDrawData';

procedure ImDrawData_destroy(self: PImDrawData); cdecl;
  external PSFML_DLL name _PU + 'ImDrawData_destroy';

procedure ImDrawData_Clear(self: PImDrawData); cdecl;
  external PSFML_DLL name _PU + 'ImDrawData_Clear';

procedure ImDrawData_AddDrawList(self: PImDrawData; draw_list: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'ImDrawData_AddDrawList';

procedure ImDrawData_DeIndexAllBuffers(self: PImDrawData); cdecl;
  external PSFML_DLL name _PU + 'ImDrawData_DeIndexAllBuffers';

procedure ImDrawData_ScaleClipRects(self: PImDrawData; fb_scale: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImDrawData_ScaleClipRects';

function ImFontConfig_ImFontConfig(): PImFontConfig; cdecl;
  external PSFML_DLL name _PU + 'ImFontConfig_ImFontConfig';

procedure ImFontConfig_destroy(self: PImFontConfig); cdecl;
  external PSFML_DLL name _PU + 'ImFontConfig_destroy';

function ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder(): PImFontGlyphRangesBuilder; cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder';

procedure ImFontGlyphRangesBuilder_destroy(self: PImFontGlyphRangesBuilder); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_destroy';

procedure ImFontGlyphRangesBuilder_Clear(self: PImFontGlyphRangesBuilder); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_Clear';

function ImFontGlyphRangesBuilder_GetBit(self: PImFontGlyphRangesBuilder; n: NativeUInt): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_GetBit';

procedure ImFontGlyphRangesBuilder_SetBit(self: PImFontGlyphRangesBuilder; n: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_SetBit';

procedure ImFontGlyphRangesBuilder_AddChar(self: PImFontGlyphRangesBuilder; c: ImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_AddChar';

procedure ImFontGlyphRangesBuilder_AddText(self: PImFontGlyphRangesBuilder; const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_AddText';

procedure ImFontGlyphRangesBuilder_AddRanges(self: PImFontGlyphRangesBuilder; const ranges: PImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_AddRanges';

procedure ImFontGlyphRangesBuilder_BuildRanges(self: PImFontGlyphRangesBuilder; out_ranges: PImVector_ImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImFontGlyphRangesBuilder_BuildRanges';

function ImFontAtlasCustomRect_ImFontAtlasCustomRect(): PImFontAtlasCustomRect; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlasCustomRect_ImFontAtlasCustomRect';

procedure ImFontAtlasCustomRect_destroy(self: PImFontAtlasCustomRect); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlasCustomRect_destroy';

function ImFontAtlasCustomRect_IsPacked(self: PImFontAtlasCustomRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlasCustomRect_IsPacked';

function ImFontAtlas_ImFontAtlas(): PImFontAtlas; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_ImFontAtlas';

procedure ImFontAtlas_destroy(self: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_destroy';

function ImFontAtlas_AddFont(self: PImFontAtlas; const font_cfg: PImFontConfig): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddFont';

function ImFontAtlas_AddFontDefault(self: PImFontAtlas; const font_cfg: PImFontConfig): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddFontDefault';

function ImFontAtlas_AddFontFromFileTTF(self: PImFontAtlas; const filename: PUTF8Char; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddFontFromFileTTF';

function ImFontAtlas_AddFontFromMemoryTTF(self: PImFontAtlas; font_data: Pointer; font_data_size: Integer; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddFontFromMemoryTTF';

function ImFontAtlas_AddFontFromMemoryCompressedTTF(self: PImFontAtlas; const compressed_font_data: Pointer; compressed_font_data_size: Integer; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddFontFromMemoryCompressedTTF';

function ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self: PImFontAtlas; const compressed_font_data_base85: PUTF8Char; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddFontFromMemoryCompressedBase85TTF';

procedure ImFontAtlas_ClearInputData(self: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_ClearInputData';

procedure ImFontAtlas_ClearTexData(self: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_ClearTexData';

procedure ImFontAtlas_ClearFonts(self: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_ClearFonts';

procedure ImFontAtlas_Clear(self: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_Clear';

function ImFontAtlas_Build(self: PImFontAtlas): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_Build';

procedure ImFontAtlas_GetTexDataAsAlpha8(self: PImFontAtlas; out_pixels: PPByte; out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetTexDataAsAlpha8';

procedure ImFontAtlas_GetTexDataAsRGBA32(self: PImFontAtlas; out_pixels: PPByte; out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetTexDataAsRGBA32';

function ImFontAtlas_IsBuilt(self: PImFontAtlas): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_IsBuilt';

procedure ImFontAtlas_SetTexID(self: PImFontAtlas; id: ImTextureID); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_SetTexID';

function ImFontAtlas_GetGlyphRangesDefault(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesDefault';

function ImFontAtlas_GetGlyphRangesGreek(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesGreek';

function ImFontAtlas_GetGlyphRangesKorean(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesKorean';

function ImFontAtlas_GetGlyphRangesJapanese(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesJapanese';

function ImFontAtlas_GetGlyphRangesChineseFull(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesChineseFull';

function ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon';

function ImFontAtlas_GetGlyphRangesCyrillic(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesCyrillic';

function ImFontAtlas_GetGlyphRangesThai(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesThai';

function ImFontAtlas_GetGlyphRangesVietnamese(self: PImFontAtlas): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetGlyphRangesVietnamese';

function ImFontAtlas_AddCustomRectRegular(self: PImFontAtlas; width: Integer; height: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddCustomRectRegular';

function ImFontAtlas_AddCustomRectFontGlyph(self: PImFontAtlas; font: PImFont; id: ImWchar; width: Integer; height: Integer; advance_x: Single; offset: ImVec2): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_AddCustomRectFontGlyph';

function ImFontAtlas_GetCustomRectByIndex(self: PImFontAtlas; index: Integer): PImFontAtlasCustomRect; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetCustomRectByIndex';

procedure ImFontAtlas_CalcCustomRectUV(self: PImFontAtlas; const rect: PImFontAtlasCustomRect; out_uv_min: PImVec2; out_uv_max: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_CalcCustomRectUV';

function ImFontAtlas_GetMouseCursorTexData(self: PImFontAtlas; cursor: ImGuiMouseCursor; out_offset: PImVec2; out_size: PImVec2; out_uv_border: PImVec2; out_uv_fill: PImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFontAtlas_GetMouseCursorTexData';

function ImFont_ImFont(): PImFont; cdecl;
  external PSFML_DLL name _PU + 'ImFont_ImFont';

procedure ImFont_destroy(self: PImFont); cdecl;
  external PSFML_DLL name _PU + 'ImFont_destroy';

function ImFont_FindGlyph(self: PImFont; c: ImWchar): PImFontGlyph; cdecl;
  external PSFML_DLL name _PU + 'ImFont_FindGlyph';

function ImFont_FindGlyphNoFallback(self: PImFont; c: ImWchar): PImFontGlyph; cdecl;
  external PSFML_DLL name _PU + 'ImFont_FindGlyphNoFallback';

function ImFont_GetCharAdvance(self: PImFont; c: ImWchar): Single; cdecl;
  external PSFML_DLL name _PU + 'ImFont_GetCharAdvance';

function ImFont_IsLoaded(self: PImFont): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFont_IsLoaded';

function ImFont_GetDebugName(self: PImFont): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImFont_GetDebugName';

procedure ImFont_CalcTextSizeA(pOut: PImVec2; self: PImFont; size: Single; max_width: Single; wrap_width: Single; const text_begin: PUTF8Char; const text_end: PUTF8Char; remaining: PPUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'ImFont_CalcTextSizeA';

function ImFont_CalcWordWrapPositionA(self: PImFont; scale: Single; const text: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImFont_CalcWordWrapPositionA';

procedure ImFont_RenderChar(self: PImFont; draw_list: PImDrawList; size: Single; pos: ImVec2; col: ImU32; c: ImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImFont_RenderChar';

procedure ImFont_RenderText(self: PImFont; draw_list: PImDrawList; size: Single; pos: ImVec2; col: ImU32; clip_rect: ImVec4; const text_begin: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single; cpu_fine_clip: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImFont_RenderText';

procedure ImFont_BuildLookupTable(self: PImFont); cdecl;
  external PSFML_DLL name _PU + 'ImFont_BuildLookupTable';

procedure ImFont_ClearOutputData(self: PImFont); cdecl;
  external PSFML_DLL name _PU + 'ImFont_ClearOutputData';

procedure ImFont_GrowIndex(self: PImFont; new_size: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImFont_GrowIndex';

procedure ImFont_AddGlyph(self: PImFont; const src_cfg: PImFontConfig; c: ImWchar; x0: Single; y0: Single; x1: Single; y1: Single; u0: Single; v0: Single; u1: Single; v1: Single; advance_x: Single); cdecl;
  external PSFML_DLL name _PU + 'ImFont_AddGlyph';

procedure ImFont_AddRemapChar(self: PImFont; dst: ImWchar; src: ImWchar; overwrite_dst: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImFont_AddRemapChar';

procedure ImFont_SetGlyphVisible(self: PImFont; c: ImWchar; visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImFont_SetGlyphVisible';

function ImFont_IsGlyphRangeUnused(self: PImFont; c_begin: Cardinal; c_last: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImFont_IsGlyphRangeUnused';

function ImGuiViewport_ImGuiViewport(): PImGuiViewport; cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewport_ImGuiViewport';

procedure ImGuiViewport_destroy(self: PImGuiViewport); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewport_destroy';

procedure ImGuiViewport_GetCenter(pOut: PImVec2; self: PImGuiViewport); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewport_GetCenter';

procedure ImGuiViewport_GetWorkCenter(pOut: PImVec2; self: PImGuiViewport); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewport_GetWorkCenter';

function ImGuiPlatformIO_ImGuiPlatformIO(): PImGuiPlatformIO; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPlatformIO_ImGuiPlatformIO';

procedure ImGuiPlatformIO_destroy(self: PImGuiPlatformIO); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPlatformIO_destroy';

function ImGuiPlatformMonitor_ImGuiPlatformMonitor(): PImGuiPlatformMonitor; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPlatformMonitor_ImGuiPlatformMonitor';

procedure ImGuiPlatformMonitor_destroy(self: PImGuiPlatformMonitor); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPlatformMonitor_destroy';

function ImGuiPlatformImeData_ImGuiPlatformImeData(): PImGuiPlatformImeData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPlatformImeData_ImGuiPlatformImeData';

procedure ImGuiPlatformImeData_destroy(self: PImGuiPlatformImeData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPlatformImeData_destroy';

function igGetKeyIndex(key: ImGuiKey): ImGuiKey; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyIndex';

function igImHashData(const data: Pointer; data_size: NativeUInt; seed: ImGuiID): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igImHashData';

function igImHashStr(const data: PUTF8Char; data_size: NativeUInt; seed: ImGuiID): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igImHashStr';

type
  igImQsort_compare_func = function(const p1: Pointer; const p2: Pointer): Integer; cdecl;

procedure igImQsort(base: Pointer; count: NativeUInt; size_of_element: NativeUInt; compare_func: igImQsort_compare_func); cdecl;
  external PSFML_DLL name _PU + 'igImQsort';

function igImAlphaBlendColors(col_a: ImU32; col_b: ImU32): ImU32; cdecl;
  external PSFML_DLL name _PU + 'igImAlphaBlendColors';

function igImIsPowerOfTwo_Int(v: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImIsPowerOfTwo_Int';

function igImIsPowerOfTwo_U64(v: ImU64): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImIsPowerOfTwo_U64';

function igImUpperPowerOfTwo(v: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImUpperPowerOfTwo';

function igImStricmp(const str1: PUTF8Char; const str2: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImStricmp';

function igImStrnicmp(const str1: PUTF8Char; const str2: PUTF8Char; count: NativeUInt): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImStrnicmp';

procedure igImStrncpy(dst: PUTF8Char; const src: PUTF8Char; count: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'igImStrncpy';

function igImStrdup(const str: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImStrdup';

function igImStrdupcpy(dst: PUTF8Char; p_dst_size: PNativeUInt; const str: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImStrdupcpy';

function igImStrchrRange(const str_begin: PUTF8Char; const str_end: PUTF8Char; c: UTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImStrchrRange';

function igImStreolRange(const str: PUTF8Char; const str_end: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImStreolRange';

function igImStristr(const haystack: PUTF8Char; const haystack_end: PUTF8Char; const needle: PUTF8Char; const needle_end: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImStristr';

procedure igImStrTrimBlanks(str: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igImStrTrimBlanks';

function igImStrSkipBlank(const str: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImStrSkipBlank';

function igImStrlenW(const str: PImWchar): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImStrlenW';

function igImStrbolW(const buf_mid_line: PImWchar; const buf_begin: PImWchar): PImWchar; cdecl;
  external PSFML_DLL name _PU + 'igImStrbolW';

function igImToUpper(c: UTF8Char): UTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImToUpper';

function igImCharIsBlankA(c: UTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImCharIsBlankA';

function igImCharIsBlankW(c: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImCharIsBlankW';

function igImFormatString(buf: PUTF8Char; buf_size: NativeUInt; const fmt: PUTF8Char): Integer varargs; cdecl;
  external PSFML_DLL name _PU + 'igImFormatString';

function igImFormatStringV(buf: PUTF8Char; buf_size: NativeUInt; const fmt: PUTF8Char; args: Pointer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImFormatStringV';

procedure igImFormatStringToTempBuffer(out_buf: PPUTF8Char; out_buf_end: PPUTF8Char; const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igImFormatStringToTempBuffer';

procedure igImFormatStringToTempBufferV(out_buf: PPUTF8Char; out_buf_end: PPUTF8Char; const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igImFormatStringToTempBufferV';

function igImParseFormatFindStart(const format: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImParseFormatFindStart';

function igImParseFormatFindEnd(const format: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImParseFormatFindEnd';

function igImParseFormatTrimDecorations(const format: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImParseFormatTrimDecorations';

procedure igImParseFormatSanitizeForPrinting(const fmt_in: PUTF8Char; fmt_out: PUTF8Char; fmt_out_size: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'igImParseFormatSanitizeForPrinting';

function igImParseFormatSanitizeForScanning(const fmt_in: PUTF8Char; fmt_out: PUTF8Char; fmt_out_size: NativeUInt): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImParseFormatSanitizeForScanning';

function igImParseFormatPrecision(const format: PUTF8Char; default_value: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImParseFormatPrecision';

function igImTextCharToUtf8(out_buf: PUTF8Char; c: Cardinal): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImTextCharToUtf8';

function igImTextStrToUtf8(out_buf: PUTF8Char; out_buf_size: Integer; const in_text: PImWchar; const in_text_end: PImWchar): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImTextStrToUtf8';

function igImTextCharFromUtf8(out_char: PCardinal; const in_text: PUTF8Char; const in_text_end: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImTextCharFromUtf8';

function igImTextStrFromUtf8(out_buf: PImWchar; out_buf_size: Integer; const in_text: PUTF8Char; const in_text_end: PUTF8Char; in_remaining: PPUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImTextStrFromUtf8';

function igImTextCountCharsFromUtf8(const in_text: PUTF8Char; const in_text_end: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImTextCountCharsFromUtf8';

function igImTextCountUtf8BytesFromChar(const in_text: PUTF8Char; const in_text_end: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImTextCountUtf8BytesFromChar';

function igImTextCountUtf8BytesFromStr(const in_text: PImWchar; const in_text_end: PImWchar): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImTextCountUtf8BytesFromStr';

function igImTextFindPreviousUtf8Codepoint(const in_text_start: PUTF8Char; const in_text_curr: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igImTextFindPreviousUtf8Codepoint';

function igImFileOpen(const filename: PUTF8Char; const mode: PUTF8Char): ImFileHandle; cdecl;
  external PSFML_DLL name _PU + 'igImFileOpen';

function igImFileClose(&file: ImFileHandle): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImFileClose';

function igImFileGetSize(&file: ImFileHandle): ImU64; cdecl;
  external PSFML_DLL name _PU + 'igImFileGetSize';

function igImFileRead(data: Pointer; size: ImU64; count: ImU64; &file: ImFileHandle): ImU64; cdecl;
  external PSFML_DLL name _PU + 'igImFileRead';

function igImFileWrite(const data: Pointer; size: ImU64; count: ImU64; &file: ImFileHandle): ImU64; cdecl;
  external PSFML_DLL name _PU + 'igImFileWrite';

function igImFileLoadToMemory(const filename: PUTF8Char; const mode: PUTF8Char; out_file_size: PNativeUInt; padding_bytes: Integer): Pointer; cdecl;
  external PSFML_DLL name _PU + 'igImFileLoadToMemory';

function igImPow_Float(x: Single; y: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImPow_Float';

function igImPow_double(x: Double; y: Double): Double; cdecl;
  external PSFML_DLL name _PU + 'igImPow_double';

function igImLog_Float(x: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImLog_Float';

function igImLog_double(x: Double): Double; cdecl;
  external PSFML_DLL name _PU + 'igImLog_double';

function igImAbs_Int(x: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImAbs_Int';

function igImAbs_Float(x: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImAbs_Float';

function igImAbs_double(x: Double): Double; cdecl;
  external PSFML_DLL name _PU + 'igImAbs_double';

function igImSign_Float(x: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImSign_Float';

function igImSign_double(x: Double): Double; cdecl;
  external PSFML_DLL name _PU + 'igImSign_double';

function igImRsqrt_Float(x: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImRsqrt_Float';

function igImRsqrt_double(x: Double): Double; cdecl;
  external PSFML_DLL name _PU + 'igImRsqrt_double';

procedure igImMin(pOut: PImVec2; lhs: ImVec2; rhs: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImMin';

procedure igImMax(pOut: PImVec2; lhs: ImVec2; rhs: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImMax';

procedure igImClamp(pOut: PImVec2; v: ImVec2; mn: ImVec2; mx: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImClamp';

procedure igImLerp_Vec2Float(pOut: PImVec2; a: ImVec2; b: ImVec2; t: Single); cdecl;
  external PSFML_DLL name _PU + 'igImLerp_Vec2Float';

procedure igImLerp_Vec2Vec2(pOut: PImVec2; a: ImVec2; b: ImVec2; t: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImLerp_Vec2Vec2';

procedure igImLerp_Vec4(pOut: PImVec4; a: ImVec4; b: ImVec4; t: Single); cdecl;
  external PSFML_DLL name _PU + 'igImLerp_Vec4';

function igImSaturate(f: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImSaturate';

function igImLengthSqr_Vec2(lhs: ImVec2): Single; cdecl;
  external PSFML_DLL name _PU + 'igImLengthSqr_Vec2';

function igImLengthSqr_Vec4(lhs: ImVec4): Single; cdecl;
  external PSFML_DLL name _PU + 'igImLengthSqr_Vec4';

function igImInvLength(lhs: ImVec2; fail_value: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImInvLength';

function igImTrunc_Float(f: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImTrunc_Float';

procedure igImTrunc_Vec2(pOut: PImVec2; v: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImTrunc_Vec2';

function igImFloor_Float(f: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImFloor_Float';

procedure igImFloor_Vec2(pOut: PImVec2; v: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImFloor_Vec2';

function igImModPositive(a: Integer; b: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igImModPositive';

function igImDot(a: ImVec2; b: ImVec2): Single; cdecl;
  external PSFML_DLL name _PU + 'igImDot';

procedure igImRotate(pOut: PImVec2; v: ImVec2; cos_a: Single; sin_a: Single); cdecl;
  external PSFML_DLL name _PU + 'igImRotate';

function igImLinearSweep(current: Single; target: Single; speed: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igImLinearSweep';

procedure igImMul(pOut: PImVec2; lhs: ImVec2; rhs: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImMul';

function igImIsFloatAboveGuaranteedIntegerPrecision(f: Single): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImIsFloatAboveGuaranteedIntegerPrecision';

function igImExponentialMovingAverage(avg: Single; sample: Single; n: Integer): Single; cdecl;
  external PSFML_DLL name _PU + 'igImExponentialMovingAverage';

procedure igImBezierCubicCalc(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; t: Single); cdecl;
  external PSFML_DLL name _PU + 'igImBezierCubicCalc';

procedure igImBezierCubicClosestPoint(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; p: ImVec2; num_segments: Integer); cdecl;
  external PSFML_DLL name _PU + 'igImBezierCubicClosestPoint';

procedure igImBezierCubicClosestPointCasteljau(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; p: ImVec2; tess_tol: Single); cdecl;
  external PSFML_DLL name _PU + 'igImBezierCubicClosestPointCasteljau';

procedure igImBezierQuadraticCalc(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; t: Single); cdecl;
  external PSFML_DLL name _PU + 'igImBezierQuadraticCalc';

procedure igImLineClosestPoint(pOut: PImVec2; a: ImVec2; b: ImVec2; p: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImLineClosestPoint';

function igImTriangleContainsPoint(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImTriangleContainsPoint';

procedure igImTriangleClosestPoint(pOut: PImVec2; a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igImTriangleClosestPoint';

procedure igImTriangleBarycentricCoords(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2; out_u: PSingle; out_v: PSingle; out_w: PSingle); cdecl;
  external PSFML_DLL name _PU + 'igImTriangleBarycentricCoords';

function igImTriangleArea(a: ImVec2; b: ImVec2; c: ImVec2): Single; cdecl;
  external PSFML_DLL name _PU + 'igImTriangleArea';

function ImVec1_ImVec1_Nil(): PImVec1; cdecl;
  external PSFML_DLL name _PU + 'ImVec1_ImVec1_Nil';

procedure ImVec1_destroy(self: PImVec1); cdecl;
  external PSFML_DLL name _PU + 'ImVec1_destroy';

function ImVec1_ImVec1_Float(_x: Single): PImVec1; cdecl;
  external PSFML_DLL name _PU + 'ImVec1_ImVec1_Float';

function ImVec2ih_ImVec2ih_Nil(): PImVec2ih; cdecl;
  external PSFML_DLL name _PU + 'ImVec2ih_ImVec2ih_Nil';

procedure ImVec2ih_destroy(self: PImVec2ih); cdecl;
  external PSFML_DLL name _PU + 'ImVec2ih_destroy';

function ImVec2ih_ImVec2ih_short(_x: Smallint; _y: Smallint): PImVec2ih; cdecl;
  external PSFML_DLL name _PU + 'ImVec2ih_ImVec2ih_short';

function ImVec2ih_ImVec2ih_Vec2(rhs: ImVec2): PImVec2ih; cdecl;
  external PSFML_DLL name _PU + 'ImVec2ih_ImVec2ih_Vec2';

function ImRect_ImRect_Nil(): PImRect; cdecl;
  external PSFML_DLL name _PU + 'ImRect_ImRect_Nil';

procedure ImRect_destroy(self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_destroy';

function ImRect_ImRect_Vec2(min: ImVec2; max: ImVec2): PImRect; cdecl;
  external PSFML_DLL name _PU + 'ImRect_ImRect_Vec2';

function ImRect_ImRect_Vec4(v: ImVec4): PImRect; cdecl;
  external PSFML_DLL name _PU + 'ImRect_ImRect_Vec4';

function ImRect_ImRect_Float(x1: Single; y1: Single; x2: Single; y2: Single): PImRect; cdecl;
  external PSFML_DLL name _PU + 'ImRect_ImRect_Float';

procedure ImRect_GetCenter(pOut: PImVec2; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetCenter';

procedure ImRect_GetSize(pOut: PImVec2; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetSize';

function ImRect_GetWidth(self: PImRect): Single; cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetWidth';

function ImRect_GetHeight(self: PImRect): Single; cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetHeight';

function ImRect_GetArea(self: PImRect): Single; cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetArea';

procedure ImRect_GetTL(pOut: PImVec2; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetTL';

procedure ImRect_GetTR(pOut: PImVec2; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetTR';

procedure ImRect_GetBL(pOut: PImVec2; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetBL';

procedure ImRect_GetBR(pOut: PImVec2; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_GetBR';

function ImRect_Contains_Vec2(self: PImRect; p: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImRect_Contains_Vec2';

function ImRect_Contains_Rect(self: PImRect; r: ImRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImRect_Contains_Rect';

function ImRect_ContainsWithPad(self: PImRect; p: ImVec2; pad: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImRect_ContainsWithPad';

function ImRect_Overlaps(self: PImRect; r: ImRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImRect_Overlaps';

procedure ImRect_Add_Vec2(self: PImRect; p: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImRect_Add_Vec2';

procedure ImRect_Add_Rect(self: PImRect; r: ImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_Add_Rect';

procedure ImRect_Expand_Float(self: PImRect; const amount: Single); cdecl;
  external PSFML_DLL name _PU + 'ImRect_Expand_Float';

procedure ImRect_Expand_Vec2(self: PImRect; amount: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImRect_Expand_Vec2';

procedure ImRect_Translate(self: PImRect; d: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImRect_Translate';

procedure ImRect_TranslateX(self: PImRect; dx: Single); cdecl;
  external PSFML_DLL name _PU + 'ImRect_TranslateX';

procedure ImRect_TranslateY(self: PImRect; dy: Single); cdecl;
  external PSFML_DLL name _PU + 'ImRect_TranslateY';

procedure ImRect_ClipWith(self: PImRect; r: ImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_ClipWith';

procedure ImRect_ClipWithFull(self: PImRect; r: ImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_ClipWithFull';

procedure ImRect_Floor(self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_Floor';

function ImRect_IsInverted(self: PImRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImRect_IsInverted';

procedure ImRect_ToVec4(pOut: PImVec4; self: PImRect); cdecl;
  external PSFML_DLL name _PU + 'ImRect_ToVec4';

function igImBitArrayGetStorageSizeInBytes(bitcount: Integer): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'igImBitArrayGetStorageSizeInBytes';

procedure igImBitArrayClearAllBits(arr: PImU32; bitcount: Integer); cdecl;
  external PSFML_DLL name _PU + 'igImBitArrayClearAllBits';

function igImBitArrayTestBit(const arr: PImU32; n: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImBitArrayTestBit';

procedure igImBitArrayClearBit(arr: PImU32; n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igImBitArrayClearBit';

procedure igImBitArraySetBit(arr: PImU32; n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igImBitArraySetBit';

procedure igImBitArraySetBitRange(arr: PImU32; n: Integer; n2: Integer); cdecl;
  external PSFML_DLL name _PU + 'igImBitArraySetBitRange';

procedure ImBitVector_Create(self: PImBitVector; sz: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImBitVector_Create';

procedure ImBitVector_Clear(self: PImBitVector); cdecl;
  external PSFML_DLL name _PU + 'ImBitVector_Clear';

function ImBitVector_TestBit(self: PImBitVector; n: Integer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImBitVector_TestBit';

procedure ImBitVector_SetBit(self: PImBitVector; n: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImBitVector_SetBit';

procedure ImBitVector_ClearBit(self: PImBitVector; n: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImBitVector_ClearBit';

procedure ImGuiTextIndex_clear(self: PImGuiTextIndex); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextIndex_clear';

function ImGuiTextIndex_size(self: PImGuiTextIndex): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextIndex_size';

function ImGuiTextIndex_get_line_begin(self: PImGuiTextIndex; const base: PUTF8Char; n: Integer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextIndex_get_line_begin';

function ImGuiTextIndex_get_line_end(self: PImGuiTextIndex; const base: PUTF8Char; n: Integer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextIndex_get_line_end';

procedure ImGuiTextIndex_append(self: PImGuiTextIndex; const base: PUTF8Char; old_size: Integer; new_size: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextIndex_append';

function ImDrawListSharedData_ImDrawListSharedData(): PImDrawListSharedData; cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSharedData_ImDrawListSharedData';

procedure ImDrawListSharedData_destroy(self: PImDrawListSharedData); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSharedData_destroy';

procedure ImDrawListSharedData_SetCircleTessellationMaxError(self: PImDrawListSharedData; max_error: Single); cdecl;
  external PSFML_DLL name _PU + 'ImDrawListSharedData_SetCircleTessellationMaxError';

function ImDrawDataBuilder_ImDrawDataBuilder(): PImDrawDataBuilder; cdecl;
  external PSFML_DLL name _PU + 'ImDrawDataBuilder_ImDrawDataBuilder';

procedure ImDrawDataBuilder_destroy(self: PImDrawDataBuilder); cdecl;
  external PSFML_DLL name _PU + 'ImDrawDataBuilder_destroy';

function ImGuiDataVarInfo_GetVarPtr(self: PImGuiDataVarInfo; parent: Pointer): Pointer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDataVarInfo_GetVarPtr';

function ImGuiStyleMod_ImGuiStyleMod_Int(idx: ImGuiStyleVar; v: Integer): PImGuiStyleMod; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyleMod_ImGuiStyleMod_Int';

procedure ImGuiStyleMod_destroy(self: PImGuiStyleMod); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyleMod_destroy';

function ImGuiStyleMod_ImGuiStyleMod_Float(idx: ImGuiStyleVar; v: Single): PImGuiStyleMod; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyleMod_ImGuiStyleMod_Float';

function ImGuiStyleMod_ImGuiStyleMod_Vec2(idx: ImGuiStyleVar; v: ImVec2): PImGuiStyleMod; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStyleMod_ImGuiStyleMod_Vec2';

function ImGuiComboPreviewData_ImGuiComboPreviewData(): PImGuiComboPreviewData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiComboPreviewData_ImGuiComboPreviewData';

procedure ImGuiComboPreviewData_destroy(self: PImGuiComboPreviewData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiComboPreviewData_destroy';

function ImGuiMenuColumns_ImGuiMenuColumns(): PImGuiMenuColumns; cdecl;
  external PSFML_DLL name _PU + 'ImGuiMenuColumns_ImGuiMenuColumns';

procedure ImGuiMenuColumns_destroy(self: PImGuiMenuColumns); cdecl;
  external PSFML_DLL name _PU + 'ImGuiMenuColumns_destroy';

procedure ImGuiMenuColumns_Update(self: PImGuiMenuColumns; spacing: Single; window_reappearing: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiMenuColumns_Update';

function ImGuiMenuColumns_DeclColumns(self: PImGuiMenuColumns; w_icon: Single; w_label: Single; w_shortcut: Single; w_mark: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'ImGuiMenuColumns_DeclColumns';

procedure ImGuiMenuColumns_CalcNextTotalWidth(self: PImGuiMenuColumns; update_offsets: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGuiMenuColumns_CalcNextTotalWidth';

function ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState(): PImGuiInputTextDeactivatedState; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState';

procedure ImGuiInputTextDeactivatedState_destroy(self: PImGuiInputTextDeactivatedState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextDeactivatedState_destroy';

procedure ImGuiInputTextDeactivatedState_ClearFreeMemory(self: PImGuiInputTextDeactivatedState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextDeactivatedState_ClearFreeMemory';

function ImGuiInputTextState_ImGuiInputTextState(): PImGuiInputTextState; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_ImGuiInputTextState';

procedure ImGuiInputTextState_destroy(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_destroy';

procedure ImGuiInputTextState_ClearText(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_ClearText';

procedure ImGuiInputTextState_ClearFreeMemory(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_ClearFreeMemory';

function ImGuiInputTextState_GetUndoAvailCount(self: PImGuiInputTextState): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_GetUndoAvailCount';

function ImGuiInputTextState_GetRedoAvailCount(self: PImGuiInputTextState): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_GetRedoAvailCount';

procedure ImGuiInputTextState_OnKeyPressed(self: PImGuiInputTextState; key: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_OnKeyPressed';

procedure ImGuiInputTextState_CursorAnimReset(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_CursorAnimReset';

procedure ImGuiInputTextState_CursorClamp(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_CursorClamp';

function ImGuiInputTextState_HasSelection(self: PImGuiInputTextState): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_HasSelection';

procedure ImGuiInputTextState_ClearSelection(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_ClearSelection';

function ImGuiInputTextState_GetCursorPos(self: PImGuiInputTextState): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_GetCursorPos';

function ImGuiInputTextState_GetSelectionStart(self: PImGuiInputTextState): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_GetSelectionStart';

function ImGuiInputTextState_GetSelectionEnd(self: PImGuiInputTextState): Integer; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_GetSelectionEnd';

procedure ImGuiInputTextState_SelectAll(self: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputTextState_SelectAll';

function ImGuiPopupData_ImGuiPopupData(): PImGuiPopupData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPopupData_ImGuiPopupData';

procedure ImGuiPopupData_destroy(self: PImGuiPopupData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPopupData_destroy';

function ImGuiNextWindowData_ImGuiNextWindowData(): PImGuiNextWindowData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiNextWindowData_ImGuiNextWindowData';

procedure ImGuiNextWindowData_destroy(self: PImGuiNextWindowData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiNextWindowData_destroy';

procedure ImGuiNextWindowData_ClearFlags(self: PImGuiNextWindowData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiNextWindowData_ClearFlags';

function ImGuiNextItemData_ImGuiNextItemData(): PImGuiNextItemData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiNextItemData_ImGuiNextItemData';

procedure ImGuiNextItemData_destroy(self: PImGuiNextItemData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiNextItemData_destroy';

procedure ImGuiNextItemData_ClearFlags(self: PImGuiNextItemData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiNextItemData_ClearFlags';

function ImGuiLastItemData_ImGuiLastItemData(): PImGuiLastItemData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiLastItemData_ImGuiLastItemData';

procedure ImGuiLastItemData_destroy(self: PImGuiLastItemData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiLastItemData_destroy';

function ImGuiStackSizes_ImGuiStackSizes(): PImGuiStackSizes; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStackSizes_ImGuiStackSizes';

procedure ImGuiStackSizes_destroy(self: PImGuiStackSizes); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStackSizes_destroy';

procedure ImGuiStackSizes_SetToContextState(self: PImGuiStackSizes; ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStackSizes_SetToContextState';

procedure ImGuiStackSizes_CompareWithContextState(self: PImGuiStackSizes; ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStackSizes_CompareWithContextState';

function ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr: Pointer): PImGuiPtrOrIndex; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr';

procedure ImGuiPtrOrIndex_destroy(self: PImGuiPtrOrIndex); cdecl;
  external PSFML_DLL name _PU + 'ImGuiPtrOrIndex_destroy';

function ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index: Integer): PImGuiPtrOrIndex; cdecl;
  external PSFML_DLL name _PU + 'ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int';

function ImGuiInputEvent_ImGuiInputEvent(): PImGuiInputEvent; cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputEvent_ImGuiInputEvent';

procedure ImGuiInputEvent_destroy(self: PImGuiInputEvent); cdecl;
  external PSFML_DLL name _PU + 'ImGuiInputEvent_destroy';

function ImGuiKeyRoutingData_ImGuiKeyRoutingData(): PImGuiKeyRoutingData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyRoutingData_ImGuiKeyRoutingData';

procedure ImGuiKeyRoutingData_destroy(self: PImGuiKeyRoutingData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyRoutingData_destroy';

function ImGuiKeyRoutingTable_ImGuiKeyRoutingTable(): PImGuiKeyRoutingTable; cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyRoutingTable_ImGuiKeyRoutingTable';

procedure ImGuiKeyRoutingTable_destroy(self: PImGuiKeyRoutingTable); cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyRoutingTable_destroy';

procedure ImGuiKeyRoutingTable_Clear(self: PImGuiKeyRoutingTable); cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyRoutingTable_Clear';

function ImGuiKeyOwnerData_ImGuiKeyOwnerData(): PImGuiKeyOwnerData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyOwnerData_ImGuiKeyOwnerData';

procedure ImGuiKeyOwnerData_destroy(self: PImGuiKeyOwnerData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiKeyOwnerData_destroy';

function ImGuiListClipperRange_FromIndices(min: Integer; max: Integer): ImGuiListClipperRange; cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipperRange_FromIndices';

function ImGuiListClipperRange_FromPositions(y1: Single; y2: Single; off_min: Integer; off_max: Integer): ImGuiListClipperRange; cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipperRange_FromPositions';

function ImGuiListClipperData_ImGuiListClipperData(): PImGuiListClipperData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipperData_ImGuiListClipperData';

procedure ImGuiListClipperData_destroy(self: PImGuiListClipperData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipperData_destroy';

procedure ImGuiListClipperData_Reset(self: PImGuiListClipperData; clipper: PImGuiListClipper); cdecl;
  external PSFML_DLL name _PU + 'ImGuiListClipperData_Reset';

function ImGuiNavItemData_ImGuiNavItemData(): PImGuiNavItemData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiNavItemData_ImGuiNavItemData';

procedure ImGuiNavItemData_destroy(self: PImGuiNavItemData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiNavItemData_destroy';

procedure ImGuiNavItemData_Clear(self: PImGuiNavItemData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiNavItemData_Clear';

function ImGuiTypingSelectState_ImGuiTypingSelectState(): PImGuiTypingSelectState; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTypingSelectState_ImGuiTypingSelectState';

procedure ImGuiTypingSelectState_destroy(self: PImGuiTypingSelectState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTypingSelectState_destroy';

procedure ImGuiTypingSelectState_Clear(self: PImGuiTypingSelectState); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTypingSelectState_Clear';

function ImGuiOldColumnData_ImGuiOldColumnData(): PImGuiOldColumnData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiOldColumnData_ImGuiOldColumnData';

procedure ImGuiOldColumnData_destroy(self: PImGuiOldColumnData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiOldColumnData_destroy';

function ImGuiOldColumns_ImGuiOldColumns(): PImGuiOldColumns; cdecl;
  external PSFML_DLL name _PU + 'ImGuiOldColumns_ImGuiOldColumns';

procedure ImGuiOldColumns_destroy(self: PImGuiOldColumns); cdecl;
  external PSFML_DLL name _PU + 'ImGuiOldColumns_destroy';

function ImGuiDockNode_ImGuiDockNode(id: ImGuiID): PImGuiDockNode; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_ImGuiDockNode';

procedure ImGuiDockNode_destroy(self: PImGuiDockNode); cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_destroy';

function ImGuiDockNode_IsRootNode(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsRootNode';

function ImGuiDockNode_IsDockSpace(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsDockSpace';

function ImGuiDockNode_IsFloatingNode(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsFloatingNode';

function ImGuiDockNode_IsCentralNode(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsCentralNode';

function ImGuiDockNode_IsHiddenTabBar(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsHiddenTabBar';

function ImGuiDockNode_IsNoTabBar(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsNoTabBar';

function ImGuiDockNode_IsSplitNode(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsSplitNode';

function ImGuiDockNode_IsLeafNode(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsLeafNode';

function ImGuiDockNode_IsEmpty(self: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_IsEmpty';

procedure ImGuiDockNode_Rect(pOut: PImRect; self: PImGuiDockNode); cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_Rect';

procedure ImGuiDockNode_SetLocalFlags(self: PImGuiDockNode; flags: ImGuiDockNodeFlags); cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_SetLocalFlags';

procedure ImGuiDockNode_UpdateMergedFlags(self: PImGuiDockNode); cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockNode_UpdateMergedFlags';

function ImGuiDockContext_ImGuiDockContext(): PImGuiDockContext; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockContext_ImGuiDockContext';

procedure ImGuiDockContext_destroy(self: PImGuiDockContext); cdecl;
  external PSFML_DLL name _PU + 'ImGuiDockContext_destroy';

function ImGuiViewportP_ImGuiViewportP(): PImGuiViewportP; cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_ImGuiViewportP';

procedure ImGuiViewportP_destroy(self: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_destroy';

procedure ImGuiViewportP_ClearRequestFlags(self: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_ClearRequestFlags';

procedure ImGuiViewportP_CalcWorkRectPos(pOut: PImVec2; self: PImGuiViewportP; off_min: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_CalcWorkRectPos';

procedure ImGuiViewportP_CalcWorkRectSize(pOut: PImVec2; self: PImGuiViewportP; off_min: ImVec2; off_max: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_CalcWorkRectSize';

procedure ImGuiViewportP_UpdateWorkRect(self: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_UpdateWorkRect';

procedure ImGuiViewportP_GetMainRect(pOut: PImRect; self: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_GetMainRect';

procedure ImGuiViewportP_GetWorkRect(pOut: PImRect; self: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_GetWorkRect';

procedure ImGuiViewportP_GetBuildWorkRect(pOut: PImRect; self: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'ImGuiViewportP_GetBuildWorkRect';

function ImGuiWindowSettings_ImGuiWindowSettings(): PImGuiWindowSettings; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindowSettings_ImGuiWindowSettings';

procedure ImGuiWindowSettings_destroy(self: PImGuiWindowSettings); cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindowSettings_destroy';

function ImGuiWindowSettings_GetName(self: PImGuiWindowSettings): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindowSettings_GetName';

function ImGuiSettingsHandler_ImGuiSettingsHandler(): PImGuiSettingsHandler; cdecl;
  external PSFML_DLL name _PU + 'ImGuiSettingsHandler_ImGuiSettingsHandler';

procedure ImGuiSettingsHandler_destroy(self: PImGuiSettingsHandler); cdecl;
  external PSFML_DLL name _PU + 'ImGuiSettingsHandler_destroy';

function ImGuiDebugAllocInfo_ImGuiDebugAllocInfo(): PImGuiDebugAllocInfo; cdecl;
  external PSFML_DLL name _PU + 'ImGuiDebugAllocInfo_ImGuiDebugAllocInfo';

procedure ImGuiDebugAllocInfo_destroy(self: PImGuiDebugAllocInfo); cdecl;
  external PSFML_DLL name _PU + 'ImGuiDebugAllocInfo_destroy';

function ImGuiStackLevelInfo_ImGuiStackLevelInfo(): PImGuiStackLevelInfo; cdecl;
  external PSFML_DLL name _PU + 'ImGuiStackLevelInfo_ImGuiStackLevelInfo';

procedure ImGuiStackLevelInfo_destroy(self: PImGuiStackLevelInfo); cdecl;
  external PSFML_DLL name _PU + 'ImGuiStackLevelInfo_destroy';

function ImGuiIDStackTool_ImGuiIDStackTool(): PImGuiIDStackTool; cdecl;
  external PSFML_DLL name _PU + 'ImGuiIDStackTool_ImGuiIDStackTool';

procedure ImGuiIDStackTool_destroy(self: PImGuiIDStackTool); cdecl;
  external PSFML_DLL name _PU + 'ImGuiIDStackTool_destroy';

function ImGuiContextHook_ImGuiContextHook(): PImGuiContextHook; cdecl;
  external PSFML_DLL name _PU + 'ImGuiContextHook_ImGuiContextHook';

procedure ImGuiContextHook_destroy(self: PImGuiContextHook); cdecl;
  external PSFML_DLL name _PU + 'ImGuiContextHook_destroy';

function ImGuiContext_ImGuiContext(shared_font_atlas: PImFontAtlas): PImGuiContext; cdecl;
  external PSFML_DLL name _PU + 'ImGuiContext_ImGuiContext';

procedure ImGuiContext_destroy(self: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'ImGuiContext_destroy';

function ImGuiWindow_ImGuiWindow(context: PImGuiContext; const name: PUTF8Char): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_ImGuiWindow';

procedure ImGuiWindow_destroy(self: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_destroy';

function ImGuiWindow_GetID_Str(self: PImGuiWindow; const str: PUTF8Char; const str_end: PUTF8Char): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_GetID_Str';

function ImGuiWindow_GetID_Ptr(self: PImGuiWindow; const ptr: Pointer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_GetID_Ptr';

function ImGuiWindow_GetID_Int(self: PImGuiWindow; n: Integer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_GetID_Int';

function ImGuiWindow_GetIDFromRectangle(self: PImGuiWindow; r_abs: ImRect): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_GetIDFromRectangle';

procedure ImGuiWindow_Rect(pOut: PImRect; self: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_Rect';

function ImGuiWindow_CalcFontSize(self: PImGuiWindow): Single; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_CalcFontSize';

function ImGuiWindow_TitleBarHeight(self: PImGuiWindow): Single; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_TitleBarHeight';

procedure ImGuiWindow_TitleBarRect(pOut: PImRect; self: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_TitleBarRect';

function ImGuiWindow_MenuBarHeight(self: PImGuiWindow): Single; cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_MenuBarHeight';

procedure ImGuiWindow_MenuBarRect(pOut: PImRect; self: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGuiWindow_MenuBarRect';

function ImGuiTabItem_ImGuiTabItem(): PImGuiTabItem; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTabItem_ImGuiTabItem';

procedure ImGuiTabItem_destroy(self: PImGuiTabItem); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTabItem_destroy';

function ImGuiTabBar_ImGuiTabBar(): PImGuiTabBar; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTabBar_ImGuiTabBar';

procedure ImGuiTabBar_destroy(self: PImGuiTabBar); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTabBar_destroy';

function ImGuiTableColumn_ImGuiTableColumn(): PImGuiTableColumn; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableColumn_ImGuiTableColumn';

procedure ImGuiTableColumn_destroy(self: PImGuiTableColumn); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableColumn_destroy';

function ImGuiTableInstanceData_ImGuiTableInstanceData(): PImGuiTableInstanceData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableInstanceData_ImGuiTableInstanceData';

procedure ImGuiTableInstanceData_destroy(self: PImGuiTableInstanceData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableInstanceData_destroy';

function ImGuiTable_ImGuiTable(): PImGuiTable; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTable_ImGuiTable';

procedure ImGuiTable_destroy(self: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTable_destroy';

function ImGuiTableTempData_ImGuiTableTempData(): PImGuiTableTempData; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableTempData_ImGuiTableTempData';

procedure ImGuiTableTempData_destroy(self: PImGuiTableTempData); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableTempData_destroy';

function ImGuiTableColumnSettings_ImGuiTableColumnSettings(): PImGuiTableColumnSettings; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableColumnSettings_ImGuiTableColumnSettings';

procedure ImGuiTableColumnSettings_destroy(self: PImGuiTableColumnSettings); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableColumnSettings_destroy';

function ImGuiTableSettings_ImGuiTableSettings(): PImGuiTableSettings; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableSettings_ImGuiTableSettings';

procedure ImGuiTableSettings_destroy(self: PImGuiTableSettings); cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableSettings_destroy';

function ImGuiTableSettings_GetColumnSettings(self: PImGuiTableSettings): PImGuiTableColumnSettings; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTableSettings_GetColumnSettings';

function igGetCurrentWindowRead(): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igGetCurrentWindowRead';

function igGetCurrentWindow(): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igGetCurrentWindow';

function igFindWindowByID(id: ImGuiID): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igFindWindowByID';

function igFindWindowByName(const name: PUTF8Char): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igFindWindowByName';

procedure igUpdateWindowParentAndRootLinks(window: PImGuiWindow; flags: ImGuiWindowFlags; parent_window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igUpdateWindowParentAndRootLinks';

procedure igCalcWindowNextAutoFitSize(pOut: PImVec2; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igCalcWindowNextAutoFitSize';

function igIsWindowChildOf(window: PImGuiWindow; potential_parent: PImGuiWindow; popup_hierarchy: Boolean; dock_hierarchy: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowChildOf';

function igIsWindowWithinBeginStackOf(window: PImGuiWindow; potential_parent: PImGuiWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowWithinBeginStackOf';

function igIsWindowAbove(potential_above: PImGuiWindow; potential_below: PImGuiWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowAbove';

function igIsWindowNavFocusable(window: PImGuiWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowNavFocusable';

procedure igSetWindowPos_WindowPtr(window: PImGuiWindow; pos: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowPos_WindowPtr';

procedure igSetWindowSize_WindowPtr(window: PImGuiWindow; size: ImVec2; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowSize_WindowPtr';

procedure igSetWindowCollapsed_WindowPtr(window: PImGuiWindow; collapsed: Boolean; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowCollapsed_WindowPtr';

procedure igSetWindowHitTestHole(window: PImGuiWindow; pos: ImVec2; size: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowHitTestHole';

procedure igSetWindowHiddenAndSkipItemsForCurrentFrame(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowHiddenAndSkipItemsForCurrentFrame';

procedure igWindowRectAbsToRel(pOut: PImRect; window: PImGuiWindow; r: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igWindowRectAbsToRel';

procedure igWindowRectRelToAbs(pOut: PImRect; window: PImGuiWindow; r: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igWindowRectRelToAbs';

procedure igWindowPosRelToAbs(pOut: PImVec2; window: PImGuiWindow; p: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igWindowPosRelToAbs';

procedure igFocusWindow(window: PImGuiWindow; flags: ImGuiFocusRequestFlags); cdecl;
  external PSFML_DLL name _PU + 'igFocusWindow';

procedure igFocusTopMostWindowUnderOne(under_this_window: PImGuiWindow; ignore_window: PImGuiWindow; filter_viewport: PImGuiViewport; flags: ImGuiFocusRequestFlags); cdecl;
  external PSFML_DLL name _PU + 'igFocusTopMostWindowUnderOne';

procedure igBringWindowToFocusFront(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igBringWindowToFocusFront';

procedure igBringWindowToDisplayFront(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igBringWindowToDisplayFront';

procedure igBringWindowToDisplayBack(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igBringWindowToDisplayBack';

procedure igBringWindowToDisplayBehind(window: PImGuiWindow; above_window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igBringWindowToDisplayBehind';

function igFindWindowDisplayIndex(window: PImGuiWindow): Integer; cdecl;
  external PSFML_DLL name _PU + 'igFindWindowDisplayIndex';

function igFindBottomMostVisibleWindowWithinBeginStack(window: PImGuiWindow): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igFindBottomMostVisibleWindowWithinBeginStack';

procedure igSetCurrentFont(font: PImFont); cdecl;
  external PSFML_DLL name _PU + 'igSetCurrentFont';

function igGetDefaultFont(): PImFont; cdecl;
  external PSFML_DLL name _PU + 'igGetDefaultFont';

function igGetForegroundDrawList_WindowPtr(window: PImGuiWindow): PImDrawList; cdecl;
  external PSFML_DLL name _PU + 'igGetForegroundDrawList_WindowPtr';

procedure igAddDrawListToDrawDataEx(draw_data: PImDrawData; out_list: PImVector_ImDrawListPtr; draw_list: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'igAddDrawListToDrawDataEx';

procedure igInitialize(); cdecl;
  external PSFML_DLL name _PU + 'igInitialize';

procedure igShutdown(); cdecl;
  external PSFML_DLL name _PU + 'igShutdown';

procedure igUpdateInputEvents(trickle_fast_inputs: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igUpdateInputEvents';

procedure igUpdateHoveredWindowAndCaptureFlags(); cdecl;
  external PSFML_DLL name _PU + 'igUpdateHoveredWindowAndCaptureFlags';

procedure igStartMouseMovingWindow(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igStartMouseMovingWindow';

procedure igStartMouseMovingWindowOrNode(window: PImGuiWindow; node: PImGuiDockNode; undock: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igStartMouseMovingWindowOrNode';

procedure igUpdateMouseMovingWindowNewFrame(); cdecl;
  external PSFML_DLL name _PU + 'igUpdateMouseMovingWindowNewFrame';

procedure igUpdateMouseMovingWindowEndFrame(); cdecl;
  external PSFML_DLL name _PU + 'igUpdateMouseMovingWindowEndFrame';

function igAddContextHook(context: PImGuiContext; const hook: PImGuiContextHook): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igAddContextHook';

procedure igRemoveContextHook(context: PImGuiContext; hook_to_remove: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igRemoveContextHook';

procedure igCallContextHooks(context: PImGuiContext; &type: ImGuiContextHookType); cdecl;
  external PSFML_DLL name _PU + 'igCallContextHooks';

procedure igTranslateWindowsInViewport(viewport: PImGuiViewportP; old_pos: ImVec2; new_pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igTranslateWindowsInViewport';

procedure igScaleWindowsInViewport(viewport: PImGuiViewportP; scale: Single); cdecl;
  external PSFML_DLL name _PU + 'igScaleWindowsInViewport';

procedure igDestroyPlatformWindow(viewport: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'igDestroyPlatformWindow';

procedure igSetWindowViewport(window: PImGuiWindow; viewport: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowViewport';

procedure igSetCurrentViewport(window: PImGuiWindow; viewport: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'igSetCurrentViewport';

function igGetViewportPlatformMonitor(viewport: PImGuiViewport): PImGuiPlatformMonitor; cdecl;
  external PSFML_DLL name _PU + 'igGetViewportPlatformMonitor';

function igFindHoveredViewportFromPlatformWindowStack(mouse_platform_pos: ImVec2): PImGuiViewportP; cdecl;
  external PSFML_DLL name _PU + 'igFindHoveredViewportFromPlatformWindowStack';

procedure igMarkIniSettingsDirty_Nil(); cdecl;
  external PSFML_DLL name _PU + 'igMarkIniSettingsDirty_Nil';

procedure igMarkIniSettingsDirty_WindowPtr(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igMarkIniSettingsDirty_WindowPtr';

procedure igClearIniSettings(); cdecl;
  external PSFML_DLL name _PU + 'igClearIniSettings';

procedure igAddSettingsHandler(const handler: PImGuiSettingsHandler); cdecl;
  external PSFML_DLL name _PU + 'igAddSettingsHandler';

procedure igRemoveSettingsHandler(const type_name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igRemoveSettingsHandler';

function igFindSettingsHandler(const type_name: PUTF8Char): PImGuiSettingsHandler; cdecl;
  external PSFML_DLL name _PU + 'igFindSettingsHandler';

function igCreateNewWindowSettings(const name: PUTF8Char): PImGuiWindowSettings; cdecl;
  external PSFML_DLL name _PU + 'igCreateNewWindowSettings';

function igFindWindowSettingsByID(id: ImGuiID): PImGuiWindowSettings; cdecl;
  external PSFML_DLL name _PU + 'igFindWindowSettingsByID';

function igFindWindowSettingsByWindow(window: PImGuiWindow): PImGuiWindowSettings; cdecl;
  external PSFML_DLL name _PU + 'igFindWindowSettingsByWindow';

procedure igClearWindowSettings(const name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igClearWindowSettings';

procedure igLocalizeRegisterEntries(const entries: PImGuiLocEntry; count: Integer); cdecl;
  external PSFML_DLL name _PU + 'igLocalizeRegisterEntries';

function igLocalizeGetMsg(key: ImGuiLocKey): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igLocalizeGetMsg';

procedure igSetScrollX_WindowPtr(window: PImGuiWindow; scroll_x: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollX_WindowPtr';

procedure igSetScrollY_WindowPtr(window: PImGuiWindow; scroll_y: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollY_WindowPtr';

procedure igSetScrollFromPosX_WindowPtr(window: PImGuiWindow; local_x: Single; center_x_ratio: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollFromPosX_WindowPtr';

procedure igSetScrollFromPosY_WindowPtr(window: PImGuiWindow; local_y: Single; center_y_ratio: Single); cdecl;
  external PSFML_DLL name _PU + 'igSetScrollFromPosY_WindowPtr';

procedure igScrollToItem(flags: ImGuiScrollFlags); cdecl;
  external PSFML_DLL name _PU + 'igScrollToItem';

procedure igScrollToRect(window: PImGuiWindow; rect: ImRect; flags: ImGuiScrollFlags); cdecl;
  external PSFML_DLL name _PU + 'igScrollToRect';

procedure igScrollToRectEx(pOut: PImVec2; window: PImGuiWindow; rect: ImRect; flags: ImGuiScrollFlags); cdecl;
  external PSFML_DLL name _PU + 'igScrollToRectEx';

procedure igScrollToBringRectIntoView(window: PImGuiWindow; rect: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igScrollToBringRectIntoView';

function igGetItemStatusFlags(): ImGuiItemStatusFlags; cdecl;
  external PSFML_DLL name _PU + 'igGetItemStatusFlags';

function igGetItemFlags(): ImGuiItemFlags; cdecl;
  external PSFML_DLL name _PU + 'igGetItemFlags';

function igGetActiveID(): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetActiveID';

function igGetFocusID(): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetFocusID';

procedure igSetActiveID(id: ImGuiID; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igSetActiveID';

procedure igSetFocusID(id: ImGuiID; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igSetFocusID';

procedure igClearActiveID(); cdecl;
  external PSFML_DLL name _PU + 'igClearActiveID';

function igGetHoveredID(): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetHoveredID';

procedure igSetHoveredID(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igSetHoveredID';

procedure igKeepAliveID(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igKeepAliveID';

procedure igMarkItemEdited(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igMarkItemEdited';

procedure igPushOverrideID(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igPushOverrideID';

function igGetIDWithSeed_Str(const str_id_begin: PUTF8Char; const str_id_end: PUTF8Char; seed: ImGuiID): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetIDWithSeed_Str';

function igGetIDWithSeed_Int(n: Integer; seed: ImGuiID): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetIDWithSeed_Int';

procedure igItemSize_Vec2(size: ImVec2; text_baseline_y: Single); cdecl;
  external PSFML_DLL name _PU + 'igItemSize_Vec2';

procedure igItemSize_Rect(bb: ImRect; text_baseline_y: Single); cdecl;
  external PSFML_DLL name _PU + 'igItemSize_Rect';

function igItemAdd(bb: ImRect; id: ImGuiID; const nav_bb: PImRect; extra_flags: ImGuiItemFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igItemAdd';

function igItemHoverable(bb: ImRect; id: ImGuiID; item_flags: ImGuiItemFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igItemHoverable';

function igIsWindowContentHoverable(window: PImGuiWindow; flags: ImGuiHoveredFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsWindowContentHoverable';

function igIsClippedEx(bb: ImRect; id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsClippedEx';

procedure igSetLastItemData(item_id: ImGuiID; in_flags: ImGuiItemFlags; status_flags: ImGuiItemStatusFlags; item_rect: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igSetLastItemData';

procedure igCalcItemSize(pOut: PImVec2; size: ImVec2; default_w: Single; default_h: Single); cdecl;
  external PSFML_DLL name _PU + 'igCalcItemSize';

function igCalcWrapWidthForPos(pos: ImVec2; wrap_pos_x: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igCalcWrapWidthForPos';

procedure igPushMultiItemsWidths(components: Integer; width_full: Single); cdecl;
  external PSFML_DLL name _PU + 'igPushMultiItemsWidths';

function igIsItemToggledSelection(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsItemToggledSelection';

procedure igGetContentRegionMaxAbs(pOut: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igGetContentRegionMaxAbs';

procedure igShrinkWidths(items: PImGuiShrinkWidthItem; count: Integer; width_excess: Single); cdecl;
  external PSFML_DLL name _PU + 'igShrinkWidths';

procedure igPushItemFlag(option: ImGuiItemFlags; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igPushItemFlag';

procedure igPopItemFlag(); cdecl;
  external PSFML_DLL name _PU + 'igPopItemFlag';

function igGetStyleVarInfo(idx: ImGuiStyleVar): PImGuiDataVarInfo; cdecl;
  external PSFML_DLL name _PU + 'igGetStyleVarInfo';

procedure igLogBegin(&type: ImGuiLogType; auto_open_depth: Integer); cdecl;
  external PSFML_DLL name _PU + 'igLogBegin';

procedure igLogToBuffer(auto_open_depth: Integer); cdecl;
  external PSFML_DLL name _PU + 'igLogToBuffer';

procedure igLogRenderedText(const ref_pos: PImVec2; const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igLogRenderedText';

procedure igLogSetNextTextDecoration(const prefix: PUTF8Char; const suffix: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igLogSetNextTextDecoration';

function igBeginChildEx(const name: PUTF8Char; id: ImGuiID; size_arg: ImVec2; child_flags: ImGuiChildFlags; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginChildEx';

procedure igOpenPopupEx(id: ImGuiID; popup_flags: ImGuiPopupFlags); cdecl;
  external PSFML_DLL name _PU + 'igOpenPopupEx';

procedure igClosePopupToLevel(remaining: Integer; restore_focus_to_window_under_popup: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igClosePopupToLevel';

procedure igClosePopupsOverWindow(ref_window: PImGuiWindow; restore_focus_to_window_under_popup: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igClosePopupsOverWindow';

procedure igClosePopupsExceptModals(); cdecl;
  external PSFML_DLL name _PU + 'igClosePopupsExceptModals';

function igIsPopupOpen_ID(id: ImGuiID; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsPopupOpen_ID';

function igBeginPopupEx(id: ImGuiID; extra_flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginPopupEx';

function igBeginTooltipEx(tooltip_flags: ImGuiTooltipFlags; extra_window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTooltipEx';

function igBeginTooltipHidden(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTooltipHidden';

procedure igGetPopupAllowedExtentRect(pOut: PImRect; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igGetPopupAllowedExtentRect';

function igGetTopMostPopupModal(): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igGetTopMostPopupModal';

function igGetTopMostAndVisiblePopupModal(): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igGetTopMostAndVisiblePopupModal';

function igFindBlockingModal(window: PImGuiWindow): PImGuiWindow; cdecl;
  external PSFML_DLL name _PU + 'igFindBlockingModal';

procedure igFindBestWindowPosForPopup(pOut: PImVec2; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igFindBestWindowPosForPopup';

procedure igFindBestWindowPosForPopupEx(pOut: PImVec2; ref_pos: ImVec2; size: ImVec2; last_dir: PImGuiDir; r_outer: ImRect; r_avoid: ImRect; policy: ImGuiPopupPositionPolicy); cdecl;
  external PSFML_DLL name _PU + 'igFindBestWindowPosForPopupEx';

function igBeginViewportSideBar(const name: PUTF8Char; viewport: PImGuiViewport; dir: ImGuiDir; size: Single; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginViewportSideBar';

function igBeginMenuEx(const &label: PUTF8Char; const icon: PUTF8Char; enabled: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginMenuEx';

function igMenuItemEx(const &label: PUTF8Char; const icon: PUTF8Char; const shortcut: PUTF8Char; selected: Boolean; enabled: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igMenuItemEx';

function igBeginComboPopup(popup_id: ImGuiID; bb: ImRect; flags: ImGuiComboFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginComboPopup';

function igBeginComboPreview(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginComboPreview';

procedure igEndComboPreview(); cdecl;
  external PSFML_DLL name _PU + 'igEndComboPreview';

procedure igNavInitWindow(window: PImGuiWindow; force_reinit: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igNavInitWindow';

procedure igNavInitRequestApplyResult(); cdecl;
  external PSFML_DLL name _PU + 'igNavInitRequestApplyResult';

function igNavMoveRequestButNoResultYet(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestButNoResultYet';

procedure igNavMoveRequestSubmit(move_dir: ImGuiDir; clip_dir: ImGuiDir; move_flags: ImGuiNavMoveFlags; scroll_flags: ImGuiScrollFlags); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestSubmit';

procedure igNavMoveRequestForward(move_dir: ImGuiDir; clip_dir: ImGuiDir; move_flags: ImGuiNavMoveFlags; scroll_flags: ImGuiScrollFlags); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestForward';

procedure igNavMoveRequestResolveWithLastItem(result: PImGuiNavItemData); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestResolveWithLastItem';

procedure igNavMoveRequestResolveWithPastTreeNode(result: PImGuiNavItemData; tree_node_data: PImGuiNavTreeNodeData); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestResolveWithPastTreeNode';

procedure igNavMoveRequestCancel(); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestCancel';

procedure igNavMoveRequestApplyResult(); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestApplyResult';

procedure igNavMoveRequestTryWrapping(window: PImGuiWindow; move_flags: ImGuiNavMoveFlags); cdecl;
  external PSFML_DLL name _PU + 'igNavMoveRequestTryWrapping';

procedure igNavClearPreferredPosForAxis(axis: ImGuiAxis); cdecl;
  external PSFML_DLL name _PU + 'igNavClearPreferredPosForAxis';

procedure igNavRestoreHighlightAfterMove(); cdecl;
  external PSFML_DLL name _PU + 'igNavRestoreHighlightAfterMove';

procedure igNavUpdateCurrentWindowIsScrollPushableX(); cdecl;
  external PSFML_DLL name _PU + 'igNavUpdateCurrentWindowIsScrollPushableX';

procedure igSetNavWindow(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igSetNavWindow';

procedure igSetNavID(id: ImGuiID; nav_layer: ImGuiNavLayer; focus_scope_id: ImGuiID; rect_rel: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igSetNavID';

procedure igFocusItem(); cdecl;
  external PSFML_DLL name _PU + 'igFocusItem';

procedure igActivateItemByID(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igActivateItemByID';

function igIsNamedKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsNamedKey';

function igIsNamedKeyOrModKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsNamedKeyOrModKey';

function igIsLegacyKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsLegacyKey';

function igIsKeyboardKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyboardKey';

function igIsGamepadKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsGamepadKey';

function igIsMouseKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseKey';

function igIsAliasKey(key: ImGuiKey): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsAliasKey';

function igConvertShortcutMod(key_chord: ImGuiKeyChord): ImGuiKeyChord; cdecl;
  external PSFML_DLL name _PU + 'igConvertShortcutMod';

function igConvertSingleModFlagToKey(ctx: PImGuiContext; key: ImGuiKey): ImGuiKey; cdecl;
  external PSFML_DLL name _PU + 'igConvertSingleModFlagToKey';

function igGetKeyData_ContextPtr(ctx: PImGuiContext; key: ImGuiKey): PImGuiKeyData; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyData_ContextPtr';

function igGetKeyData_Key(key: ImGuiKey): PImGuiKeyData; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyData_Key';

function igGetKeyChordName(key_chord: ImGuiKeyChord; out_buf: PUTF8Char; out_buf_size: Integer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyChordName';

function igMouseButtonToKey(button: ImGuiMouseButton): ImGuiKey; cdecl;
  external PSFML_DLL name _PU + 'igMouseButtonToKey';

function igIsMouseDragPastThreshold(button: ImGuiMouseButton; lock_threshold: Single): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseDragPastThreshold';

procedure igGetKeyMagnitude2d(pOut: PImVec2; key_left: ImGuiKey; key_right: ImGuiKey; key_up: ImGuiKey; key_down: ImGuiKey); cdecl;
  external PSFML_DLL name _PU + 'igGetKeyMagnitude2d';

function igGetNavTweakPressedAmount(axis: ImGuiAxis): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetNavTweakPressedAmount';

function igCalcTypematicRepeatAmount(t0: Single; t1: Single; repeat_delay: Single; repeat_rate: Single): Integer; cdecl;
  external PSFML_DLL name _PU + 'igCalcTypematicRepeatAmount';

procedure igGetTypematicRepeatRate(flags: ImGuiInputFlags; repeat_delay: PSingle; repeat_rate: PSingle); cdecl;
  external PSFML_DLL name _PU + 'igGetTypematicRepeatRate';

procedure igTeleportMousePos(pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igTeleportMousePos';

procedure igSetActiveIdUsingAllKeyboardKeys(); cdecl;
  external PSFML_DLL name _PU + 'igSetActiveIdUsingAllKeyboardKeys';

function igIsActiveIdUsingNavDir(dir: ImGuiDir): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsActiveIdUsingNavDir';

function igGetKeyOwner(key: ImGuiKey): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyOwner';

procedure igSetKeyOwner(key: ImGuiKey; owner_id: ImGuiID; flags: ImGuiInputFlags); cdecl;
  external PSFML_DLL name _PU + 'igSetKeyOwner';

procedure igSetKeyOwnersForKeyChord(key: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags); cdecl;
  external PSFML_DLL name _PU + 'igSetKeyOwnersForKeyChord';

procedure igSetItemKeyOwner(key: ImGuiKey; flags: ImGuiInputFlags); cdecl;
  external PSFML_DLL name _PU + 'igSetItemKeyOwner';

function igTestKeyOwner(key: ImGuiKey; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTestKeyOwner';

function igGetKeyOwnerData(ctx: PImGuiContext; key: ImGuiKey): PImGuiKeyOwnerData; cdecl;
  external PSFML_DLL name _PU + 'igGetKeyOwnerData';

function igIsKeyDown_ID(key: ImGuiKey; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyDown_ID';

function igIsKeyPressed_ID(key: ImGuiKey; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyPressed_ID';

function igIsKeyReleased_ID(key: ImGuiKey; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyReleased_ID';

function igIsMouseDown_ID(button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseDown_ID';

function igIsMouseClicked_ID(button: ImGuiMouseButton; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseClicked_ID';

function igIsMouseReleased_ID(button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseReleased_ID';

function igIsMouseDoubleClicked_ID(button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsMouseDoubleClicked_ID';

function igIsKeyChordPressed_ID(key_chord: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsKeyChordPressed_ID';

function igShortcut(key_chord: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igShortcut';

function igSetShortcutRouting(key_chord: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSetShortcutRouting';

function igTestShortcutRouting(key_chord: ImGuiKeyChord; owner_id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTestShortcutRouting';

function igGetShortcutRoutingData(key_chord: ImGuiKeyChord): PImGuiKeyRoutingData; cdecl;
  external PSFML_DLL name _PU + 'igGetShortcutRoutingData';

procedure igDockContextInitialize(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDockContextInitialize';

procedure igDockContextShutdown(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDockContextShutdown';

procedure igDockContextClearNodes(ctx: PImGuiContext; root_id: ImGuiID; clear_settings_refs: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igDockContextClearNodes';

procedure igDockContextRebuildNodes(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDockContextRebuildNodes';

procedure igDockContextNewFrameUpdateUndocking(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDockContextNewFrameUpdateUndocking';

procedure igDockContextNewFrameUpdateDocking(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDockContextNewFrameUpdateDocking';

procedure igDockContextEndFrame(ctx: PImGuiContext); cdecl;
  external PSFML_DLL name _PU + 'igDockContextEndFrame';

function igDockContextGenNodeID(ctx: PImGuiContext): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igDockContextGenNodeID';

procedure igDockContextQueueDock(ctx: PImGuiContext; target: PImGuiWindow; target_node: PImGuiDockNode; payload: PImGuiWindow; split_dir: ImGuiDir; split_ratio: Single; split_outer: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igDockContextQueueDock';

procedure igDockContextQueueUndockWindow(ctx: PImGuiContext; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igDockContextQueueUndockWindow';

procedure igDockContextQueueUndockNode(ctx: PImGuiContext; node: PImGuiDockNode); cdecl;
  external PSFML_DLL name _PU + 'igDockContextQueueUndockNode';

procedure igDockContextProcessUndockWindow(ctx: PImGuiContext; window: PImGuiWindow; clear_persistent_docking_ref: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igDockContextProcessUndockWindow';

procedure igDockContextProcessUndockNode(ctx: PImGuiContext; node: PImGuiDockNode); cdecl;
  external PSFML_DLL name _PU + 'igDockContextProcessUndockNode';

function igDockContextCalcDropPosForDocking(target: PImGuiWindow; target_node: PImGuiDockNode; payload_window: PImGuiWindow; payload_node: PImGuiDockNode; split_dir: ImGuiDir; split_outer: Boolean; out_pos: PImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDockContextCalcDropPosForDocking';

function igDockContextFindNodeByID(ctx: PImGuiContext; id: ImGuiID): PImGuiDockNode; cdecl;
  external PSFML_DLL name _PU + 'igDockContextFindNodeByID';

procedure igDockNodeWindowMenuHandler_Default(ctx: PImGuiContext; node: PImGuiDockNode; tab_bar: PImGuiTabBar); cdecl;
  external PSFML_DLL name _PU + 'igDockNodeWindowMenuHandler_Default';

function igDockNodeBeginAmendTabBar(node: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDockNodeBeginAmendTabBar';

procedure igDockNodeEndAmendTabBar(); cdecl;
  external PSFML_DLL name _PU + 'igDockNodeEndAmendTabBar';

function igDockNodeGetRootNode(node: PImGuiDockNode): PImGuiDockNode; cdecl;
  external PSFML_DLL name _PU + 'igDockNodeGetRootNode';

function igDockNodeIsInHierarchyOf(node: PImGuiDockNode; parent: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDockNodeIsInHierarchyOf';

function igDockNodeGetDepth(const node: PImGuiDockNode): Integer; cdecl;
  external PSFML_DLL name _PU + 'igDockNodeGetDepth';

function igDockNodeGetWindowMenuButtonId(const node: PImGuiDockNode): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igDockNodeGetWindowMenuButtonId';

function igGetWindowDockNode(): PImGuiDockNode; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowDockNode';

function igGetWindowAlwaysWantOwnTabBar(window: PImGuiWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowAlwaysWantOwnTabBar';

procedure igBeginDocked(window: PImGuiWindow; p_open: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igBeginDocked';

procedure igBeginDockableDragDropSource(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igBeginDockableDragDropSource';

procedure igBeginDockableDragDropTarget(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igBeginDockableDragDropTarget';

procedure igSetWindowDock(window: PImGuiWindow; dock_id: ImGuiID; cond: ImGuiCond); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowDock';

procedure igDockBuilderDockWindow(const window_name: PUTF8Char; node_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderDockWindow';

function igDockBuilderGetNode(node_id: ImGuiID): PImGuiDockNode; cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderGetNode';

function igDockBuilderGetCentralNode(node_id: ImGuiID): PImGuiDockNode; cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderGetCentralNode';

function igDockBuilderAddNode(node_id: ImGuiID; flags: ImGuiDockNodeFlags): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderAddNode';

procedure igDockBuilderRemoveNode(node_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderRemoveNode';

procedure igDockBuilderRemoveNodeDockedWindows(node_id: ImGuiID; clear_settings_refs: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderRemoveNodeDockedWindows';

procedure igDockBuilderRemoveNodeChildNodes(node_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderRemoveNodeChildNodes';

procedure igDockBuilderSetNodePos(node_id: ImGuiID; pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderSetNodePos';

procedure igDockBuilderSetNodeSize(node_id: ImGuiID; size: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderSetNodeSize';

function igDockBuilderSplitNode(node_id: ImGuiID; split_dir: ImGuiDir; size_ratio_for_node_at_dir: Single; out_id_at_dir: PImGuiID; out_id_at_opposite_dir: PImGuiID): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderSplitNode';

procedure igDockBuilderCopyDockSpace(src_dockspace_id: ImGuiID; dst_dockspace_id: ImGuiID; in_window_remap_pairs: PImVector_const_charPtr); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderCopyDockSpace';

procedure igDockBuilderCopyNode(src_node_id: ImGuiID; dst_node_id: ImGuiID; out_node_remap_pairs: PImVector_ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderCopyNode';

procedure igDockBuilderCopyWindowSettings(const src_name: PUTF8Char; const dst_name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderCopyWindowSettings';

procedure igDockBuilderFinish(node_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDockBuilderFinish';

procedure igPushFocusScope(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igPushFocusScope';

procedure igPopFocusScope(); cdecl;
  external PSFML_DLL name _PU + 'igPopFocusScope';

function igGetCurrentFocusScope(): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetCurrentFocusScope';

function igIsDragDropActive(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsDragDropActive';

function igBeginDragDropTargetCustom(bb: ImRect; id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginDragDropTargetCustom';

procedure igClearDragDrop(); cdecl;
  external PSFML_DLL name _PU + 'igClearDragDrop';

function igIsDragDropPayloadBeingAccepted(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igIsDragDropPayloadBeingAccepted';

procedure igRenderDragDropTargetRect(bb: ImRect; item_clip_rect: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igRenderDragDropTargetRect';

function igGetTypingSelectRequest(flags: ImGuiTypingSelectFlags): PImGuiTypingSelectRequest; cdecl;
  external PSFML_DLL name _PU + 'igGetTypingSelectRequest';

type
  igTypingSelectFindMatch_get_item_name_func = function(p1: Pointer; p2: Integer): PUTF8Char; cdecl;

function igTypingSelectFindMatch(req: PImGuiTypingSelectRequest; items_count: Integer; get_item_name_func: igTypingSelectFindMatch_get_item_name_func; user_data: Pointer; nav_item_idx: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTypingSelectFindMatch';

type
  igTypingSelectFindNextSingleCharMatch_get_item_name_func = function(p1: Pointer; p2: Integer): PUTF8Char; cdecl;

function igTypingSelectFindNextSingleCharMatch(req: PImGuiTypingSelectRequest; items_count: Integer; get_item_name_func: igTypingSelectFindNextSingleCharMatch_get_item_name_func; user_data: Pointer; nav_item_idx: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTypingSelectFindNextSingleCharMatch';

type
  igTypingSelectFindBestLeadingMatch_get_item_name_func = function(p1: Pointer; p2: Integer): PUTF8Char; cdecl;

function igTypingSelectFindBestLeadingMatch(req: PImGuiTypingSelectRequest; items_count: Integer; get_item_name_func: igTypingSelectFindBestLeadingMatch_get_item_name_func; user_data: Pointer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTypingSelectFindBestLeadingMatch';

procedure igSetWindowClipRectBeforeSetChannel(window: PImGuiWindow; clip_rect: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igSetWindowClipRectBeforeSetChannel';

procedure igBeginColumns(const str_id: PUTF8Char; count: Integer; flags: ImGuiOldColumnFlags); cdecl;
  external PSFML_DLL name _PU + 'igBeginColumns';

procedure igEndColumns(); cdecl;
  external PSFML_DLL name _PU + 'igEndColumns';

procedure igPushColumnClipRect(column_index: Integer); cdecl;
  external PSFML_DLL name _PU + 'igPushColumnClipRect';

procedure igPushColumnsBackground(); cdecl;
  external PSFML_DLL name _PU + 'igPushColumnsBackground';

procedure igPopColumnsBackground(); cdecl;
  external PSFML_DLL name _PU + 'igPopColumnsBackground';

function igGetColumnsID(const str_id: PUTF8Char; count: Integer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnsID';

function igFindOrCreateColumns(window: PImGuiWindow; id: ImGuiID): PImGuiOldColumns; cdecl;
  external PSFML_DLL name _PU + 'igFindOrCreateColumns';

function igGetColumnOffsetFromNorm(const columns: PImGuiOldColumns; offset_norm: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnOffsetFromNorm';

function igGetColumnNormFromOffset(const columns: PImGuiOldColumns; offset: Single): Single; cdecl;
  external PSFML_DLL name _PU + 'igGetColumnNormFromOffset';

procedure igTableOpenContextMenu(column_n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableOpenContextMenu';

procedure igTableSetColumnWidth(column_n: Integer; width: Single); cdecl;
  external PSFML_DLL name _PU + 'igTableSetColumnWidth';

procedure igTableSetColumnSortDirection(column_n: Integer; sort_direction: ImGuiSortDirection; append_to_sort_specs: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igTableSetColumnSortDirection';

function igTableGetHoveredColumn(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTableGetHoveredColumn';

function igTableGetHoveredRow(): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTableGetHoveredRow';

function igTableGetHeaderRowHeight(): Single; cdecl;
  external PSFML_DLL name _PU + 'igTableGetHeaderRowHeight';

function igTableGetHeaderAngledMaxLabelWidth(): Single; cdecl;
  external PSFML_DLL name _PU + 'igTableGetHeaderAngledMaxLabelWidth';

procedure igTablePushBackgroundChannel(); cdecl;
  external PSFML_DLL name _PU + 'igTablePushBackgroundChannel';

procedure igTablePopBackgroundChannel(); cdecl;
  external PSFML_DLL name _PU + 'igTablePopBackgroundChannel';

procedure igTableAngledHeadersRowEx(angle: Single; label_width: Single); cdecl;
  external PSFML_DLL name _PU + 'igTableAngledHeadersRowEx';

function igGetCurrentTable(): PImGuiTable; cdecl;
  external PSFML_DLL name _PU + 'igGetCurrentTable';

function igTableFindByID(id: ImGuiID): PImGuiTable; cdecl;
  external PSFML_DLL name _PU + 'igTableFindByID';

function igBeginTableEx(const name: PUTF8Char; id: ImGuiID; columns_count: Integer; flags: ImGuiTableFlags; outer_size: ImVec2; inner_width: Single): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTableEx';

procedure igTableBeginInitMemory(table: PImGuiTable; columns_count: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableBeginInitMemory';

procedure igTableBeginApplyRequests(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableBeginApplyRequests';

procedure igTableSetupDrawChannels(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableSetupDrawChannels';

procedure igTableUpdateLayout(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableUpdateLayout';

procedure igTableUpdateBorders(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableUpdateBorders';

procedure igTableUpdateColumnsWeightFromWidth(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableUpdateColumnsWeightFromWidth';

procedure igTableDrawBorders(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableDrawBorders';

procedure igTableDrawDefaultContextMenu(table: PImGuiTable; flags_for_section_to_display: ImGuiTableFlags); cdecl;
  external PSFML_DLL name _PU + 'igTableDrawDefaultContextMenu';

function igTableBeginContextMenuPopup(table: PImGuiTable): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTableBeginContextMenuPopup';

procedure igTableMergeDrawChannels(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableMergeDrawChannels';

function igTableGetInstanceData(table: PImGuiTable; instance_no: Integer): PImGuiTableInstanceData; cdecl;
  external PSFML_DLL name _PU + 'igTableGetInstanceData';

function igTableGetInstanceID(table: PImGuiTable; instance_no: Integer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igTableGetInstanceID';

procedure igTableSortSpecsSanitize(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableSortSpecsSanitize';

procedure igTableSortSpecsBuild(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableSortSpecsBuild';

function igTableGetColumnNextSortDirection(column: PImGuiTableColumn): ImGuiSortDirection; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnNextSortDirection';

procedure igTableFixColumnSortDirection(table: PImGuiTable; column: PImGuiTableColumn); cdecl;
  external PSFML_DLL name _PU + 'igTableFixColumnSortDirection';

function igTableGetColumnWidthAuto(table: PImGuiTable; column: PImGuiTableColumn): Single; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnWidthAuto';

procedure igTableBeginRow(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableBeginRow';

procedure igTableEndRow(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableEndRow';

procedure igTableBeginCell(table: PImGuiTable; column_n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableBeginCell';

procedure igTableEndCell(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableEndCell';

procedure igTableGetCellBgRect(pOut: PImRect; const table: PImGuiTable; column_n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableGetCellBgRect';

function igTableGetColumnName_TablePtr(const table: PImGuiTable; column_n: Integer): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnName_TablePtr';

function igTableGetColumnResizeID(table: PImGuiTable; column_n: Integer; instance_no: Integer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igTableGetColumnResizeID';

function igTableGetMaxColumnWidth(const table: PImGuiTable; column_n: Integer): Single; cdecl;
  external PSFML_DLL name _PU + 'igTableGetMaxColumnWidth';

procedure igTableSetColumnWidthAutoSingle(table: PImGuiTable; column_n: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTableSetColumnWidthAutoSingle';

procedure igTableSetColumnWidthAutoAll(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableSetColumnWidthAutoAll';

procedure igTableRemove(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableRemove';

procedure igTableGcCompactTransientBuffers_TablePtr(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableGcCompactTransientBuffers_TablePtr';

procedure igTableGcCompactTransientBuffers_TableTempDataPtr(table: PImGuiTableTempData); cdecl;
  external PSFML_DLL name _PU + 'igTableGcCompactTransientBuffers_TableTempDataPtr';

procedure igTableGcCompactSettings(); cdecl;
  external PSFML_DLL name _PU + 'igTableGcCompactSettings';

procedure igTableLoadSettings(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableLoadSettings';

procedure igTableSaveSettings(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableSaveSettings';

procedure igTableResetSettings(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igTableResetSettings';

function igTableGetBoundSettings(table: PImGuiTable): PImGuiTableSettings; cdecl;
  external PSFML_DLL name _PU + 'igTableGetBoundSettings';

procedure igTableSettingsAddSettingsHandler(); cdecl;
  external PSFML_DLL name _PU + 'igTableSettingsAddSettingsHandler';

function igTableSettingsCreate(id: ImGuiID; columns_count: Integer): PImGuiTableSettings; cdecl;
  external PSFML_DLL name _PU + 'igTableSettingsCreate';

function igTableSettingsFindByID(id: ImGuiID): PImGuiTableSettings; cdecl;
  external PSFML_DLL name _PU + 'igTableSettingsFindByID';

function igGetCurrentTabBar(): PImGuiTabBar; cdecl;
  external PSFML_DLL name _PU + 'igGetCurrentTabBar';

function igBeginTabBarEx(tab_bar: PImGuiTabBar; bb: ImRect; flags: ImGuiTabBarFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igBeginTabBarEx';

function igTabBarFindTabByID(tab_bar: PImGuiTabBar; tab_id: ImGuiID): PImGuiTabItem; cdecl;
  external PSFML_DLL name _PU + 'igTabBarFindTabByID';

function igTabBarFindTabByOrder(tab_bar: PImGuiTabBar; order: Integer): PImGuiTabItem; cdecl;
  external PSFML_DLL name _PU + 'igTabBarFindTabByOrder';

function igTabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar: PImGuiTabBar): PImGuiTabItem; cdecl;
  external PSFML_DLL name _PU + 'igTabBarFindMostRecentlySelectedTabForActiveWindow';

function igTabBarGetCurrentTab(tab_bar: PImGuiTabBar): PImGuiTabItem; cdecl;
  external PSFML_DLL name _PU + 'igTabBarGetCurrentTab';

function igTabBarGetTabOrder(tab_bar: PImGuiTabBar; tab: PImGuiTabItem): Integer; cdecl;
  external PSFML_DLL name _PU + 'igTabBarGetTabOrder';

function igTabBarGetTabName(tab_bar: PImGuiTabBar; tab: PImGuiTabItem): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igTabBarGetTabName';

procedure igTabBarAddTab(tab_bar: PImGuiTabBar; tab_flags: ImGuiTabItemFlags; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igTabBarAddTab';

procedure igTabBarRemoveTab(tab_bar: PImGuiTabBar; tab_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igTabBarRemoveTab';

procedure igTabBarCloseTab(tab_bar: PImGuiTabBar; tab: PImGuiTabItem); cdecl;
  external PSFML_DLL name _PU + 'igTabBarCloseTab';

procedure igTabBarQueueFocus(tab_bar: PImGuiTabBar; tab: PImGuiTabItem); cdecl;
  external PSFML_DLL name _PU + 'igTabBarQueueFocus';

procedure igTabBarQueueReorder(tab_bar: PImGuiTabBar; tab: PImGuiTabItem; offset: Integer); cdecl;
  external PSFML_DLL name _PU + 'igTabBarQueueReorder';

procedure igTabBarQueueReorderFromMousePos(tab_bar: PImGuiTabBar; tab: PImGuiTabItem; mouse_pos: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igTabBarQueueReorderFromMousePos';

function igTabBarProcessReorder(tab_bar: PImGuiTabBar): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTabBarProcessReorder';

function igTabItemEx(tab_bar: PImGuiTabBar; const &label: PUTF8Char; p_open: PBoolean; flags: ImGuiTabItemFlags; docked_window: PImGuiWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTabItemEx';

procedure igTabItemCalcSize_Str(pOut: PImVec2; const &label: PUTF8Char; has_close_button_or_unsaved_marker: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igTabItemCalcSize_Str';

procedure igTabItemCalcSize_WindowPtr(pOut: PImVec2; window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igTabItemCalcSize_WindowPtr';

procedure igTabItemBackground(draw_list: PImDrawList; bb: ImRect; flags: ImGuiTabItemFlags; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igTabItemBackground';

procedure igTabItemLabelAndCloseButton(draw_list: PImDrawList; bb: ImRect; flags: ImGuiTabItemFlags; frame_padding: ImVec2; const &label: PUTF8Char; tab_id: ImGuiID; close_button_id: ImGuiID; is_contents_visible: Boolean; out_just_closed: PBoolean; out_text_clipped: PBoolean); cdecl;
  external PSFML_DLL name _PU + 'igTabItemLabelAndCloseButton';

procedure igRenderText(pos: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; hide_text_after_hash: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igRenderText';

procedure igRenderTextWrapped(pos: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderTextWrapped';

procedure igRenderTextClipped(pos_min: ImVec2; pos_max: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; const text_size_if_known: PImVec2; align: ImVec2; const clip_rect: PImRect); cdecl;
  external PSFML_DLL name _PU + 'igRenderTextClipped';

procedure igRenderTextClippedEx(draw_list: PImDrawList; pos_min: ImVec2; pos_max: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; const text_size_if_known: PImVec2; align: ImVec2; const clip_rect: PImRect); cdecl;
  external PSFML_DLL name _PU + 'igRenderTextClippedEx';

procedure igRenderTextEllipsis(draw_list: PImDrawList; pos_min: ImVec2; pos_max: ImVec2; clip_max_x: Single; ellipsis_max_x: Single; const text: PUTF8Char; const text_end: PUTF8Char; const text_size_if_known: PImVec2); cdecl;
  external PSFML_DLL name _PU + 'igRenderTextEllipsis';

procedure igRenderFrame(p_min: ImVec2; p_max: ImVec2; fill_col: ImU32; border: Boolean; rounding: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderFrame';

procedure igRenderFrameBorder(p_min: ImVec2; p_max: ImVec2; rounding: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderFrameBorder';

procedure igRenderColorRectWithAlphaCheckerboard(draw_list: PImDrawList; p_min: ImVec2; p_max: ImVec2; fill_col: ImU32; grid_step: Single; grid_off: ImVec2; rounding: Single; flags: ImDrawFlags); cdecl;
  external PSFML_DLL name _PU + 'igRenderColorRectWithAlphaCheckerboard';

procedure igRenderNavHighlight(bb: ImRect; id: ImGuiID; flags: ImGuiNavHighlightFlags); cdecl;
  external PSFML_DLL name _PU + 'igRenderNavHighlight';

function igFindRenderedTextEnd(const text: PUTF8Char; const text_end: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'igFindRenderedTextEnd';

procedure igRenderMouseCursor(pos: ImVec2; scale: Single; mouse_cursor: ImGuiMouseCursor; col_fill: ImU32; col_border: ImU32; col_shadow: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igRenderMouseCursor';

procedure igRenderArrow(draw_list: PImDrawList; pos: ImVec2; col: ImU32; dir: ImGuiDir; scale: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderArrow';

procedure igRenderBullet(draw_list: PImDrawList; pos: ImVec2; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igRenderBullet';

procedure igRenderCheckMark(draw_list: PImDrawList; pos: ImVec2; col: ImU32; sz: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderCheckMark';

procedure igRenderArrowPointingAt(draw_list: PImDrawList; pos: ImVec2; half_sz: ImVec2; direction: ImGuiDir; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igRenderArrowPointingAt';

procedure igRenderArrowDockMenu(draw_list: PImDrawList; p_min: ImVec2; sz: Single; col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igRenderArrowDockMenu';

procedure igRenderRectFilledRangeH(draw_list: PImDrawList; rect: ImRect; col: ImU32; x_start_norm: Single; x_end_norm: Single; rounding: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderRectFilledRangeH';

procedure igRenderRectFilledWithHole(draw_list: PImDrawList; outer: ImRect; inner: ImRect; col: ImU32; rounding: Single); cdecl;
  external PSFML_DLL name _PU + 'igRenderRectFilledWithHole';

function igCalcRoundingFlagsForRectInRect(r_in: ImRect; r_outer: ImRect; threshold: Single): ImDrawFlags; cdecl;
  external PSFML_DLL name _PU + 'igCalcRoundingFlagsForRectInRect';

procedure igTextEx(const text: PUTF8Char; const text_end: PUTF8Char; flags: ImGuiTextFlags); cdecl;
  external PSFML_DLL name _PU + 'igTextEx';

function igButtonEx(const &label: PUTF8Char; size_arg: ImVec2; flags: ImGuiButtonFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igButtonEx';

function igArrowButtonEx(const str_id: PUTF8Char; dir: ImGuiDir; size_arg: ImVec2; flags: ImGuiButtonFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igArrowButtonEx';

function igImageButtonEx(id: ImGuiID; texture_id: ImTextureID; image_size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4; flags: ImGuiButtonFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igImageButtonEx';

procedure igSeparatorEx(flags: ImGuiSeparatorFlags; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'igSeparatorEx';

procedure igSeparatorTextEx(id: ImGuiID; const &label: PUTF8Char; const label_end: PUTF8Char; extra_width: Single); cdecl;
  external PSFML_DLL name _PU + 'igSeparatorTextEx';

function igCheckboxFlags_S64Ptr(const &label: PUTF8Char; flags: PImS64; flags_value: ImS64): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCheckboxFlags_S64Ptr';

function igCheckboxFlags_U64Ptr(const &label: PUTF8Char; flags: PImU64; flags_value: ImU64): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCheckboxFlags_U64Ptr';

function igCloseButton(id: ImGuiID; pos: ImVec2): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCloseButton';

function igCollapseButton(id: ImGuiID; pos: ImVec2; dock_node: PImGuiDockNode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igCollapseButton';

procedure igScrollbar(axis: ImGuiAxis); cdecl;
  external PSFML_DLL name _PU + 'igScrollbar';

function igScrollbarEx(bb: ImRect; id: ImGuiID; axis: ImGuiAxis; p_scroll_v: PImS64; avail_v: ImS64; contents_v: ImS64; flags: ImDrawFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igScrollbarEx';

procedure igGetWindowScrollbarRect(pOut: PImRect; window: PImGuiWindow; axis: ImGuiAxis); cdecl;
  external PSFML_DLL name _PU + 'igGetWindowScrollbarRect';

function igGetWindowScrollbarID(window: PImGuiWindow; axis: ImGuiAxis): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowScrollbarID';

function igGetWindowResizeCornerID(window: PImGuiWindow; n: Integer): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowResizeCornerID';

function igGetWindowResizeBorderID(window: PImGuiWindow; dir: ImGuiDir): ImGuiID; cdecl;
  external PSFML_DLL name _PU + 'igGetWindowResizeBorderID';

function igButtonBehavior(bb: ImRect; id: ImGuiID; out_hovered: PBoolean; out_held: PBoolean; flags: ImGuiButtonFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igButtonBehavior';

function igDragBehavior(id: ImGuiID; data_type: ImGuiDataType; p_v: Pointer; v_speed: Single; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDragBehavior';

function igSliderBehavior(bb: ImRect; id: ImGuiID; data_type: ImGuiDataType; p_v: Pointer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags; out_grab_bb: PImRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSliderBehavior';

function igSplitterBehavior(bb: ImRect; id: ImGuiID; axis: ImGuiAxis; size1: PSingle; size2: PSingle; min_size1: Single; min_size2: Single; hover_extend: Single; hover_visibility_delay: Single; bg_col: ImU32): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igSplitterBehavior';

function igTreeNodeBehavior(id: ImGuiID; flags: ImGuiTreeNodeFlags; const &label: PUTF8Char; const label_end: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeBehavior';

procedure igTreePushOverrideID(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igTreePushOverrideID';

procedure igTreeNodeSetOpen(id: ImGuiID; open: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeSetOpen';

function igTreeNodeUpdateNextOpen(id: ImGuiID; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTreeNodeUpdateNextOpen';

procedure igSetNextItemSelectionUserData(selection_user_data: ImGuiSelectionUserData); cdecl;
  external PSFML_DLL name _PU + 'igSetNextItemSelectionUserData';

function igDataTypeGetInfo(data_type: ImGuiDataType): PImGuiDataTypeInfo; cdecl;
  external PSFML_DLL name _PU + 'igDataTypeGetInfo';

function igDataTypeFormatString(buf: PUTF8Char; buf_size: Integer; data_type: ImGuiDataType; const p_data: Pointer; const format: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'igDataTypeFormatString';

procedure igDataTypeApplyOp(data_type: ImGuiDataType; op: Integer; output: Pointer; const arg_1: Pointer; const arg_2: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igDataTypeApplyOp';

function igDataTypeApplyFromText(const buf: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const format: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDataTypeApplyFromText';

function igDataTypeCompare(data_type: ImGuiDataType; const arg_1: Pointer; const arg_2: Pointer): Integer; cdecl;
  external PSFML_DLL name _PU + 'igDataTypeCompare';

function igDataTypeClamp(data_type: ImGuiDataType; p_data: Pointer; const p_min: Pointer; const p_max: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDataTypeClamp';

function igInputTextEx(const &label: PUTF8Char; const hint: PUTF8Char; buf: PUTF8Char; buf_size: Integer; size_arg: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igInputTextEx';

procedure igInputTextDeactivateHook(id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igInputTextDeactivateHook';

function igTempInputText(bb: ImRect; id: ImGuiID; const &label: PUTF8Char; buf: PUTF8Char; buf_size: Integer; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTempInputText';

function igTempInputScalar(bb: ImRect; id: ImGuiID; const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const format: PUTF8Char; const p_clamp_min: Pointer; const p_clamp_max: Pointer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTempInputScalar';

function igTempInputIsActive(id: ImGuiID): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igTempInputIsActive';

function igGetInputTextState(id: ImGuiID): PImGuiInputTextState; cdecl;
  external PSFML_DLL name _PU + 'igGetInputTextState';

procedure igColorTooltip(const text: PUTF8Char; const col: PSingle; flags: ImGuiColorEditFlags); cdecl;
  external PSFML_DLL name _PU + 'igColorTooltip';

procedure igColorEditOptionsPopup(const col: PSingle; flags: ImGuiColorEditFlags); cdecl;
  external PSFML_DLL name _PU + 'igColorEditOptionsPopup';

procedure igColorPickerOptionsPopup(const ref_col: PSingle; flags: ImGuiColorEditFlags); cdecl;
  external PSFML_DLL name _PU + 'igColorPickerOptionsPopup';

type
  igPlotEx_values_getter = function(data: Pointer; idx: Integer): Single; cdecl;

function igPlotEx(plot_type: ImGuiPlotType; const &label: PUTF8Char; values_getter: igPlotEx_values_getter; data: Pointer; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; size_arg: ImVec2): Integer; cdecl;
  external PSFML_DLL name _PU + 'igPlotEx';

procedure igShadeVertsLinearColorGradientKeepAlpha(draw_list: PImDrawList; vert_start_idx: Integer; vert_end_idx: Integer; gradient_p0: ImVec2; gradient_p1: ImVec2; col0: ImU32; col1: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igShadeVertsLinearColorGradientKeepAlpha';

procedure igShadeVertsLinearUV(draw_list: PImDrawList; vert_start_idx: Integer; vert_end_idx: Integer; a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2; clamp: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igShadeVertsLinearUV';

procedure igShadeVertsTransformPos(draw_list: PImDrawList; vert_start_idx: Integer; vert_end_idx: Integer; pivot_in: ImVec2; cos_a: Single; sin_a: Single; pivot_out: ImVec2); cdecl;
  external PSFML_DLL name _PU + 'igShadeVertsTransformPos';

procedure igGcCompactTransientMiscBuffers(); cdecl;
  external PSFML_DLL name _PU + 'igGcCompactTransientMiscBuffers';

procedure igGcCompactTransientWindowBuffers(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igGcCompactTransientWindowBuffers';

procedure igGcAwakeTransientWindowBuffers(window: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igGcAwakeTransientWindowBuffers';

procedure igDebugLog(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igDebugLog';

procedure igDebugLogV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igDebugLogV';

procedure igDebugAllocHook(info: PImGuiDebugAllocInfo; frame_count: Integer; ptr: Pointer; size: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'igDebugAllocHook';

procedure igErrorCheckEndFrameRecover(log_callback: ImGuiErrorLogCallback; user_data: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igErrorCheckEndFrameRecover';

procedure igErrorCheckEndWindowRecover(log_callback: ImGuiErrorLogCallback; user_data: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igErrorCheckEndWindowRecover';

procedure igErrorCheckUsingSetCursorPosToExtendParentBoundaries(); cdecl;
  external PSFML_DLL name _PU + 'igErrorCheckUsingSetCursorPosToExtendParentBoundaries';

procedure igDebugDrawCursorPos(col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igDebugDrawCursorPos';

procedure igDebugDrawLineExtents(col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igDebugDrawLineExtents';

procedure igDebugDrawItemRect(col: ImU32); cdecl;
  external PSFML_DLL name _PU + 'igDebugDrawItemRect';

procedure igDebugLocateItem(target_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDebugLocateItem';

procedure igDebugLocateItemOnHover(target_id: ImGuiID); cdecl;
  external PSFML_DLL name _PU + 'igDebugLocateItemOnHover';

procedure igDebugLocateItemResolveWithLastItem(); cdecl;
  external PSFML_DLL name _PU + 'igDebugLocateItemResolveWithLastItem';

procedure igDebugBreakClearData(); cdecl;
  external PSFML_DLL name _PU + 'igDebugBreakClearData';

function igDebugBreakButton(const &label: PUTF8Char; const description_of_location: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'igDebugBreakButton';

procedure igDebugBreakButtonTooltip(keyboard_only: Boolean; const description_of_location: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugBreakButtonTooltip';

procedure igDebugStartItemPicker(); cdecl;
  external PSFML_DLL name _PU + 'igDebugStartItemPicker';

procedure igShowFontAtlas(atlas: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'igShowFontAtlas';

procedure igDebugHookIdInfo(id: ImGuiID; data_type: ImGuiDataType; const data_id: Pointer; const data_id_end: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igDebugHookIdInfo';

procedure igDebugNodeColumns(columns: PImGuiOldColumns); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeColumns';

procedure igDebugNodeDockNode(node: PImGuiDockNode; const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeDockNode';

procedure igDebugNodeDrawList(window: PImGuiWindow; viewport: PImGuiViewportP; const draw_list: PImDrawList; const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeDrawList';

procedure igDebugNodeDrawCmdShowMeshAndBoundingBox(out_draw_list: PImDrawList; const draw_list: PImDrawList; const draw_cmd: PImDrawCmd; show_mesh: Boolean; show_aabb: Boolean); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeDrawCmdShowMeshAndBoundingBox';

procedure igDebugNodeFont(font: PImFont); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeFont';

procedure igDebugNodeFontGlyph(font: PImFont; const glyph: PImFontGlyph); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeFontGlyph';

procedure igDebugNodeStorage(storage: PImGuiStorage; const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeStorage';

procedure igDebugNodeTabBar(tab_bar: PImGuiTabBar; const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeTabBar';

procedure igDebugNodeTable(table: PImGuiTable); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeTable';

procedure igDebugNodeTableSettings(settings: PImGuiTableSettings); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeTableSettings';

procedure igDebugNodeInputTextState(state: PImGuiInputTextState); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeInputTextState';

procedure igDebugNodeTypingSelectState(state: PImGuiTypingSelectState); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeTypingSelectState';

procedure igDebugNodeWindow(window: PImGuiWindow; const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeWindow';

procedure igDebugNodeWindowSettings(settings: PImGuiWindowSettings); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeWindowSettings';

procedure igDebugNodeWindowsList(windows: PImVector_ImGuiWindowPtr; const &label: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeWindowsList';

procedure igDebugNodeWindowsListByBeginStackParent(windows: PPImGuiWindow; windows_size: Integer; parent_in_begin_stack: PImGuiWindow); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeWindowsListByBeginStackParent';

procedure igDebugNodeViewport(viewport: PImGuiViewportP); cdecl;
  external PSFML_DLL name _PU + 'igDebugNodeViewport';

procedure igDebugRenderKeyboardPreview(draw_list: PImDrawList); cdecl;
  external PSFML_DLL name _PU + 'igDebugRenderKeyboardPreview';

procedure igDebugRenderViewportThumbnail(draw_list: PImDrawList; viewport: PImGuiViewportP; bb: ImRect); cdecl;
  external PSFML_DLL name _PU + 'igDebugRenderViewportThumbnail';

function igImFontAtlasGetBuilderForStbTruetype(): PImFontBuilderIO; cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasGetBuilderForStbTruetype';

procedure igImFontAtlasUpdateConfigDataPointers(atlas: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasUpdateConfigDataPointers';

procedure igImFontAtlasBuildInit(atlas: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildInit';

procedure igImFontAtlasBuildSetupFont(atlas: PImFontAtlas; font: PImFont; font_config: PImFontConfig; ascent: Single; descent: Single); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildSetupFont';

procedure igImFontAtlasBuildPackCustomRects(atlas: PImFontAtlas; stbrp_context_opaque: Pointer); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildPackCustomRects';

procedure igImFontAtlasBuildFinish(atlas: PImFontAtlas); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildFinish';

procedure igImFontAtlasBuildRender8bppRectFromString(atlas: PImFontAtlas; x: Integer; y: Integer; w: Integer; h: Integer; const in_str: PUTF8Char; in_marker_char: UTF8Char; in_marker_pixel_value: Byte); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildRender8bppRectFromString';

procedure igImFontAtlasBuildRender32bppRectFromString(atlas: PImFontAtlas; x: Integer; y: Integer; w: Integer; h: Integer; const in_str: PUTF8Char; in_marker_char: UTF8Char; in_marker_pixel_value: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildRender32bppRectFromString';

procedure igImFontAtlasBuildMultiplyCalcLookupTable(out_table: PByte; in_multiply_factor: Single); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildMultiplyCalcLookupTable';

procedure igImFontAtlasBuildMultiplyRectAlpha8(table: PByte; pixels: PByte; x: Integer; y: Integer; w: Integer; h: Integer; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'igImFontAtlasBuildMultiplyRectAlpha8';

/////////////////////////hand written functions
procedure igLogText(const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'igLogText';

procedure ImGuiTextBuffer_appendf(buffer: PImGuiTextBuffer; const fmt: PUTF8Char) varargs; cdecl;
  external PSFML_DLL name _PU + 'ImGuiTextBuffer_appendf';

function igGET_FLT_MAX(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGET_FLT_MAX';

function igGET_FLT_MIN(): Single; cdecl;
  external PSFML_DLL name _PU + 'igGET_FLT_MIN';

function ImVector_ImWchar_create(): PImVector_ImWchar; cdecl;
  external PSFML_DLL name _PU + 'ImVector_ImWchar_create';

procedure ImVector_ImWchar_destroy(self: PImVector_ImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImVector_ImWchar_destroy';

procedure ImVector_ImWchar_Init(p: PImVector_ImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImVector_ImWchar_Init';

procedure ImVector_ImWchar_UnInit(p: PImVector_ImWchar); cdecl;
  external PSFML_DLL name _PU + 'ImVector_ImWchar_UnInit';

function ImGui_SFML_Init_RenderWindow(window: PsfRenderWindow; loadDefaultFont: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Init_RenderWindow';

function ImGui_SFML_Init_Window_DisplaySize(window: PsfWindow; displaySize: sfVector2f; loadDefaultFont: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Init_Window_DisplaySize';

procedure ImGui_SFML_SetCurrentWindow(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetCurrentWindow';

procedure ImGui_SFML_ProcessEvent_Window(window: PsfWindow; event: PsfEvent); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_ProcessEvent_Window';

procedure ImGui_SFML_Update_RenderWindow(window: PsfRenderWindow; dt: sfTime); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Update_RenderWindow';

procedure ImGui_SFML_Update_Mouse_Display(mousePos: sfVector2i; displaySize: sfVector2f; dt: sfTime); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Update_Mouse_Display';

procedure ImGui_SFML_Render_RenderWindow(window: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Render_RenderWindow';

procedure ImGui_SFML_Render(); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Render';

procedure ImGui_SFML_Shutdown_Window(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Shutdown_Window';

procedure ImGui_SFML_Shutdown(); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Shutdown';

function ImGui_SFML_UpdateFontTexture(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_UpdateFontTexture';

function ImGui_SFML_GetFontTexture(): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_GetFontTexture';

procedure ImGui_SFML_SetActiveJoystickId(joystickId: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetActiveJoystickId';

procedure ImGui_SFML_SetJoystickDPadThreshold(threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetJoystickDPadThreshold';

procedure ImGui_SFML_SetJoystickLStickThreshold(threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetJoystickLStickThreshold';

procedure ImGui_SFML_SetJoystickRStickThreshold(threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetJoystickRStickThreshold';

procedure ImGui_SFML_SetJoystickLTriggerThreshold(threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetJoystickLTriggerThreshold';

procedure ImGui_SFML_SetJoystickRTriggerThreshold(threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetJoystickRTriggerThreshold';

procedure ImGui_SFML_SetJoystickMapping(key: Integer; joystickButton: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetJoystickMapping';

procedure ImGui_SFML_SetDPadXAxis(dPadXAxis: sfJoystickAxis; inverted: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetDPadXAxis';

procedure ImGui_SFML_SetDPadYAxis(dPadYAxis: sfJoystickAxis; inverted: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetDPadYAxis';

procedure ImGui_SFML_SetLStickXAxis(lStickXAxis: sfJoystickAxis; inverted: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetLStickXAxis';

procedure ImGui_SFML_SetLStickYAxis(lStickYAxis: sfJoystickAxis; inverted: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetLStickYAxis';

procedure ImGui_SFML_SetRStickXAxis(rStickXAxis: sfJoystickAxis; inverted: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetRStickXAxis';

procedure ImGui_SFML_SetRStickYAxis(rStickYAxis: sfJoystickAxis; inverted: Boolean); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetRStickYAxis';

procedure ImGui_SFML_SetLTriggerAxis(lTriggerAxis: sfJoystickAxis); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetLTriggerAxis';

procedure ImGui_SFML_SetRTriggerAxis(rTriggerAxis: sfJoystickAxis); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_SetRTriggerAxis';

procedure ImGui_SFML_Image_Texture(texture: PsfTexture; tintColor: sfColor; borderColor: sfColor); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Image_Texture';

procedure ImGui_SFML_Image_Texture_Size(texture: PsfTexture; size: sfVector2f; tintColor: sfColor; borderColor: sfColor); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Image_Texture_Size';

procedure ImGui_SFML_Image_RenderTexture(texture: PsfRenderTexture; tintColor: sfColor; borderColor: sfColor); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Image_RenderTexture';

procedure ImGui_SFML_Image_RenderTexture_Size(texture: PsfRenderTexture; size: sfVector2f; tintColor: sfColor; borderColor: sfColor); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Image_RenderTexture_Size';

procedure ImGui_SFML_Image_Sprite(sprite: PsfSprite; tintColor: sfColor; borderColor: sfColor); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Image_Sprite';

procedure ImGui_SFML_Image_Sprite_Size(sprite: PsfSprite; size: sfVector2f; tintColor: sfColor; borderColor: sfColor); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_Image_Sprite_Size';

function ImGui_SFML_ImageButton_Texture(texture: PsfTexture; size: sfVector2f; bgColor: sfColor; tintColor: sfColor): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_ImageButton_Texture';

function ImGui_SFML_ImageButton_RenderTexture(texture: PsfRenderTexture; size: sfVector2f; bgColor: sfColor; tintColor: sfColor): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_ImageButton_RenderTexture';

function ImGui_SFML_ImageButton_Sprite(sprite: PsfSprite; size: sfVector2f; bgColor: sfColor; tintColor: sfColor): Boolean; cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_ImageButton_Sprite';

procedure ImGui_SFML_DrawLine(a: sfVector2f; b: sfVector2f; col: sfColor; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_DrawLine';

procedure ImGui_SFML_DrawRect(rect: sfFloatRect; color: sfColor; rounding: Single; rounding_corners: Integer; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_DrawRect';

procedure ImGui_SFML_DrawRectFilled(rect: sfFloatRect; color: sfColor; rounding: Single; rounding_corners: Integer); cdecl;
  external PSFML_DLL name _PU + 'ImGui_SFML_DrawRectFilled';

implementation

{ImGuiTableColumnSortSpecs}

function ImGuiTableColumnSortSpecs.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumnSortSpecs.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImFontGlyph}

function ImFontGlyph.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImFontGlyph.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiDockNode}

function ImGuiDockNode.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiDockNode.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiStackLevelInfo}

function ImGuiStackLevelInfo.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiStackLevelInfo.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiWindow}

function ImGuiWindow.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiWindow.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiWindow}

function ImGuiWindow.GetData1Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data1 shr Offset) and Mask;
end;

procedure ImGuiWindow.SetData1Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data1 := (Data1 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTableColumn}

function ImGuiTableColumn.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumn.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTable}

function ImGuiTable.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTable.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTableColumnSettings}

function ImGuiTableColumnSettings.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumnSettings.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;


end.
