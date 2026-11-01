// Project selection dialog for NppESPHome.
// Lets the user choose, add, or remove a known project and propagates the selection to the plugin UI.
unit NppESPHome.FormSelectProject;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.VirtualImage, Npp.Plugin, Npp.Vcl.Forms;

type
  // Modal dialog that mirrors ProjectList and manages the current selection.
  TFormSelection = class(TNppPluginForm)
    PanelHeader: TPanel;
    VirtualImageProject: TVirtualImage;
    LabelTitle: TLabel;
    LabelDescription: TLabel;
    BevelHeader: TBevel;
    GroupBoxCurrentProject: TGroupBox;
    LabelCurrentProject: TLabel;
    LabelCurrentProjectDescription: TLabel;
    ComboBoxProject: TComboBox;
    LabelSelectedProjectPath: TLabel;
    ButtonAddProject: TButton;
    ButtonRemoveProject: TButton;
    PanelButtons: TPanel;
    ButtonClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxProjectChange(Sender: TObject);
    procedure ButtonAddProjectClick(Sender: TObject);
    procedure ButtonRemoveProjectClick(Sender: TObject);
    procedure ToggleDarkMode; override;
  private
    procedure RefreshComboBox;
    procedure UpdateProjectDetails;
  public
    { Public declarations }

  end;

var
  FormSelection: TFormSelection;

implementation

{$R *.dfm}

uses
  NppESPHome.Shared, NppESPHome.Plugin, Npp.Api;

// *****************************************************************************
// Purpose: Delegates project creation to the plugin and refreshes the selector.
// *****************************************************************************
procedure TFormSelection.ButtonAddProjectClick(Sender: TObject);
begin
  inherited;
  Plugin.ProjectAdd(Self.Handle);
  RefreshComboBox;
end;

// *****************************************************************************
// Purpose: Delegates project removal to the plugin and refreshes the selector.
// *****************************************************************************
procedure TFormSelection.ButtonRemoveProjectClick(Sender: TObject);
begin
  inherited;
  Plugin.ProjectRemove(Self.Handle);
  RefreshComboBox;
end;

// *****************************************************************************
// Purpose: Applies the current Notepad++ palette and window icon to the project
// selection dialog.
// *****************************************************************************
procedure TFormSelection.ToggleDarkMode;
var
  DarkModeColors: TNppDarkModeColors;
begin
  inherited ToggleDarkMode;
  AssignWindowIcon(Icon);
  AssignImageResources(VirtualImageProject);

  DarkModeColors := Default(TNppDarkModeColors);
  if not (Plugin.IsDarkModeEnabled and
    Plugin.GetDarkModeColors(@DarkModeColors)) then
    TNppPlugin.InitializeLightModeColors(DarkModeColors);

  Self.Color := TColor(DarkModeColors.Background);
  Self.Font.Color := TColor(DarkModeColors.Text);
  PanelHeader.Color := TColor(DarkModeColors.Background);
  LabelTitle.Font.Color := TColor(DarkModeColors.Text);
  LabelDescription.Font.Color := TColor(DarkModeColors.DarkerText);
  GroupBoxCurrentProject.Font.Color := TColor(DarkModeColors.Text);
  LabelCurrentProject.Font.Color := TColor(DarkModeColors.Text);
  LabelCurrentProjectDescription.Font.Color :=
    TColor(DarkModeColors.DarkerText);
  LabelSelectedProjectPath.Font.Color := TColor(DarkModeColors.DarkerText);
  ComboBoxProject.Color := TColor(DarkModeColors.SofterBackground);
  ComboBoxProject.Font.Color := TColor(DarkModeColors.Text);
  PanelButtons.Color := TColor(DarkModeColors.Background);
end;

// *****************************************************************************
// Purpose: Makes the combo-box selection current and refreshes all
// project-dependent plugin state.
// *****************************************************************************
procedure TFormSelection.ComboBoxProjectChange(Sender: TObject);
begin
  inherited;
  if (ComboBoxProject.ItemIndex >= 0) and (ComboBoxProject.Items.Count > 0) then
    ProjectList.Current := TProject(
      ComboBoxProject.Items.Objects[ComboBoxProject.ItemIndex]);
  Plugin.RefreshProjectList;
  UpdateProjectDetails;
end;

// *****************************************************************************
// Purpose: Initializes the project selector from the shared project list.
// *****************************************************************************
procedure TFormSelection.FormCreate(Sender: TObject);
begin
  inherited;
  RefreshComboBox;
  ToggleDarkMode;
end;

// *****************************************************************************
// Purpose: Rebuilds the project combo box and restores the item corresponding
// to the current project.
// *****************************************************************************
procedure TFormSelection.RefreshComboBox;
var
  DisplayName: string;
  ItemIndex: Integer;
  P: TProject;
begin
  ComboBoxProject.Clear;
  for P in ProjectList do
    if P.IsValid then
    begin
      DisplayName := P.FriendlyName;
      if P.Name <> P.FriendlyName then
        DisplayName := Format('%s (%s)', [DisplayName, P.Name]);
      ItemIndex := ComboBoxProject.Items.AddObject(DisplayName, P);
      if P = ProjectList.Current then
        ComboBoxProject.ItemIndex := ItemIndex;
    end;
  UpdateProjectDetails;
end;

// *****************************************************************************
// Purpose: Shows the selected project path and keeps project-specific actions
// consistent with the current selection.
// *****************************************************************************
procedure TFormSelection.UpdateProjectDetails;
begin
  if Assigned(ProjectList.Current) and
    (ComboBoxProject.ItemIndex >= 0) then
  begin
    LabelSelectedProjectPath.Caption := ProjectList.Current.FileName;
    LabelSelectedProjectPath.Hint := ProjectList.Current.FileName;
    ButtonRemoveProject.Enabled := True;
  end
  else
  begin
    LabelSelectedProjectPath.Caption := 'No project is currently selected.';
    LabelSelectedProjectPath.Hint := '';
    ButtonRemoveProject.Enabled := False;
  end;
end;

end.
