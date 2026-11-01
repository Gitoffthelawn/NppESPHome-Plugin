// Project configuration dialog for NppESPHome.
// Edits command, console, device, dependency, and Notepad++ integration options for the current project.
unit NppESPHome.FormConfiguration;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Npp.Plugin, Npp.Vcl.Forms, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.VirtualImageList, JvListComb,
  Vcl.WinXPanels, Vcl.ExtCtrls,
  JvEdit,
  Vcl.VirtualImage, Vcl.Buttons, Vcl.ImgList,
  JvCombobox, System.ImageList, JvExStdCtrls, Vcl.CategoryButtons, Vcl.WinXCtrls;

type
  // Modal editor for all settings stored against the current ESPHome project.
  // Event handlers persist changes immediately, while dynamic controls mirror
  // devices, monitors, dependencies, and theme resources discovered at runtime.
  TFormConfig = class(TNppPluginForm)
    GroupBoxProject: TGroupBox;
    LabelProjectSummaryName: TLabel;
    LabelProjectSummaryFile: TLabel;
    PanelProjectBadges: TPanel;
    PanelProjectMicrocontroller: TPanel;
    PanelProjectMCUVariant: TPanel;
    PanelProjectBoard: TPanel;
    PanelProjectFramework: TPanel;
    PanelProjectWiFi: TPanel;
    PanelProjectEthernet: TPanel;
    PanelProjectWebServer: TPanel;
    PanelProjectNativeAPI: TPanel;
    PanelProjectMQTT: TPanel;
    PanelProjectOTA: TPanel;
    PanelProjectCaptivePortal: TPanel;
    PanelProjectLogger: TPanel;
    LinkLabelProjectFile: TLinkLabel;
    VirtualImageList: TVirtualImageList;
    FileOpenDialogDependency: TFileOpenDialog;
    LabelOptionRunAdditionalParameters: TLabel;
    CheckBoxOptionRunNoLogs: TCheckBox;
    LabelOptionRunNoLogs: TLabel;
    CheckBoxOptionRunNoStates: TCheckBox;
    LabelOptionRunNoStates: TLabel;
    CheckBoxOptionRunReset: TCheckBox;
    LabelOptionRunReset: TLabel;
    LabelRunTitle: TLabel;
    LabelRunDescription: TLabel;
    GroupBoxRunOutputDevice: TGroupBox;
    LabelRunNoLogsDescription: TLabel;
    LabelRunNoStatesDescription: TLabel;
    LabelRunResetDescription: TLabel;
    BevelRunOutputRow1: TBevel;
    BevelRunOutputRow2: TBevel;
    GroupBoxRunAdditionalArguments: TGroupBox;
    GroupBoxOptions: TGroupBox;
    CardPanelOptions: TCardPanel;
    CardProjectOptions: TCard;
    CardESPHomeOptions: TCard;
    ListBoxDependencies: TListBox;
    ButtonAddDeps: TButton;
    ButtonRemoveDeps: TButton;
    LabelDependencies: TLabel;
    LabelProjectTitle: TLabel;
    LabelProjectDescription: TLabel;
    GroupBoxProjectDependencies: TGroupBox;
    CardRunOptions: TCard;
    CardCompileOptions: TCard;
    CardUploadOptions: TCard;
    CardLogsOptions: TCard;
    CardCleanOptions: TCard;
    LabelUploadTitle: TLabel;
    LabelUploadDescription: TLabel;
    GroupBoxUploadAdditionalArguments: TGroupBox;
    LabelLogsTitle: TLabel;
    LabelLogsDescription: TLabel;
    GroupBoxLogsOutputDevice: TGroupBox;
    LabelLogsResetDescription: TLabel;
    LabelLogsNoStatesDescription: TLabel;
    BevelLogsOutputRow1: TBevel;
    GroupBoxLogsAdditionalArguments: TGroupBox;
    LabelCleanTitle: TLabel;
    LabelCleanDescription: TLabel;
    GroupBoxCleanAdditionalArguments: TGroupBox;
    CardNppOptions: TCard;
    LabelLogLevel: TLabel;
    ComboBoxLogLevel: TJvImageComboBox;
    LabelDevice: TLabel;
    ComboBoxDevice: TJvImageComboBox;
    LabelESPHomeTitle: TLabel;
    LabelESPHomeDescription: TLabel;
    GroupBoxESPHomeTargetLogging: TGroupBox;
    LabelLogLevelDescription: TLabel;
    BevelESPHomeOptionsRow1: TBevel;
    GroupBoxESPHomeAdditionalArguments: TGroupBox;
    LabelAutosave: TLabel;
    ComboBoxOptionAutosave: TJvImageComboBox;
    LabelNppTitle: TLabel;
    LabelNppDescription: TLabel;
    GroupBoxNppFileSaving: TGroupBox;
    LabelAutosaveDescription: TLabel;
    LabelOptionESPHomeAdditionalParameters: TLabel;
    CheckBoxOptionLogsReset: TCheckBox;
    LabelOptionLogsReset: TLabel;
    CheckBoxOptionLogsNoStates: TCheckBox;
    LabelOptionLogsNoStates: TLabel;
    CheckBoxOptionCompileGenerateOnly: TCheckBox;
    LabelOptionCompileGenerateOnly: TLabel;
    LabelCompileTitle: TLabel;
    LabelCompileDescription: TLabel;
    GroupBoxCompileBuildOptions: TGroupBox;
    LabelCompileGenerateOnlyDescription: TLabel;
    GroupBoxCompileAdditionalArguments: TGroupBox;
    EditOptionESPHomeAdditionalParameters: TJvEdit;
    EditOptionRunAdditionalParameters: TJvEdit;
    LinkLabelRunHelp: TLinkLabel;
    LinkLabelCompileHelp: TLinkLabel;
    LinkLabelESPHome: TLinkLabel;
    LabelOptionUploadAdditionalParameters: TLabel;
    EditOptionUploadAdditionalParameters: TJvEdit;
    EditOptionLogsAdditionalParameters: TJvEdit;
    LabelOptionLogsAdditionalParameters: TLabel;
    LinkLabelLogsOptions: TLinkLabel;
    LinkLabelUploadOptions: TLinkLabel;
    LinkLabelHelpOptions: TLinkLabel;
    LabelDeviceDesc: TLabel;
    CardConsoleOptions: TCard;
    LabelOptionConsoleAutoclose: TLabel;
    ComboBoxOptionConsoleAutoclose: TJvImageComboBox;
    CheckBoxOptionAlwaysOnTop: TCheckBox;
    LabelOptionConsoleAlwaysOnTop: TLabel;
    ComboBoxOptionConsolePosition: TJvImageComboBox;
    LabelOptionConsolePosition: TLabel;
    ComboBoxOptionConsoleMonitor: TJvImageComboBox;
    LabelOptionConsoleMonitor: TLabel;
    CheckBoxOptionSoloMode: TCheckBox;
    LabelOptionConsoleSoloMode: TLabel;
    LabelExternalConsoleTitle: TLabel;
    LabelExternalConsoleDescription: TLabel;
    GroupBoxExternalConsoleBehavior: TGroupBox;
    LabelConsoleAutocloseDescription: TLabel;
    LabelConsoleAlwaysOnTopDescription: TLabel;
    LabelConsoleSoloModeDescription: TLabel;
    BevelExternalConsoleBehaviorRow1: TBevel;
    BevelExternalConsoleBehaviorRow2: TBevel;
    GroupBoxExternalConsolePlacement: TGroupBox;
    LabelConsoleMonitorDescription: TLabel;
    LabelConsolePositionDescription: TLabel;
    BevelExternalConsolePlacementRow1: TBevel;
    LabelOptionCompileAdditionalParameters: TLabel;
    EditOptionCompileAdditionalParameters: TJvEdit;
    LabelOptionCleanAdditionalParameters: TLabel;
    EditOptionCleanAdditionalParameters: TJvEdit;
    VirtualImageMC: TVirtualImage;
    SpeedButtonRefresh: TSpeedButton;
    CardIntConsoleOptions: TCard;
    LabelIntConsoleForeground: TLabel;
    LabelIntConsoleBackground: TLabel;
    LabelIntConsoleFont: TLabel;
    LabelIntConsoleFontSize: TLabel;
    LabelIntConsoleScrollback: TLabel;
    PanelIntConsoleForegroundColor: TPanel;
    PanelIntConsoleBackgroundColor: TPanel;
    ComboBoxIntConsoleFont: TJvImageComboBox;
    EditIntConsoleFontSize: TEdit;
    UpDownIntConsoleFontSize: TUpDown;
    EditIntConsoleScrollback: TEdit;
    UpDownIntConsoleScrollback: TUpDown;
    CheckBoxIntConsoleClearOnStart: TCheckBox;
    ButtonIntConsoleDefaults: TButton;
    ColorDialog: TColorDialog;
    LabelIntConsoleClearOnStart: TLabel;
    LabelInternalConsoleTitle: TLabel;
    LabelInternalConsoleDescription: TLabel;
    GroupBoxInternalConsoleAppearance: TGroupBox;
    GroupBoxInternalConsoleBehavior: TGroupBox;
    LabelIntConsoleScrollbackDescription: TLabel;
    LabelIntConsoleClearOnStartDescription: TLabel;
    BevelInternalConsoleBehaviorRow1: TBevel;
    PanelButtons: TPanel;
    ButtonClose: TButton;
    CategoryButtons: TCategoryButtons;
    BevelVerticalSeparator: TBevel;
    LinkLabelProjectFolder: TLinkLabel;
    ButtonAutoAdd: TButton;
    ButtonClearDeps: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ToggleDarkMode; override;
    procedure CheckBoxOptionRunNoLogsClick(Sender: TObject);
    procedure CheckBoxOptionRunNoStatesClick(Sender: TObject);
    procedure ComboBoxDeviceChange(Sender: TObject);
    procedure ComboBoxOptionAutosaveChange(Sender: TObject);
    procedure ButtonAddDepsClick(Sender: TObject);
    procedure ButtonAutoAddClick(Sender: TObject);
    procedure ButtonClearDepsClick(Sender: TObject);
    procedure ButtonRemoveDepsClick(Sender: TObject);
    procedure ComboBoxLogLevelChange(Sender: TObject);
    procedure EditOptionESPHomeAdditionalParametersChange(Sender: TObject);
    procedure CheckBoxOptionRunResetClick(Sender: TObject);
    procedure EditOptionRunAdditionalParametersChange(Sender: TObject);
    procedure CheckBoxOptionCompileGenerateOnlyClick(Sender: TObject);
    procedure EditOptionUploadAdditionalParametersChange(Sender: TObject);
    procedure CheckBoxOptionLogsResetClick(Sender: TObject);
    procedure CheckBoxOptionLogsNoStatesClick(Sender: TObject);
    procedure EditOptionLogsAdditionalParametersChange(Sender: TObject);
    procedure ComboBoxOptionConsoleAutocloseChange(Sender: TObject);
    procedure LinkLabelHelpLinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure CheckBoxOptionAlwaysOnTopClick(Sender: TObject);
    procedure ComboBoxOptionConsolePositionChange(Sender: TObject);
    procedure ComboBoxOptionConsoleMonitorChange(Sender: TObject);
    procedure CheckBoxOptionSoloModeClick(Sender: TObject);
    procedure EditOptionCompileAdditionalParametersChange(Sender: TObject);
    procedure EditOptionCleanAdditionalParametersChange(Sender: TObject);
    procedure SpeedButtonRefreshClick(Sender: TObject);
    procedure ComboBoxIntConsoleFontChange(Sender: TObject);
    procedure IntConsoleColorClick(Sender: TObject);
    procedure EditIntConsoleFontSizeChange(Sender: TObject);
    procedure EditIntConsoleScrollbackChange(Sender: TObject);
    procedure CheckBoxIntConsoleClearOnStartClick(Sender: TObject);
    procedure ButtonIntConsoleDefaultsClick(Sender: TObject);
    procedure LinkLabelProjectFileLinkClick(Sender: TObject;
      const Link: string; LinkType: TSysLinkType);
    procedure CategoryButtonsSelectedItemChange(Sender: TObject;
      const Button: TButtonItem);
    procedure LinkLabelProjectFolderLinkClick(Sender: TObject;
      const Link: string; LinkType: TSysLinkType);
  private
    procedure LayoutProjectBadges;
    procedure PopulateComboDevice;
  public
    { Public declarations }
  end;

