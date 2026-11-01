# Delphi Framework for Notepad++ Plugins

This directory contains a reusable framework for building Notepad++ plugins in
Delphi. The units do not depend on NppESPHome: another plugin can use them by
adding `Lib` to its unit search path.

The framework is split into a VCL-independent core and an optional VCL layer.
The core handles the Notepad++ ABI, messages, commands, lifecycle, and toolbar;
the VCL layer adds regular windows and docking panels. Any toolbar editor or
other application-specific UI remains the responsibility of the consuming
plugin.

## Requirements and integration

- Windows and a Delphi compiler compatible with the units used by the project.
- Separate Win32 and Win64 DLLs matching the architecture of Notepad++.
- `Lib` in the unit search path, or the required units listed explicitly in the
  project DPR.
- `NppPluginInclude.pas` included by the DPR to export the ABI required by
  Notepad++.

`Npp.Api` and `Npp.Scintilla.Api` are bindings and should not contain
application logic. A plugin should normally work through `TNppPlugin`,
`TNppHost`, `TNppCommands`, and `TNppToolbar`.

## Components

| Unit | Main component | Responsibility | VCL |
| --- | --- | --- | --- |
| `Npp.Api` | ABI records and constants | Official Notepad++ types, notifications, and messages | No |
| `Npp.Scintilla.Api` | Scintilla bindings | Constants and structures generated from `Scintilla.iface` | No |
| `Npp.MenuCmdID` | Menu constants | IDs of native Notepad++ commands | No |
| `FileVersionInfo` | [`TFileVersionInfo`](Docs/FileVersionInfo.md) | Reads version resources from EXE and DLL files | No |
| `Npp.Host` | [`TNppHost`](Docs/Npp.Host.md) | Message transport, host version, toolbar HWND, and native commands | No |
| `Npp.Commands` | [`TNppCommands`](Docs/Npp.Commands.md) | Command registry, ABI table, shortcuts, separators, and menu state | No |
| `Npp.Plugin` | [`TNppPlugin`](Docs/Npp.Plugin.md) | Lifecycle, notifications, and ownership of commands and toolbar | No |
| `Npp.Toolbar` | [`TNppToolbar`](Docs/Npp.Toolbar.md) | Icons, model, configuration string, and native toolbar | No |
| `Npp.Vcl.Forms` | [`TNppPluginForm`](Docs/Npp.Vcl.Forms.md) | Regular VCL dialogs integrated with Notepad++ | Yes |
| `Npp.Vcl.Docking` | [`TNppPluginDocking`](Docs/Npp.Vcl.Docking.md) | Dockable VCL panels | Yes |
| `NppPluginInclude.pas` | DLL entry points | Standard exports, lazy construction, and safe shutdown | Only when included |

`TNppCommands`, `TNppToolbar`, `TNppPluginForm`, and `TNppPluginDocking` are the
definitive public class names. The framework does not retain legacy aliases.

## Quick start

### 1. Declare the plugin, commands, and toolbar

Menu callbacks are instance-free C procedures (`procedure; cdecl`). Use a
trampoline to invoke a method on the Delphi plugin instance.

