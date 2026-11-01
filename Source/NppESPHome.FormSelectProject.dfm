object FormSelection: TFormSelection
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Project Selection'
  ClientHeight = 312
  ClientWidth = 700
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentFont = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  TextHeight = 15
  object PanelHeader: TPanel
    Left = 8
    Top = 8
    Width = 684
    Height = 78
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object VirtualImageProject: TVirtualImage
      Left = 12
      Top = 13
      Width = 48
      Height = 48
      Center = True
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = -1
      ImageName = 'project'
    end
    object LabelTitle: TLabel
      Left = 76
      Top = 11
      Width = 592
      Height = 25
      AutoSize = False
      Caption = 'Select the active project'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelDescription: TLabel
      Left = 76
      Top = 38
      Width = 592
      Height = 32
      AutoSize = False
      Caption =
        'Choose the ESPHome project used by commands, settings, and the project browser.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object BevelHeader: TBevel
      Left = 0
      Top = 76
      Width = 684
      Height = 2
      Align = alBottom
      Shape = bsBottomLine
      ExplicitTop = 75
    end
  end
  object GroupBoxCurrentProject: TGroupBox
    Left = 8
    Top = 96
    Width = 684
    Height = 154
    Caption = 'Project'
    TabOrder = 1
    object LabelCurrentProject: TLabel
      Left = 16
      Top = 23
      Width = 652
      Height = 17
      AutoSize = False
      Caption = 'Active project'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelCurrentProjectDescription: TLabel
      Left = 16
      Top = 41
      Width = 652
      Height = 15
      AutoSize = False
      Caption = 'Select one of the ESPHome projects already known to NppESPHome.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelSelectedProjectPath: TLabel
      Left = 16
      Top = 89
      Width = 652
      Height = 18
      AutoSize = False
      Caption = 'No project is currently selected.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Layout = tlCenter
    end
    object ComboBoxProject: TComboBox
      Left = 16
      Top = 62
      Width = 652
      Height = 23
      Style = csDropDownList
      DropDownCount = 12
      TabOrder = 0
      OnChange = ComboBoxProjectChange
    end
    object ButtonAddProject: TButton
      Left = 404
      Top = 112
      Width = 124
      Height = 30
      Hint =
        'Add an existing ESPHome YAML file to the list of projects known to NppESPHome'
      Caption = '&Add Project...'
      TabOrder = 1
      OnClick = ButtonAddProjectClick
    end
    object ButtonRemoveProject: TButton
      Left = 544
      Top = 112
      Width = 124
      Height = 30
      Hint =
        'Remove the active project from NppESPHome without deleting any project file from disk'
      Caption = '&Remove Project'
      TabOrder = 2
      OnClick = ButtonRemoveProjectClick
    end
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 258
    Width = 700
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      700
      54)
    object ButtonClose: TButton
      Left = 572
      Top = 10
      Width = 112
      Height = 30
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 0
    end
  end
end