var
  FormConfiguration: TFormConfig;

implementation

{$R *.dfm}

uses
  NppESPHome.Shared, NppESPHome.Plugin, NppESPHome.FormProjects,
  NppESPHome.FormConsole, Npp.Api, Registry, Math, Winapi.ShellAPI, TDMB;

resourcestring
  rsClearProjectDependencies =
    'Remove all %d dependencies from project "%s"?' + sLineBreak + sLineBreak +
    'Project file: "%s"';
  rsClearProjectDependencies2 =
    'This removes every dependency association stored in the NppESPHome configuration. ' +
    'No file will be deleted from disk.' + sLineBreak + sLineBreak +
    'You can rebuild the automatically detected dependencies later by pressing Auto.';


procedure SetRoundedPanel(Panel: TPanel; const Radius: Integer);
var
  Rgn: HRGN;
begin
  Rgn := CreateRoundRectRgn(0, 0, Panel.Width, Panel.Height, Radius, Radius);
  SetWindowRgn(Panel.Handle, Rgn, True);
end;

procedure ConfigureProjectBadge(Panel: TPanel; const Caption, Hint: string;
  const Visible: Boolean);
const
  BadgeHeight = 20;
  HorizontalPadding = 12;
  MinimumWidth = 32;
  MaximumWidth = 150;