```pascal
unit Example.Plugin;

interface

uses
  Winapi.Windows, System.IniFiles, System.IOUtils,
  System.SysUtils, Npp.Api, Npp.Commands, Npp.Plugin, Npp.Toolbar;

type
  TExamplePlugin = class(TNppPlugin)
  private
    FIni: TIniFile;
    procedure Hello;
    function CreateToolbarIcons(const Entry: TNppMenuEntry;
      out IconData: TToolbarIconsWithDarkMode): Boolean;
    procedure LoadToolbarConfiguration;
    procedure SaveToolbarConfiguration;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetInfo(NppData: TNppData); override;
  end;

var
  Plugin: TExamplePlugin;
  PluginClass: TNppPluginClass = TExamplePlugin;

implementation

const
  CmdHello = 'hello';

procedure _Hello; cdecl;
begin
  if Assigned(Plugin) then
    Plugin.Hello;
end;

constructor TExamplePlugin.Create;
begin
  inherited;
  PluginName := 'ExamplePlugin';
  Commands.AddCommand(CmdHello, 'Hello', _Hello);
  ConfigureToolbar(CreateToolbarIcons);
  Plugin := Self;
end;

destructor TExamplePlugin.Destroy;
begin
  if Plugin = Self then
    Plugin := nil;
  FreeAndNil(FIni);
  inherited;
end;

procedure TExamplePlugin.SetInfo(NppData: TNppData);
begin
  inherited;
  FIni := TIniFile.Create(TPath.Combine(GetPluginConfigDir,
    string(PluginName) + '.ini'));
  LoadToolbarConfiguration;
end;

procedure TExamplePlugin.Hello;
begin
  MessageBox(NppData.NppHandle, 'Hello from Delphi', PChar(PluginName),
    MB_OK or MB_ICONINFORMATION);
end;

procedure TExamplePlugin.LoadToolbarConfiguration;
begin
  if Assigned(FIni) then
    Toolbar.ApplyConfiguration(FIni.ReadString('Toolbar', 'Layout', ''));
end;

procedure TExamplePlugin.SaveToolbarConfiguration;
begin
  if Assigned(FIni) then
    FIni.WriteString('Toolbar', 'Layout', Toolbar.Configuration);
end;

function TExamplePlugin.CreateToolbarIcons(const Entry: TNppMenuEntry;
  out IconData: TToolbarIconsWithDarkMode): Boolean;
begin
  FillChar(IconData, SizeOf(IconData), 0);
  if Entry.Id <> CmdHello then
    Exit(False);

  // 101 is a BITMAP; 102 and 103 are ICON resources in the example plugin.
  IconData.ToolbarBmp := HBITMAP(LoadImage(HInstance, MakeIntResource(101),
    IMAGE_BITMAP, 16, 16, LR_CREATEDIBSECTION));
  IconData.ToolbarIcon := HICON(LoadImage(HInstance, MakeIntResource(102),
    IMAGE_ICON, 32, 32, LR_DEFAULTCOLOR));
  IconData.ToolbarIconDarkMode := HICON(LoadImage(HInstance,
    MakeIntResource(103), IMAGE_ICON, 32, 32, LR_DEFAULTCOLOR));

  Result := (IconData.ToolbarBmp <> 0) and
    (IconData.ToolbarIcon <> 0) and
    (IconData.ToolbarIconDarkMode <> 0);
end;

end.
```

`TNppPlugin` creates and destroys `Commands`. `ConfigureToolbar` creates the
optional toolbar, and the base lifecycle automatically calls `Initialize`,
`CaptureNativeButtons`, and `Refresh` for the appropriate notifications.
Overrides of those notifications are therefore needed only for application
logic and must continue to call `inherited`.

The icon provider must return newly created, transferable handles. After the
call, even when it returns `False`, every nonzero handle belongs to
`TNppToolbar`, which releases it with `DeleteObject` or `DestroyIcon`.

The INI file in the example is deliberately managed by the application class.
The framework has no knowledge of files, the registry, or any other persistence
mechanism: `LoadToolbarConfiguration` passes a string to the toolbar, while
`SaveToolbarConfiguration` obtains the current string when the application UI
decides to save it.

### 2. Export the DLL

```pascal
library ExamplePlugin;

uses
  System.SysUtils, Winapi.Windows,
  Npp.Api in '..\Lib\Npp.Api.pas',
  Npp.Host in '..\Lib\Npp.Host.pas',
  Npp.Plugin in '..\Lib\Npp.Plugin.pas',
  Npp.Commands in '..\Lib\Npp.Commands.pas',
  Npp.Toolbar in '..\Lib\Npp.Toolbar.pas',
  Example.Plugin in 'Example.Plugin.pas';

{$R *.res}

var
  BasePlugin: TNppPlugin;

{$I ..\Lib\NppPluginInclude.pas}

begin
  DLLProc := @DLLEntryPoint;
end.
```

The include file exports `setInfo`, `getName`, `getFuncsArray`, `beNotified`,
`messageProc`, and `isUnicode`. The concrete plugin is created lazily by the
first entry point and destroyed after `NPPN_SHUTDOWN` returns, outside the
Windows loader lock.

## Npp.Api

This unit reproduces the Notepad++ ABI and mainly contains constants and
records.

| Type | Use |
| --- | --- |
| `nppString`, `nppPChar` | Unicode strings used by the ABI |
| `TNppData` | Handles for Notepad++, the primary Scintilla view, and the secondary view |
| `TShortcutKey`, `PShortcutKey` | Shortcut associated with a command |
| `TFuncItem`, `PFuncItem` | Entry exported to the Plugins menu |
| `TToolbarIcons` | Legacy toolbar icon record |
| `TToolbarIconsWithDarkMode` | Light bitmap and light/dark icons |
| `TNppDarkModeColors` | Color palette supplied by Notepad++ |
| `TTbData` | Registration data for a docking panel |
| `TSCNotification`, `PSCNotification` | Notepad++/Scintilla notification |

