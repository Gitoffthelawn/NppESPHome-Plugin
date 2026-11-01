// Project selection dialog for NppESPHome.
// Lets the user choose, add, or remove a known project and propagates the selection to the plugin UI.
unit NppESPHome.FormSelectProject;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Npp.Plugin, Npp.Vcl.Forms;

type
  // Modal dialog that mirrors ProjectList and manages the current selection.
  TFormSelection = class(TNppPluginForm)
    GroupBoxCurrentProject: TGroupBox;
    ComboBoxProject: TComboBox;
    ButtonAddProject: TButton;
    ButtonRemoveProject: TButton;
    ButtonClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxProjectChange(Sender: TObject);
    procedure ButtonAddProjectClick(Sender: TObject);
    procedure ButtonRemoveProjectClick(Sender: TObject);
    procedure ToggleDarkMode; override;
  private
    procedure RefreshComboBox;
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
  if (Plugin.IsDarkModeEnabled) then
  begin
    DarkModeColors := Default(TNppDarkModeColors);
    Plugin.GetDarkModeColors(@DarkModeColors);
    Self.Color := TColor(DarkModeColors.Background);
    Self.Font.Color := TColor(DarkModeColors.Text);
  end
  else
  begin
    Self.Color := clBtnFace;
    Self.Font.Color := clWindowText;
  end;
end;

// *****************************************************************************
// Purpose: Makes the combo-box selection current and refreshes all
// project-dependent plugin state.
// *****************************************************************************
procedure TFormSelection.ComboBoxProjectChange(Sender: TObject);
begin
  inherited;
  if (ComboBoxProject.ItemIndex >= 0) and (ComboBoxProject.Items.Count > 0) then
    ProjectList.Current := ProjectList.GetProjectFromUIName(ComboBoxProject.Items[ComboBoxProject.ItemIndex]);
  Plugin.RefreshProjectList;
end;

// *****************************************************************************
// Purpose: Initializes the project selector from the shared project list.
// *****************************************************************************
procedure TFormSelection.FormCreate(Sender: TObject);
begin
  inherited;
  RefreshComboBox;
end;

// *****************************************************************************
// Purpose: Rebuilds the project combo box and restores the item corresponding
// to the current project.
// *****************************************************************************
procedure TFormSelection.RefreshComboBox;
var
  P: TProject;
begin
  ComboBoxProject.Clear;
  for P in ProjectList do
    if P.IsValid then
      ComboBoxProject.Items.Add(P.UIName);
  if Assigned(ProjectList.Current) then
    ComboBoxProject.ItemIndex := ComboBoxProject.Items.IndexOf(ProjectList.Current.UIName);
end;

end.