var
  TextCanvas: TControlCanvas;
begin
  Panel.Visible := Visible;
  if not Visible then
    Exit;

  Panel.Caption := Caption;
  Panel.Hint := Hint;
  Panel.Height := BadgeHeight;
  TextCanvas := TControlCanvas.Create;
  try
    TextCanvas.Control := Panel;
    TextCanvas.Font.Assign(Panel.Font);
    Panel.Width := EnsureRange(TextCanvas.TextWidth(Caption) +
      HorizontalPadding, MinimumWidth, MaximumWidth);
  finally
    TextCanvas.Free;
  end;
  SetRoundedPanel(Panel, Panel.Height);
end;

function FormatMicrocontroller(const Value: string): string;
begin
  if SameText(Value, 'bk72xx') then
    Result := 'BK72xx'
  else if SameText(Value, 'ln882x') then
    Result := 'LN882x'
  else if SameText(Value, 'rtl87xx') then
    Result := 'RTL87xx'
  else if SameText(Value, 'host') then
    Result := 'Host'
  else
    Result := UpperCase(Value);
end;

function FormatFramework(const Value: string): string;
begin
  if SameText(Value, 'esp-idf') or SameText(Value, 'espidf') then
    Result := 'ESP-IDF'
  else if SameText(Value, 'arduino') then
    Result := 'Arduino'
  else if SameText(Value, 'zephyr') then
    Result := 'Zephyr'
  else
    Result := Value;
end;

// Places only the available project badges, preserving their semantic order
// and wrapping them to a second row when the header cannot contain one line.
procedure TFormConfig.LayoutProjectBadges;
const
  HorizontalGap = 4;
  VerticalGap = 4;
  TopOffset = 4;
var
  Badges: array[0..11] of TPanel;
  Badge: TPanel;
  X: Integer;
  Y: Integer;
begin
  Badges[0] := PanelProjectMicrocontroller;
  Badges[1] := PanelProjectMCUVariant;
  Badges[2] := PanelProjectBoard;
  Badges[3] := PanelProjectFramework;
  Badges[4] := PanelProjectWiFi;
  Badges[5] := PanelProjectEthernet;
  Badges[6] := PanelProjectWebServer;
  Badges[7] := PanelProjectNativeAPI;
  Badges[8] := PanelProjectMQTT;
  Badges[9] := PanelProjectOTA;
  Badges[10] := PanelProjectCaptivePortal;
  Badges[11] := PanelProjectLogger;

  X := 0;
  Y := TopOffset;
  for Badge in Badges do
    if Badge.Visible then
    begin
      if (X > 0) and (X + Badge.Width > PanelProjectBadges.ClientWidth) then
      begin
        X := 0;
        Inc(Y, Badge.Height + VerticalGap);
      end;
      Badge.SetBounds(X, Y, Badge.Width, Badge.Height);
      SetRoundedPanel(Badge, Badge.Height);
      Inc(X, Badge.Width + HorizontalGap);
    end;
end;

// *****************************************************************************
// Purpose: Measures all list-box items and sets a horizontal scroll width wide
// enough for the longest dependency path.
// *****************************************************************************
procedure RecalcListBoxScrollWidth(AListBox: TListBox);
var
  I, W, MaxW: Integer;
begin
  MaxW := 0;
  AListBox.Canvas.Font.Assign(AListBox.Font);
  for I := 0 to AListBox.Items.Count - 1 do
  begin
    W := AListBox.Canvas.TextWidth(AListBox.Items[I]);
    if W > MaxW then
      MaxW := W;
  end;
  AListBox.ScrollWidth := MaxW + 8;
end;

// *****************************************************************************
// Purpose: Finds an item by display text in a JVCL image combo, which exposes
// text through GetItemText rather than a standard TStrings collection.
// *****************************************************************************
function FindImageComboText(Combo: TJvImageComboBox;
  const Text: string): Integer;
var
  Index: Integer;
begin
  Result := -1;
  for Index := 0 to Combo.GetCount - 1 do
    if SameText(Combo.GetItemText(Index), Text) then
      Exit(Index);
end;

// *****************************************************************************
// Purpose: Persists a terminal font change made on the integrated-console card.
// *****************************************************************************
procedure TFormConfig.ComboBoxIntConsoleFontChange(Sender: TObject);
var
  FontName: string;
begin
  inherited;
  if ComboBoxIntConsoleFont.ItemIndex < 0 then
    Exit;
  FontName := ComboBoxIntConsoleFont.GetItemText(
    ComboBoxIntConsoleFont.ItemIndex);
  if FontName = '' then
    Exit;
  ProjectList.Current.SetOption(csKeyIntConsoleFontName, FontName);
  if Assigned(FormConsole) then
    FormConsole.ApplyPreferences;
end;

// *****************************************************************************
// Purpose: Opens the shared color dialog for a console color sample and saves
// the selected foreground or background color.
// *****************************************************************************
procedure TFormConfig.IntConsoleColorClick(Sender: TObject);
var
  ColorPanel: TPanel;
  OptionName: string;