Use `NPPM_*`, `NPPN_*`, `DWS_*`, and `DMN_*` constants when a high-level
wrapper does not cover a specific message.

### Shortcuts and ownership

After successful registration, `TNppCommands` owns the `PShortcutKey` and
releases it with `Dispose`. Allocate it with `New` and do not release it after
`AddCommand`:

```pascal
function NewShortcut(Ctrl, Alt, Shift: Boolean; Key: UCHAR): PShortcutKey;
begin
  New(Result);
  Result^.IsCtrl := Ctrl;
  Result^.IsAlt := Alt;
  Result^.IsShift := Shift;
  Result^.Key := Key;
end;

Commands.AddCommand('build', 'Build', _Build,
  NewShortcut(True, False, False, Ord('B')));
```

## Npp.Scintilla.Api

This unit contains generated Scintilla bindings. Use them through
`TNppHost.SendMainScintilla`, `SendSecondScintilla`, or
`TNppPlugin.GetCurrentScintilla`.

```pascal
Position := Host.Send(GetCurrentScintilla, SCI_GETCURRENTPOS);
```

Regenerate or verify the generated block with:

```text
python Tools/GenerateScintillaApi.py --iface C:\src\scintilla\include\Scintilla.iface --version <upstream-tag>
python Tools/GenerateScintillaApi.py --iface C:\src\scintilla\include\Scintilla.iface --version <upstream-tag> --check
```

The generated block records its upstream version and SHA-256 hash. ABI records
outside that block must be checked manually against headers from the same
Scintilla version.

## Npp.Host

`TNppHost` centralizes Win32 transport. Production code uses
`SendMessage`/`PostMessage`; tests or other isolated clients can inject
replacement functions.

Detailed component reference: [`TNppHost`](Docs/Npp.Host.md).

```pascal
Host := TNppHost.Create(NppData);
Host := TNppHost.Create(NppData, FakeSend, FakePost, FakeToolbarResolver);
```

### Properties and methods

| Member | Description |
| --- | --- |
| `Create(AData, ATransport, APostTransport, AToolbarHandleResolver)` | Creates the facade; `nil` callbacks select the Win32 defaults |
| `Data` | `TNppData` record synchronized by `TNppPlugin.SetInfo` |
| `Transport` | Replaceable synchronous transport; `nil` restores the default |
| `PostTransport` | Replaceable asynchronous transport; `nil` restores the default |
| `ToolbarHandleResolver` | Replaceable native-toolbar HWND lookup |
| `Send(Handle, Msg, WParam, LParam)` | Sends to any HWND |
| `Post(Handle, Msg, WParam, LParam)` | Posts to any HWND |
| `SendNpp(...)`, `PostNpp(...)` | Use `NppHandle` |
| `SendMainScintilla(...)` | Uses `ScintillaMainHandle` |
| `SendSecondScintilla(...)` | Uses `ScintillaSecondHandle` |
| `GetNppVersion(var Major, Minor)` | Reads and normalizes the Notepad++ version |
| `IsNppMinVersion(Major, Minor)` | Tests the required minimum version |
| `GetToolbarHandle` | Returns the native toolbar handle |
| `PerformMenuCommand(Id, Param, Delayed)` | Runs a native Notepad++ menu command |

`NppDefaultHostTransport`, `NppDefaultHostPostTransport`, and
`NppDefaultToolbarHandleResolver` are the public Win32 implementations.

```pascal
function FakeSend(Handle: HWND; Msg: UINT; WParam: WPARAM;
  LParam: LPARAM): LRESULT;
begin
  if Msg = NPPM_GETCURRENTBUFFERID then
    Exit(42);
  Result := 0;
end;

Host := TNppHost.Create(Data, FakeSend);
Assert(Host.SendNpp(NPPM_GETCURRENTBUFFERID) = 42);
```

## Npp.Commands

`TNppCommands` registers entries in Plugins-menu order and assigns each one a
stable identifier chosen by the plugin. This identifier is neither the entry
index nor the `CmdID` assigned by Notepad++.

Detailed component reference: [`TNppCommands`](Docs/Npp.Commands.md).

Identifiers are case-insensitive, must be unique, and cannot be empty or
contain `:`, `;`, or `|`, which are reserved by the toolbar format.

### Registration

| Method | Result or effect |
| --- | --- |
| `TNppPlugin.Commands` | Registry already created and owned by the plugin |
| `Create(AHost)` | Advanced direct construction; requires a non-`nil` host |
| `AddCommand(Id, Caption, Callback, ShortcutKey, Checked)` | Registers a command and returns its menu index |
| `AddSeparator(Id)` | Registers a separator and returns its index; without an ID it generates `Sep$N` |