begin
  inherited;
  if not (Sender is TPanel) then
    Exit;
  ColorPanel := TPanel(Sender);
  if ColorPanel = PanelIntConsoleForegroundColor then
    OptionName := csKeyIntConsoleForegroundColor
  else if ColorPanel = PanelIntConsoleBackgroundColor then
    OptionName := csKeyIntConsoleBackgroundColor
  else
    Exit;
  ColorDialog.Color := ColorPanel.Color;
  if ColorDialog.Execute(Handle) then
  begin
    ColorPanel.Color := ColorDialog.Color;
    ProjectList.Current.SetOption(OptionName, Integer(ColorPanel.Color));
    if Assigned(FormConsole) then
      FormConsole.ApplyPreferences;
  end;
end;

// *****************************************************************************
// Purpose: Validates and persists a terminal font-size change.
// *****************************************************************************
procedure TFormConfig.EditIntConsoleFontSizeChange(Sender: TObject);
var
  Value: Integer;
begin
  inherited;
  if TryStrToInt(EditIntConsoleFontSize.Text, Value) and
    InRange(Value, ciMinIntConsoleFontSize, ciMaxIntConsoleFontSize) then
  begin
    ProjectList.Current.SetOption(csKeyIntConsoleFontSize, Value);
    if Assigned(FormConsole) then
      FormConsole.ApplyPreferences;
  end;
end;

// *****************************************************************************
// Purpose: Validates and persists a scrollback line-count change.
// *****************************************************************************
procedure TFormConfig.EditIntConsoleScrollbackChange(Sender: TObject);
var
  Value: Integer;
begin
  inherited;
  if TryStrToInt(EditIntConsoleScrollback.Text, Value) and
    InRange(Value, ciMinIntConsoleScrollbackLines,
    ciMaxIntConsoleScrollbackLines) then
  begin
    ProjectList.Current.SetOption(csKeyIntConsoleScrollbackLines, Value);
    if Assigned(FormConsole) then
      FormConsole.ApplyPreferences;
  end;
end;

// *****************************************************************************
// Purpose: Persists whether a new integrated command clears previous output.
// *****************************************************************************
procedure TFormConfig.CategoryButtonsSelectedItemChange(Sender: TObject;
  const Button: TButtonItem);
begin
  CardPanelOptions.ActiveCardIndex := Button.Index;
end;

procedure TFormConfig.CheckBoxIntConsoleClearOnStartClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyIntConsoleClearOnStart,
    CheckBoxIntConsoleClearOnStart.Checked);
  if Assigned(FormConsole) then
    FormConsole.ApplyPreferences;
end;

// *****************************************************************************
// Purpose: Restores the global integrated-console controls to their defaults,
// saves them, and refreshes the open console.
// *****************************************************************************
procedure TFormConfig.ButtonIntConsoleDefaultsClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyIntConsoleForegroundColor,
    ciDefaultIntConsoleForegroundColor);
  ProjectList.Current.SetOption(csKeyIntConsoleBackgroundColor,
    ciDefaultIntConsoleBackgroundColor);
  ProjectList.Current.SetOption(csKeyIntConsoleFontName,
    csDefaultIntConsoleFontName);
  ProjectList.Current.SetOption(csKeyIntConsoleFontSize,
    ciDefaultIntConsoleFontSize);
  ProjectList.Current.SetOption(csKeyIntConsoleScrollbackLines,
    ciDefaultIntConsoleScrollbackLines);
  ProjectList.Current.SetOption(csKeyIntConsoleClearOnStart,
    cbDefaultIntConsoleClearOnStart);
  PanelIntConsoleForegroundColor.Color := TColor(
    ciDefaultIntConsoleForegroundColor);
  PanelIntConsoleBackgroundColor.Color := TColor(
    ciDefaultIntConsoleBackgroundColor);
  ComboBoxIntConsoleFont.ItemIndex := FindImageComboText(
    ComboBoxIntConsoleFont, csDefaultIntConsoleFontName);
  if (ComboBoxIntConsoleFont.ItemIndex < 0) and
    (ComboBoxIntConsoleFont.Items.Count > 0) then
    ComboBoxIntConsoleFont.ItemIndex := 0;
  UpDownIntConsoleFontSize.Position := ciDefaultIntConsoleFontSize;
  UpDownIntConsoleScrollback.Position :=
    ciDefaultIntConsoleScrollbackLines;
  CheckBoxIntConsoleClearOnStart.Checked :=
    cbDefaultIntConsoleClearOnStart;
  if Assigned(FormConsole) then
    FormConsole.ApplyPreferences;
end;

// *****************************************************************************
// Purpose: Adds selected dependency files to the current project, removes the
// main project file if selected, persists the list, and refreshes dependent
// views.
// *****************************************************************************
procedure TFormConfig.ButtonAddDepsClick(Sender: TObject);
begin
  inherited;
  if FileOpenDialogDependency.Execute(Self.Handle) then
  begin
    ProjectList.Current.AddOptionDependencies(FileOpenDialogDependency.Files);
    ProjectList.Current.SaveOptionDependencies;
    ListBoxDependencies.Items.Clear;
    ListBoxDependencies.Items.AddStrings(ProjectList.Current.OptionDependencies);
    RecalcListBoxScrollWidth(ListBoxDependencies);
    Plugin.RefreshProjectList;
    if Assigned(FormProjects) then
      FormProjects.CurrentDocumentChanged;
  end;
end;

// *****************************************************************************
// Purpose: Scans the complete local ESPHome configuration chain and appends
// every referenced file to the current project's dependency list.
// *****************************************************************************
procedure TFormConfig.ButtonAutoAddClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.AddOptionDependencies;
  ProjectList.Current.SaveOptionDependencies;
  ListBoxDependencies.Items.Assign(ProjectList.Current.OptionDependencies);
  RecalcListBoxScrollWidth(ListBoxDependencies);
  Plugin.RefreshProjectList;
  if Assigned(FormProjects) then
    FormProjects.CurrentDocumentChanged;
end;