A command requires a callback. The returned menu index can be used as the
`DlgId` of a docking form.

### Lookup and inspection

| Method or property | Description |
| --- | --- |
| `Count` | Total number of commands and separators |
| `Entries[Index]` | Copy of `TNppMenuEntry`; an invalid index raises an exception |
| `IndexOf(Id)` | Menu index or `-1` |
| `IdFromIndex(Index)` | Stable ID or an empty string |
| `CommandId(Id)` | Notepad++ `CmdID` or `-1` |
| `FunctionItem(Id)` | Pointer to `TFuncItem`, or `nil` |
| `Caption(Id)` | Current caption, or an empty string |
| `IsChecked(Id)` | Stored checked state |
| `IsEnabled(Id)` | Stored enabled state |
| `GetFuncsArray(out Count)` | Exposes the owned contiguous ABI table |
| `ApplySeparators` | Converts registered separator entries in the native menu |

`TNppMenuEntry` exposes `Id`, `Index`, `IsSeparator`, `Checked`, and `Enabled`.

### Changing state

| Method | Description |
| --- | --- |
| `SetCaption(Id, Caption, PreserveShortcut)` | Updates the record and native menu; preserves shortcut text by default |
| `SetChecked(Id, Checked, Delayed)` | Updates stored and native checked state; posts the update by default |
| `SetEnabled(Id, Enabled)` | Updates the menu and notifies all listeners |
| `AddEnabledListener(Listener)` | Adds a callback without duplicates |
| `RemoveEnabledListener(Listener)` | Removes the matching callback |
| `OnEnabledChanged` | Optional single callback in addition to the listener list |

`TNppToolbar` registers itself as a listener. `Commands.SetEnabled` must
therefore remain the source of truth instead of changing the toolbar directly.

```pascal
Commands.SetCaption('build', 'Build current document');
Commands.SetChecked('watch', True);
Commands.SetEnabled('build', FileExists(GetFullCurrentPath));
```

An unknown ID, a separator used as a command, or a duplicate identifier raises
`EArgumentException` in methods that require a real command.

## Npp.Plugin

`TNppPlugin` receives ABI calls, stores `TNppData`, owns `Commands` and the
optional `Toolbar`, dispatches notifications to virtual methods, and provides
wrappers for common operations.

Detailed component reference: [`TNppPlugin`](Docs/Npp.Plugin.md).

### Properties

| Property | Description |
| --- | --- |
| `NppData` | Handles supplied by Notepad++ |
| `Host` | `TNppHost` owned by the plugin |
| `Commands` | Always-available `TNppCommands` owned by the plugin |
| `Toolbar` | Plugin-owned `TNppToolbar`, or `nil` when not configured |
| `PluginName` | Name displayed in the Plugins menu |
| `PluginMajorVersion`, `PluginMinorVersion` | Writable version components |
| `SCNotification` | Pointer valid only during the current notification callback |
| `IsShuttingDown` | `True` from the start of `Shutdown` |
| `IsShutdownComplete` | `True` after `DoNppnShutdown` completes |

### Notepad++ interface

These methods are normally called by `NppPluginInclude.pas`:

| Method | Purpose |
| --- | --- |
| `SetInfo(NppData)` | Stores handles and updates `Host.Data`; an override must call `inherited` |
| `GetName` | Returns the plugin name through the ABI |
| `GetFuncsArray(out Count)` | Delegates ABI-table publication to `Commands` |
| `MessageProc(var Msg)` | Receives Windows messages and applies separators |
| `BeNotified(SN)` | Dispatches a notification and then clears `SCNotification` |
| `Shutdown` | Runs `DoNppnShutdown` exactly once |
| `GetCurrentScintilla` | Returns the active editor HWND |

### Service configuration

In a descendant constructor, first register every command through `Commands`,
then call the protected `ConfigureToolbar(IconProvider,
DisabledIconProvider)` once. Calling it twice, supplying a `nil` icon provider,
or calling it during shutdown raises an exception.

`Commands` owns `TFuncItem` registration, native menu state, and `CmdID`
resolution. `Toolbar` owns icon registration and button state. Native
Notepad++ menu commands belong to `Host`. `TNppPlugin` no longer exposes legacy
wrappers based on menu indexes.

### Program, paths, and colors

| Method | Result |
| --- | --- |
| `GetMajorVersion`, `GetMinorVersion`, `GetReleaseNumber`, `GetBuildNumber` | DLL file-version components |
| `GetCopyright` | Copyright from the version resource |
| `GetNppVersion(var Major, Minor)` | Notepad++ version and normalized numeric value |
| `IsNppMinVersion(Major, Minor)` | Whether the host meets a minimum version |
| `IsDarkModeEnabled` | Current dark-mode state |
| `GetDarkModeColors(PColors)` | Fills the Notepad++ dark-mode palette when available |
| `InitializeLightModeColors(out Colors)` | Fills the same record with current Windows light-mode system colors |
| `GetToolbarIconSetChoice` | Host toolbar icon family and size |
| `GetNppDir` | Notepad++ directory |
| `GetPluginDir` | Plugin directory |
| `GetPluginConfigDir` | Writable plugin configuration directory |
| `GetPluginDocDir` | Plugin documentation directory |
| `GetPluginDllPath` | Path of the current DLL |
| `GetNppWindowTitle` | Host window title |

`InitializeLightModeColors` is a static class procedure. It initializes every
field of `TNppDarkModeColors` from Windows system colors, allowing forms to use
one palette record in both modes:

```pascal
Colors := Default(TNppDarkModeColors);
if not (Plugin.IsDarkModeEnabled and
  Plugin.GetDarkModeColors(@Colors)) then
  TNppPlugin.InitializeLightModeColors(Colors);
```

### Documents, buffers, and editors

| Method | Purpose |
| --- | --- |
| `GetFullCurrentPath` | Full active-document path |
| `GetCurrentDirectory` | Active-document directory |
| `GetFullFileName` | File name and extension without the directory |
| `GetFileNameWithoutExt` | File name without extension |
| `GetFileNameExt` | File extension only |
| `GetEncoding`, `GetEOLFormat`, `GetLanguageType` | Document metadata |
| `GetLanguageName(Lang)`, `GetLanguageDesc(Lang)` | Language name and description |
| `GetCurrentViewIdx` | Active view; overload maps a Scintilla HWND to a view |
| `GetCurrentDocIndex(View)` | Active document index in a view |
| `GetCurrentLine`, `GetCurrentColumn`, `GetCurrentWord` | Caret location and current word |
| `GetCurrentBufferId` | Current stable buffer ID |
| `GetBufferIdFromPos(View, Doc)` | Buffer ID from view and document indexes |
| `GetPosFromBufferId(BufferId, out Doc)` | View and document indexes from a buffer ID |
| `GetFullPathFromBufferId(BufferId)` | Absolute path from a buffer ID |
| `GetCurrentBufferDirty(View)` | Unsaved state in a view |
| `GetOpenFilesCnt(Type)`, `GetOpenFiles(Type)` | Open-file count and paths |
| `GetLineCount(View)`, `GetCurrentPos(View)` | Scintilla document metrics |
| `GetLineFromPosition(View, Pos)` | Line containing a character position |
| `GetFirstVisibleLine(View)`, `GetLinesOnScreen(View)` | Viewport information |
| `GetFilePos(out File, out Line, out Column)` | File and caret position in one call |

### File operations

| Method | Purpose |
| --- | --- |
| `OpenFile(FileName, ReadOnly)` | Opens or activates a file |
| `OpenFile(FileName, Line, ReadOnly)` | Opens a file and moves to a zero-based line |
| `SaveFile(FileName)` | Saves a specified open file |
| `SaveCurrentFile` | Saves the active document |
| `SaveAllFiles` | Saves all documents |
| `SwitchToFile(FileName)` | Activates an open document |
| `ReloadFile(FileName, Alert)` | Reloads a specified file |
| `ReloadCurrentFile(Alert)` | Reloads the active document |

### Virtual notifications

Override only the events the application needs and call `inherited`.

| Group | Methods |
| --- | --- |
| Host and UI | `DoNppnReady`, `DoNppnToolbarModification`, `DoNppnDarkModeChanged`, `DoNppToolbarIconsetChanged`, `DoNppNativeLangChanged`, `DoNppnShortcutRemapped` |
| Open and save | `DoNppnFileBeforeOpen`, `DoNppnFileOpened`, `DoNppnFileBeforeSave`, `DoNppnFileSaved`, `DoNppnFileBeforeClose`, `DoNppnFileClosed` |
| Loading | `DoNppnFileBeforeLoad`, `DoNppnFileLoadFailed`, `DoNppnSnapshotDirtyFileLoaded` |
| Rename and delete | `DoNppnFileBeforeRename`, `DoNppnFileRenameCancel`, `DoNppnFileRenamed`, `DoNppnFileBeforeDelete`, `DoNppnFileDeleteFailed`, `DoNppnFileDeleted` |
| Document and editor | `DoNppnBufferActivated`, `DoNppnLangChanged`, `DoNppnWordStylesUpdated`, `DoNppnReadOnlyChanged`, `DoNppnDocOrderChanged`, `DoNppGlobalModified`, `DoNppExternalLexerBuffer` |
| Shutdown | `DoNppnBeforeShutDown`, `DoNppnCancelShutDown`, `DoNppnShutdown` |
| Command line | `DoNppnCmdLinePluginMsg` |