// *****************************************************************************
// Purpose: Removes every dependency associated with the current project after
// explicit confirmation. The dependency files themselves are never deleted.
// *****************************************************************************
procedure TFormConfig.ButtonClearDepsClick(Sender: TObject);
begin
  inherited;
  if ProjectList.Current.OptionDependencies.Count = 0 then
    Exit;

  if TD(Format(rsClearProjectDependencies,
    [ProjectList.Current.OptionDependencies.Count,
    ProjectList.Current.FriendlyName,
    ExpandFileName(ProjectList.Current.FileName)])).
    Text(rsClearProjectDependencies2).WindowCaption(rsMessageBoxWarning).
    Warning.YesNo.DefButton(tcbNo).AddFlag(tfAllowDialogCancellation).
    Execute(Self) <> mrYes then
    Exit;

  ProjectList.Current.ClearOptionDependencies;
  ProjectList.Current.SaveOptionDependencies;
  ListBoxDependencies.Items.Clear;
  RecalcListBoxScrollWidth(ListBoxDependencies);
  Plugin.RefreshProjectList;
  if Assigned(FormProjects) then
    FormProjects.CurrentDocumentChanged;
end;

// *****************************************************************************
// Purpose: Removes all selected dependency entries, persists the updated list,
// and restores a useful list selection.
// *****************************************************************************
procedure TFormConfig.ButtonRemoveDepsClick(Sender: TObject);
var
  I, Sel: Integer;
  Deleted: Boolean;
begin
  inherited;
  Sel := -1;
  Deleted := False;
  // Iterate backwards so deleting selected rows cannot shift pending indexes.
  for I := ListBoxDependencies.Count - 1 downto 0 do
  begin
    if ListBoxDependencies.Selected[I] then
    begin
      Sel := I;
      ListBoxDependencies.Items.Delete(I);
      ProjectList.Current.OptionDependencies.Delete(I);
      Deleted := True;
    end;
  end;
  if Deleted then
  begin
    ProjectList.Current.SaveOptionDependencies;
    if ListBoxDependencies.Count > 0 then
      ListBoxDependencies.ItemIndex := Max(0, Sel - 1);
    RecalcListBoxScrollWidth(ListBoxDependencies);
    Plugin.RefreshProjectList;
    if Assigned(FormProjects) then
      FormProjects.CurrentDocumentChanged;
  end;
end;

// *****************************************************************************
// Purpose: Persists whether ESPHome console windows should remain above other
// windows.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionAlwaysOnTopClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyConsoleAlwaysOnTop, CheckBoxOptionAlwaysOnTop.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether compile should generate source files without
// completing a full build.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionCompileGenerateOnlyClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyCompileGenerateOnly, CheckBoxOptionCompileGenerateOnly.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether the logs command should hide entity state changes.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionLogsNoStatesClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyLogsNoStates, CheckBoxOptionLogsNoStates.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether the logs command should reset the connected device.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionLogsResetClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyLogsReset, CheckBoxOptionLogsReset.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether the run command should suppress the log stream.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionRunNoLogsClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyRunNoLogs, CheckBoxOptionRunNoLogs.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether the run command should hide entity state changes.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionRunNoStatesClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyRunNoStates, CheckBoxOptionRunNoStates.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether the run command should reset the connected device.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionRunResetClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyRunReset, CheckBoxOptionRunReset.Checked);
end;

// *****************************************************************************
// Purpose: Persists whether a newly launched ESPHome console should replace an
// existing one.
// *****************************************************************************
procedure TFormConfig.CheckBoxOptionSoloModeClick(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyConsoleSoloMode, CheckBoxOptionSoloMode.Checked);
end;

// *****************************************************************************
// Purpose: Persists the selected Notepad++ auto-save policy used before ESPHome
// commands run.
// *****************************************************************************
procedure TFormConfig.ComboBoxOptionAutosaveChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyNppAutosave, ComboBoxOptionAutosave.ItemIndex);
end;

// *****************************************************************************
// Purpose: Persists additional command-line parameters for the clean command.
// *****************************************************************************
procedure TFormConfig.EditOptionCleanAdditionalParametersChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyCleanExtraParameters, EditOptionCleanAdditionalParameters.Text);
end;

// *****************************************************************************
// Purpose: Persists additional command-line parameters for the compile command.
// *****************************************************************************
procedure TFormConfig.EditOptionCompileAdditionalParametersChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyCompileExtraParameters, EditOptionCompileAdditionalParameters.Text);
end;

// *****************************************************************************
// Purpose: Persists command-line parameters shared by all ESPHome invocations.
// *****************************************************************************
procedure TFormConfig.EditOptionESPHomeAdditionalParametersChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyESPHomeExtraParameters, EditOptionESPHomeAdditionalParameters.Text);
end;

// *****************************************************************************
// Purpose: Persists additional command-line parameters for the logs command.
// *****************************************************************************
procedure TFormConfig.EditOptionLogsAdditionalParametersChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyLogsExtraParameters, EditOptionLogsAdditionalParameters.Text);
end;

// *****************************************************************************
// Purpose: Persists additional command-line parameters for the run command.
// *****************************************************************************
procedure TFormConfig.EditOptionRunAdditionalParametersChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyRunExtraParameters, EditOptionRunAdditionalParameters.Text);
end;

// *****************************************************************************
// Purpose: Persists additional command-line parameters for the upload command.
// *****************************************************************************
procedure TFormConfig.EditOptionUploadAdditionalParametersChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyUploadExtraParameters, EditOptionUploadAdditionalParameters.Text);
end;

// *****************************************************************************
// Purpose: Persists whether a successful ESPHome console process should close
// automatically.
// *****************************************************************************
procedure TFormConfig.ComboBoxOptionConsoleAutocloseChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyConsoleAutoClose, (ComboBoxOptionConsoleAutoclose.ItemIndex = 1));
end;

// *****************************************************************************
// Purpose: Persists the physical monitor selected for newly created console
// windows.
// *****************************************************************************
procedure TFormConfig.ComboBoxOptionConsoleMonitorChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyConsoleStartingMonitor, Integer(ComboBoxOptionConsoleMonitor.Items.Objects[ComboBoxOptionConsoleMonitor.ItemIndex]));
end;

// *****************************************************************************
// Purpose: Persists the preferred starting position for newly created console
// windows.
// *****************************************************************************
procedure TFormConfig.ComboBoxOptionConsolePositionChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyConsoleStartingPosition, ComboBoxOptionConsolePosition.ItemIndex);
end;

// *****************************************************************************
// Purpose: Persists the selected upload or logging target for the current
// project.
// *****************************************************************************
procedure TFormConfig.ComboBoxDeviceChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyESPHomeTargetDevice, ComboBoxDevice.Items[ComboBoxDevice.ItemIndex].Text);
end;