During an override, notification details are available through
`SCNotification^`. Never retain the pointer after the callback returns.

## Npp.Toolbar: layout

`TNppToolbarLayout` is the UI-independent model. It contains an ordered
sequence of `TNppToolbarLayoutItem` records, each with an `ItemId` and a
`Visible` flag.

Detailed component reference: [`Npp.Toolbar`](Docs/Npp.Toolbar.md).

| Method or property | Description |
| --- | --- |
| `Count` | Number of items |
| `Items[Index]` / `Layout[Index]` | Item at an index |
| `Add(ItemId, Visible)` | Adds a unique stable ID |
| `IndexOf(ItemId)` | Case-insensitive lookup |
| `Move(FromIndex, ToIndex)` | Moves an item while preserving the order of the others |
| `SetVisible(Index, Visible)` | Changes visibility |
| `Serialize` | Produces the current stable-ID format |
| `CreateDefault(AvailableIds)` | Creates an all-visible layout |
| `TryParse(Value, out Layout)` | Validates and creates a layout in the current format |

```pascal
Layout := Toolbar.CreateLayout;
try
  Layout.Move(Layout.IndexOf('build'), 0);
  Layout.SetVisible(Layout.IndexOf('about'), False);
  Toolbar.ApplyLayout(Layout);
finally
  Layout.Free;
end;
```

The current format uses stable IDs:

```text
open:1;build:1;about:0;
```

`1` means visible and `0` means hidden. There is no version prefix and no
legacy parser. The canonical representation ends with `;`. When applying a
string to an initialized toolbar:

- IDs removed from the plugin are ignored;
- new IDs are appended and made visible;
- duplicates, flags other than 0/1, invalid IDs, and non-canonical strings
  cause `ApplyConfiguration` to raise `EArgumentException`;
- older configurations must be converted or replaced by the application.

The caller owns every `TNppToolbarLayout` returned by `CreateDefault`,
`TryParse`, or `CreateLayout`.

## Npp.Toolbar: manager

### Callbacks

| Type | Contract |
| --- | --- |
| `TNppToolbarIconProvider` | Receives a `TNppMenuEntry`, fills `TToolbarIconsWithDarkMode`, and decides whether to create a button |
| `TNppToolbarDisabledIconProvider` | Receives a borrowed HICON and returns a newly created disabled HICON |

The disabled-image provider is optional. It must not destroy the input HICON;
the manager destroys the returned HICON after copying it into the native image
list.

### Construction

For a normal `TNppPlugin` descendant:

```pascal
ConfigureToolbar(
  CreateIcons,          // required
  CreateDisabledIcon);  // optional
```

The `Toolbar` property becomes available immediately after configuration. The
base plugin manages its destruction and notifications. The public
`TNppToolbar.Create(Host, Commands, ...)` constructor remains available for
advanced clients: in that case the manager does not own the host or registry
and must be destroyed before `Commands`.

### Methods

| Method | When and what it does |
| --- | --- |
| `Initialize` | During `NPPN_TBMODIFICATION`, rebuilds the model, icons, and native registration |
| `CaptureNativeButtons` | After toolbar creation, captures native `TTBButton` templates |
| `Refresh` | Rebuilds order, visibility, enabled state, and disabled images |
| `ReleaseResources` | Destroys bitmap/icon handles, clears the model, and keeps configuration for reinitialization; idempotent |
| `Configuration` | Returns the current normalized configuration |
| `DefaultConfiguration` | Generates the default all-visible configuration |
| `CreateLayout(Default)` | Creates the current layout or, with `True`, the default layout; caller owns it |
| `ApplyConfiguration(Value)` | Validates, stores, reconciles, and applies a string to the native toolbar |
| `ApplyLayout(Layout)` | Serializes and applies a non-`nil` layout |
| `SetEnabled(ItemId, State)` | Synchronizes the model and native button |
| `CaptionForItem(ItemId)` | Gets the current caption from the command registry |
| `GetButtonInfo(Index, out Button)` | Safely copies button data by index |
| `GetButtonInfo(ItemId, out Button)` | Case-insensitive stable-ID lookup and safe copy |
| `IsConfigurationValid(Value)` | Static syntax check for the current format |

Properties and records:

| Member | Description |
| --- | --- |
| `ButtonCount` | Commands for which the provider returned valid icons |
| `Host` | Associated host, not owned |
| `Commands` | Associated command registry, not owned |
| `Button[Index]` | Legacy pointer; prefer `GetButtonInfo` |
| `TNppToolbarButton` | `CommandId`, `ItemId`, `Sequence`, `Visible`, `Enabled`, `NativeButton`, and `IconData` |

The pointer returned by `Button[Index]` becomes invalid whenever `Initialize`
resizes the internal dynamic array.

`TNppToolbar` does not read or write persistent storage. The application can
load from an INI file, registry, JSON, or another source and pass the string to
`ApplyConfiguration`; when it decides to save, it persists `Configuration`.

### Lifecycle sequence

```text
plugin constructor
  -> TNppPlugin creates Commands
  -> descendant registers commands
  -> ConfigureToolbar creates Toolbar (optional)

NPPN_TBMODIFICATION
  -> Toolbar.Initialize

NPPN_READY
  -> Toolbar.CaptureNativeButtons
  -> Toolbar.Refresh

dark-mode or icon-set change
  -> Toolbar.Refresh

plugin destruction
  -> application plugin releases its forms
  -> TNppPlugin releases Toolbar
  -> TNppPlugin releases Commands
```

## Toolbar configuration UI

The framework does not provide a configuration dialog. Appearance, controls,
icons, translations, and editor behavior belong to the consuming plugin.
`Npp.Toolbar` provides the model required by such a UI:

- `CreateLayout` returns the current order and visibility;
- `CreateLayout(True)` returns the default layout;
- `CaptionForItem` resolves the displayed caption;
- `GetButtonInfo` exposes the stable ID and icon data;
- `ApplyLayout` validates, serializes, and applies the result;
- `Configuration` exposes the string the UI can pass to application-owned
  persistence.

```pascal
Layout := Toolbar.CreateLayout;
try
  Layout.Move(OldIndex, NewIndex);
  Layout.SetVisible(NewIndex, CheckBox.Checked);
  Toolbar.ApplyLayout(Layout);
  Ini.WriteString('Toolbar', 'Layout', Toolbar.Configuration);
finally
  Layout.Free;
end;
```

The UI must retain `TNppToolbarLayoutItem.ItemId`, not the visual command
index. This keeps configuration valid when a future plugin version adds or
removes commands. A complete DFM-based implementation using `TTreeView`,
drag-and-drop, application icons, and light/dark themes is available in
`Source/NppESPHome.FormToolbar.pas`.

## Npp.Vcl.Forms

`TNppPluginForm` is the base class for regular dialogs.

Detailed component reference: [`TNppPluginForm`](Docs/Npp.Vcl.Forms.md).

### Constructors

| Constructor | Use |
| --- | --- |
| `Create(ParentPlugin)` | Main DFM-backed form |
| `Create(AOwner: TNppPluginForm)` | Child dialog with a VCL owner and the same plugin |
| `CreateRuntime(ParentPlugin, 0)` | Form without a DFM, built in code |

The constructors require a non-`nil` plugin or owner. Main forms receive the
Notepad++ handle as their parent window, register through `NPPM_MODELESSDIALOG`
when the host is available, and unregister during destruction.

The class temporarily attaches `Application.Handle` to Notepad++ and restores
the original value after the last framework form is destroyed.

### Methods and fields

| Member | Description |
| --- | --- |
| `ParentPlugin` | Associated plugin |
| `DefaultCloseAction` | Action applied by `DoClose`; defaults to `caNone` |
| `InitLanguage` | Virtual hook for translating captions and text; the plugin must call it |
| `ToggleDarkMode` | Initializes or updates the theme |
| `SubclassAndTheme(DmFlag)` | Sends the dark-mode message; overridable |
| `WantChildKey(Child, Message)` | Allows child controls to process keys |
| `RegisterForm`, `UnregisterForm` | Protected, idempotent registration methods |

DFM-backed example:

```pascal
type
  TOptionsForm = class(TNppPluginForm)
    OkButton: TButton;
  public
    procedure InitLanguage; override;
  end;

implementation

{$R *.dfm}

procedure TOptionsForm.InitLanguage;
begin
  Caption := 'Options';
end;

Form := TOptionsForm.Create(Plugin);
try
  Form.ShowModal;
finally
  Form.Free;
end;
```