// *****************************************************************************
// Purpose: Persists the ESPHome log level selected for the current project.
// *****************************************************************************
procedure TFormConfig.ComboBoxLogLevelChange(Sender: TObject);
begin
  inherited;
  ProjectList.Current.SetOption(csKeyESPHomeLogLevel, ComboBoxLogLevel.ItemIndex);
end;

// *****************************************************************************
// Purpose: Enumerates available monitors, labels their resolution and primary
// status, and restores the saved selection.
// *****************************************************************************
procedure PopulateMonitorCombo(Combo: TJvImageComboBox; Index: Integer);
var
  I: Integer;
  S: string;
begin
  Combo.Items.Clear;
  // Store the zero-based monitor number in Objects for direct persistence.
  for I := 0 to Screen.MonitorCount - 1 do
  begin
    S := Format('Monitor %d [%dx%d]', [I + 1, Screen.Monitors[I].Width, Screen.Monitors[I].Height]);
    if Screen.Monitors[I].Primary then
      S := S + ' (Primary)';
    Combo.Items.AddObject(S, TObject(I));
  end;
  if Combo.Items.Count > Index then
    Combo.ItemIndex := Index;
end;

// *****************************************************************************
// Purpose: Loads project and global options into their controls, populates
// dynamic lists, and applies the active theme.
// *****************************************************************************
procedure TFormConfig.FormCreate(Sender: TObject);
var
  FontName: string;
  Index: Integer;
begin
  inherited;

  LabelProjectSummaryName.Caption := ProjectList.Current.FriendlyName;
  if ProjectList.Current.Name <> ProjectList.Current.FriendlyName then
    LabelProjectSummaryName.Caption := Format('%s (%s)', [ProjectList.Current.FriendlyName, ProjectList.Current.Name]);

  LabelProjectSummaryFile.Caption := ExtractFileName(
    ProjectList.Current.FileName);

  ConfigureProjectBadge(PanelProjectMicrocontroller,
    FormatMicrocontroller(ProjectList.Current.Microcontroller),
    'Microcontroller',
    ProjectList.Current.Microcontroller <> '');
  ConfigureProjectBadge(PanelProjectMCUVariant,
    ProjectList.Current.MCUVariant, 'Microcontroller variant',
    ProjectList.Current.MCUVariant <> '');
  ConfigureProjectBadge(PanelProjectBoard, ProjectList.Current.Board, 'Board',
    ProjectList.Current.Board <> '');
  ConfigureProjectBadge(PanelProjectFramework,
    FormatFramework(ProjectList.Current.Framework), 'Framework',
    ProjectList.Current.Framework <> '');
  ConfigureProjectBadge(PanelProjectWiFi, 'Wi-Fi', 'Wi-Fi enabled',
    ProjectList.Current.HasWiFi);
  ConfigureProjectBadge(PanelProjectEthernet, 'Ethernet',
    'Ethernet enabled', ProjectList.Current.HasEthernet);
  ConfigureProjectBadge(PanelProjectWebServer, 'Web Server',
    'Web server enabled', ProjectList.Current.HasWebServer);
  ConfigureProjectBadge(PanelProjectNativeAPI, 'API',
    'ESPHome native API enabled', ProjectList.Current.HasNativeAPI);
  ConfigureProjectBadge(PanelProjectMQTT, 'MQTT', 'MQTT enabled',
    ProjectList.Current.HasMQTT);
  ConfigureProjectBadge(PanelProjectOTA, 'OTA', 'OTA updates enabled',
    ProjectList.Current.HasOTA);
  ConfigureProjectBadge(PanelProjectCaptivePortal, 'Captive portal',
    'Captive portal enabled', ProjectList.Current.HasCaptivePortal);
  ConfigureProjectBadge(PanelProjectLogger, 'Logger', 'Logger enabled',
    ProjectList.Current.HasLogger);
  LayoutProjectBadges;

  if ProjectList.Current.GetOption(csKeyConsoleAutoClose, True) then
    ComboBoxOptionConsoleAutoclose.ItemIndex := 1
  else
    ComboBoxOptionConsoleAutoclose.ItemIndex := 0;

  VirtualImageMC.ImageName := 'mi_' + ProjectList.Current.Microcontroller;

  ComboBoxLogLevel.ItemIndex := ProjectList.Current.GetOption(csKeyESPHomeLogLevel, ciLogLevelDefault);
  EditOptionESPHomeAdditionalParameters.Text := ProjectList.Current.GetOption(csKeyESPHomeExtraParameters, csDefaultEmpty);
  ComboBoxOptionAutosave.ItemIndex := ProjectList.Current.GetOption(csKeyNppAutosave, ciAutoSaveAllFiles);
  CheckBoxOptionAlwaysOnTop.Checked := ProjectList.Current.GetOption(csKeyConsoleAlwaysOnTop, False);
  CheckBoxOptionSoloMode.Checked := ProjectList.Current.GetOption(csKeyConsoleSoloMode, False);
  ComboBoxOptionConsolePosition.ItemIndex := ProjectList.Current.GetOption(csKeyConsoleStartingPosition, ciConsolePosDecidedByWindows);
  PopulateMonitorCombo(ComboBoxOptionConsoleMonitor, ProjectList.Current.GetOption(csKeyConsoleStartingMonitor, 0));

  ComboBoxIntConsoleFont.Items.Clear;
  for Index := 0 to Screen.Fonts.Count - 1 do
    ComboBoxIntConsoleFont.Items.AddTextItem(Screen.Fonts[Index]);
  PanelIntConsoleForegroundColor.Color := TColor(
    ProjectList.Current.GetOption(csKeyIntConsoleForegroundColor,
      ciDefaultIntConsoleForegroundColor));
  PanelIntConsoleBackgroundColor.Color := TColor(
    ProjectList.Current.GetOption(csKeyIntConsoleBackgroundColor,
      ciDefaultIntConsoleBackgroundColor));
  FontName := ProjectList.Current.GetOption(csKeyIntConsoleFontName,
    csDefaultIntConsoleFontName);
  ComboBoxIntConsoleFont.ItemIndex := FindImageComboText(
    ComboBoxIntConsoleFont, FontName);
  if ComboBoxIntConsoleFont.ItemIndex < 0 then
    ComboBoxIntConsoleFont.ItemIndex := FindImageComboText(
      ComboBoxIntConsoleFont, csDefaultIntConsoleFontName);
  if (ComboBoxIntConsoleFont.ItemIndex < 0) and
    (ComboBoxIntConsoleFont.Items.Count > 0) then
    ComboBoxIntConsoleFont.ItemIndex := 0;
  UpDownIntConsoleFontSize.Position := EnsureRange(
    ProjectList.Current.GetOption(csKeyIntConsoleFontSize,
    ciDefaultIntConsoleFontSize), ciMinIntConsoleFontSize,
    ciMaxIntConsoleFontSize);
  UpDownIntConsoleScrollback.Position := EnsureRange(
    ProjectList.Current.GetOption(csKeyIntConsoleScrollbackLines,
    ciDefaultIntConsoleScrollbackLines),
    ciMinIntConsoleScrollbackLines, ciMaxIntConsoleScrollbackLines);
  CheckBoxIntConsoleClearOnStart.Checked := ProjectList.Current.GetOption(
    csKeyIntConsoleClearOnStart,
    cbDefaultIntConsoleClearOnStart);

  CheckBoxOptionRunNoLogs.Checked := ProjectList.Current.GetOption(csKeyRunNoLogs, False);
  CheckBoxOptionRunNoStates.Checked := ProjectList.Current.GetOption(csKeyRunNoStates, False);
  CheckBoxOptionRunReset.Checked := ProjectList.Current.GetOption(csKeyRunReset, False);
  EditOptionRunAdditionalParameters.Text := ProjectList.Current.GetOption(csKeyRunExtraParameters, csDefaultEmpty);

  CheckBoxOptionCompileGenerateOnly.Checked := ProjectList.Current.GetOption(csKeyCompileGenerateOnly, False);

  EditOptionUploadAdditionalParameters.Text := ProjectList.Current.GetOption(csKeyUploadExtraParameters, csDefaultEmpty);
  EditOptionCompileAdditionalParameters.Text := ProjectList.Current.GetOption(csKeyCompileExtraParameters, csDefaultEmpty);
  EditOptionCleanAdditionalParameters.Text := ProjectList.Current.GetOption(csKeyCleanExtraParameters, csDefaultEmpty);

  CheckBoxOptionLogsReset.Checked := ProjectList.Current.GetOption(csKeyLogsReset, False);
  CheckBoxOptionLogsNoStates.Checked := ProjectList.Current.GetOption(csKeyLogsNoStates, False);
  EditOptionLogsAdditionalParameters.Text := ProjectList.Current.GetOption(csKeyLogsExtraParameters, csDefaultEmpty);

  PopulateComboDevice;

  ProjectList.Current.LoadOptionDependencies;
  ListBoxDependencies.Items.AddStrings(ProjectList.Current.OptionDependencies);
  RecalcListBoxScrollWidth(ListBoxDependencies);

  ToggleDarkMode;