Create forms only after `SetInfo`. For forms not required during startup,
prefer waiting for `NPPN_READY`.

## Npp.Vcl.Docking

`TNppPluginDocking` derives from `TNppPluginForm`.

Detailed component reference: [`TNppPluginDocking`](Docs/Npp.Vcl.Docking.md).

The two constructors without `DlgId` exist for source compatibility but raise
an exception. Always use:

```pascal
Create(NppParent: TNppPlugin; DlgId: Integer)
Create(AOwner: TNppPluginForm; DlgId: Integer)
```

`DlgId` is the menu index returned by `TNppCommands.AddCommand`, not the native
`CmdID`.

```pascal
type
  TOutputDock = class(TNppPluginDocking)
  public
    constructor Create(APlugin: TNppPlugin;
      AMenuIndex: Integer); reintroduce;
  end;

constructor TOutputDock.Create(APlugin: TNppPlugin;
  AMenuIndex: Integer);
begin
  FNppDefaultDockingMask := DWS_DF_CONT_BOTTOM;
  inherited Create(APlugin, AMenuIndex);
  DefaultCloseAction := caHide;
end;

// The constructor has already registered the docking panel.
OutputDock := TOutputDock.Create(Self,
  Commands.IndexOf('show.output'));
```

### Methods and properties

| Member | Description |
| --- | --- |
| `Show` | Registers when necessary and displays the panel through `NPPM_DMMSHOW` |
| `Hide` | Hides the panel through `NPPM_DMMHIDE` |
| `RegisterDockingForm(MaskStyle)` | Registers once and requires a valid host |
| `RefreshDockingInfo` | Synchronizes caption, module, and information text, then notifies the host |
| `UpdateDisplayInfo` | Clears the information text |
| `UpdateDisplayInfo(Info)` | Sets information text and updates the tab |
| `DlgID` | Menu index supplied to the constructor |
| `IsDockingRegistered` | Local registration state |
| `DockingData` | Copy of the `TTbData` record |
| `OnDock`, `OnFloat` | Events generated by docking notifications |

Registration initially makes the tab visible. If the persisted preference is
hidden, call `Hide` after construction. User close operations should use
`DefaultCloseAction = caHide`. Notepad++ exposes no public unregister message;
the destructor hides the panel and clears local state.

Notepad++ themes docking forms directly, so `SubclassAndTheme` is intentionally
empty in this class.

## Lifecycle, ownership, and practical rules

| Phase | Operations |
| --- | --- |
| Plugin constructor | Set `PluginName`, register commands through `Commands`, and optionally call `ConfigureToolbar`; do not use host HWNDs yet |
| `SetInfo` | Call `inherited`, then create configuration and services requiring Notepad++ paths |
| `NPPN_TBMODIFICATION` | The framework calls `Toolbar.Initialize` |
| `NPPN_READY` | The framework captures and refreshes the toolbar; the plugin may create its forms |
| Runtime | Update enabled, checked, and caption state through `TNppCommands` |
| `NPPN_SHUTDOWN` | Stop threads and processes and destroy forms while the host remains valid |
| Plugin destructor | Release application-owned resources, then call `inherited` |

Essential ownership rules:

- `TNppPlugin` owns `Host`, `Commands`, and the optional `Toolbar`.
- `TNppCommands` owns the `TFuncItem` table and registered `PShortcutKey`
  pointers.
- The application plugin owns its forms and application-specific services.
- `TNppToolbar` owns image handles returned by icon providers.
- Returned toolbar layouts always belong to the caller.
- `TNppCommands` and `TNppToolbar` do not own `Host`.
- `SCNotification` belongs to the host and is valid only during the callback.

## Building and validation

`Lib` is source code consumed by a plugin project; it does not define a
standalone package or test project in this repository. Validate changes by
building a consuming plugin DLL for every supported architecture.

After loading the Delphi environment with `rsvars.bat`, build the project for
Win32 and Win64 into separate output and DCU directories. The DLL architecture
must match the Notepad++ process that loads it.

At minimum, validate:

- clean compilation without warnings for each supported architecture;
- successful loading by the matching Notepad++ architecture;
- Plugins-menu command registration and shortcut ownership;
- toolbar creation, reordering, visibility, enabled-state synchronization, and
  light/dark icon refresh;
- normal form registration and docking-panel show/hide behavior;
- light- and dark-mode palettes, including the
  `InitializeLightModeColors` fallback;
- shutdown with all application forms, threads, and processes released before
  the plugin object is destroyed.

The individual component references under [`Docs`](Docs) provide the detailed
contracts needed for focused tests or for creating a separate reusable test
project.