end;

// *****************************************************************************
// Purpose: Opens a clicked help URL in the user's default browser.
// *****************************************************************************
procedure TFormConfig.LinkLabelHelpLinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
  inherited;
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

// *****************************************************************************
// Purpose: Opens the current project file in Notepad++ from the project summary.
// *****************************************************************************
procedure TFormConfig.LinkLabelProjectFileLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  inherited;
  if not Plugin.SwitchToFile(ProjectList.Current.FileName) then
    Plugin.OpenFile(ProjectList.Current.FileName);
end;

procedure TFormConfig.LinkLabelProjectFolderLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
var
  ProjectFolder: string;
begin
  inherited;
  ProjectFolder := ExtractFileDir(ExpandFileName(
    ProjectList.Current.FileName));
  if DirectoryExists(ProjectFolder) then
    ShellExecute(Handle, 'open', PChar(ProjectFolder), nil, nil,
      SW_SHOWNORMAL);
end;

// *****************************************************************************
// Purpose: Applies the current Notepad++ palette, icon set, and control colors
// to the configuration dialog.
// *****************************************************************************
procedure TFormConfig.ToggleDarkMode;
var
  DarkModeColors: TNppDarkModeColors;
begin
  inherited ToggleDarkMode;

  AssignWindowIcon(Icon);
  AssignImageResources(VirtualImageList);
  AssignImageResources(VirtualImageMC);

  DarkModeColors := Default(TNppDarkModeColors);
  if not (Plugin.IsDarkModeEnabled and
    Plugin.GetDarkModeColors(@DarkModeColors)) then
    TNppPlugin.InitializeLightModeColors(DarkModeColors);

  Self.Color := TColor(DarkModeColors.Background);
  Self.Font.Color := TColor(DarkModeColors.Text);

  GroupBoxProject.Font.Color := TColor(DarkModeColors.Text);
  LabelProjectSummaryName.Font.Color := TColor(DarkModeColors.Text);
  LabelProjectSummaryFile.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectMicrocontroller.Color :=
    TColor(DarkModeColors.SofterBackground);
  PanelProjectMCUVariant.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectBoard.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectFramework.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectWiFi.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectEthernet.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectWebServer.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectNativeAPI.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectMQTT.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectOTA.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectCaptivePortal.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectLogger.Color := TColor(DarkModeColors.SofterBackground);
  PanelProjectMicrocontroller.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectMCUVariant.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectBoard.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectFramework.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectWiFi.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectEthernet.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectWebServer.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectNativeAPI.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectMQTT.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectOTA.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectCaptivePortal.Font.Color := TColor(DarkModeColors.DarkerText);
  PanelProjectLogger.Font.Color := TColor(DarkModeColors.DarkerText);
  LabelProjectTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelProjectDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxProjectDependencies.Font.Color := TColor(DarkModeColors.Text);
  LabelDependencies.Font.Color := TColor(DarkModeColors.DarkerText);
  ListBoxDependencies.Font.Color := TColor(DarkModeColors.Text);
  LabelRunTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelRunDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxRunOutputDevice.Font.Color := TColor(DarkModeColors.Text);
  GroupBoxRunAdditionalArguments.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionRunNoLogs.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionRunNoStates.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionRunReset.Font.Color := TColor(DarkModeColors.Text);
  LabelRunNoLogsDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelRunNoStatesDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelRunResetDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelOptionRunAdditionalParameters.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelCompileTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelCompileDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxCompileBuildOptions.Font.Color := TColor(DarkModeColors.Text);
  GroupBoxCompileAdditionalArguments.Font.Color :=
    TColor(DarkModeColors.Text);
  LabelOptionCompileGenerateOnly.Font.Color := TColor(DarkModeColors.Text);
  LabelCompileGenerateOnlyDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelOptionCompileAdditionalParameters.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelUploadTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelUploadDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxUploadAdditionalArguments.Font.Color :=
    TColor(DarkModeColors.Text);
  LabelOptionUploadAdditionalParameters.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelLogsTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelLogsDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxLogsOutputDevice.Font.Color := TColor(DarkModeColors.Text);
  GroupBoxLogsAdditionalArguments.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionLogsReset.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionLogsNoStates.Font.Color := TColor(DarkModeColors.Text);
  LabelLogsResetDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  LabelLogsNoStatesDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelOptionLogsAdditionalParameters.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelCleanTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelCleanDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxCleanAdditionalArguments.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionCleanAdditionalParameters.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelESPHomeTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelESPHomeDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxESPHomeTargetLogging.Font.Color := TColor(DarkModeColors.Text);
  GroupBoxESPHomeAdditionalArguments.Font.Color :=
    TColor(DarkModeColors.Text);
  LabelDevice.Font.Color := TColor(DarkModeColors.Text);
  LabelDeviceDesc.Font.Color := TColor(DarkModeColors.DarkerText);
  LabelLogLevel.Font.Color := TColor(DarkModeColors.Text);
  LabelLogLevelDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  LabelOptionESPHomeAdditionalParameters.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelNppTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelNppDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxNppFileSaving.Font.Color := TColor(DarkModeColors.Text);
  LabelAutosave.Font.Color := TColor(DarkModeColors.Text);
  LabelAutosaveDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  LabelExternalConsoleTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelExternalConsoleDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  GroupBoxExternalConsoleBehavior.Font.Color := TColor(DarkModeColors.Text);
  GroupBoxExternalConsolePlacement.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionConsoleAutoclose.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionConsoleAlwaysOnTop.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionConsoleSoloMode.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionConsoleMonitor.Font.Color := TColor(DarkModeColors.Text);
  LabelOptionConsolePosition.Font.Color := TColor(DarkModeColors.Text);
  LabelConsoleAutocloseDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelConsoleAlwaysOnTopDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelConsoleSoloModeDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelConsoleMonitorDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelConsolePositionDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelInternalConsoleTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelInternalConsoleDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  GroupBoxInternalConsoleAppearance.Font.Color := TColor(DarkModeColors.Text);
  GroupBoxInternalConsoleBehavior.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleForeground.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleBackground.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleFont.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleFontSize.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleScrollback.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleClearOnStart.Font.Color := TColor(DarkModeColors.Text);
  LabelIntConsoleScrollbackDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelIntConsoleClearOnStartDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  EditOptionRunAdditionalParameters.Font.Color := Self.Font.Color;
  EditOptionESPHomeAdditionalParameters.Font.Color := Self.Font.Color;
  EditOptionUploadAdditionalParameters.Font.Color := Self.Font.Color;
  EditOptionLogsAdditionalParameters.Font.Color := Self.Font.Color;
  EditOptionCleanAdditionalParameters.Font.Color := Self.Font.Color;
  EditOptionCompileAdditionalParameters.Font.Color := Self.Font.Color;

  CategoryButtons.Font.Color := Self.Font.Color;
  CategoryButtons.RegularButtonColor := clNone;
  CategoryButtons.HotButtonColor := TColor(DarkModeColors.hotEdge);
  CategoryButtons.SelectedButtonColor := TColor(DarkModeColors.softerBackground);

  // Keep the two clickable color samples independent from the form palette.
  PanelIntConsoleForegroundColor.Color := TColor(
    ProjectList.Current.GetOption(csKeyIntConsoleForegroundColor,
    ciDefaultIntConsoleForegroundColor));
  PanelIntConsoleBackgroundColor.Color := TColor(
    ProjectList.Current.GetOption(csKeyIntConsoleBackgroundColor,
    ciDefaultIntConsoleBackgroundColor));

  // Open the settings window on the current-project page.
  CategoryButtons.SelectedItem := CategoryButtons.Categories[0].Items[0];

end;

// *****************************************************************************
// Purpose: Rebuilds the target-device list from automatic, serial-port, and
// Wi-Fi choices and restores the saved target.
// *****************************************************************************
procedure TFormConfig.PopulateComboDevice;
var
  Index: Integer;
  ComPorts: TStringList;
  Registry: TRegistry;
begin
  ComboBoxDevice.Items.Clear;
  ComboBoxDevice.Items[ComboBoxDevice.Items.AddTextItem(rsDefaultNone).Index].ImageIndex := ComboBoxDevice.Images.GetIndexByName(csIconNone);
  ComboBoxDevice.ItemIndex := 0;

  ComPorts := TStringList.Create;
  Registry := TRegistry.Create;
  Registry.RootKey := HKEY_LOCAL_MACHINE;
  Registry.Access := KEY_READ;
  if Registry.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM', False) then
  begin
    Registry.GetValueNames(ComPorts);
    for Index := 0 to ComPorts.Count - 1 do
      ComboBoxDevice.Items[ComboBoxDevice.Items.AddTextItem(Registry.ReadString(ComPorts.Strings[Index])).Index].ImageIndex := ComboBoxDevice.Images.GetIndexByName(csIconSerial);
  end;
  Registry.CloseKey;
  Registry.Destroy;
  ComPorts.Free;

  ComboBoxDevice.Items[ComboBoxDevice.Items.AddTextItem(rsDefaultWiFi).Index].ImageIndex := ComboBoxDevice.Images.GetIndexByName(csIconWiFi);

  if Assigned(ProjectList.Current) then
    for Index := 0 to ComboBoxDevice.GetCount - 1 do
      if ComboBoxDevice.GetItemText(Index) = ProjectList.Current.GetOption(csKeyESPHomeTargetDevice, '') then
        ComboBoxDevice.ItemIndex := Index;
end;

// *****************************************************************************
// Purpose: Refreshes the list of currently available target devices.
// *****************************************************************************
procedure TFormConfig.SpeedButtonRefreshClick(Sender: TObject);
begin
  inherited;
  PopulateComboDevice;
end;


end.
