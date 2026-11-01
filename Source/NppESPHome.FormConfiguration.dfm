object FormConfig: TFormConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Project Configuration'
  ClientHeight = 611
  ClientWidth = 908
  Color = clBtnFace
  ParentFont = True
  ShowHint = True
  OnCreate = FormCreate
  TextHeight = 15
  object GroupBoxProject: TGroupBox
    Left = 11
    Top = 8
    Width = 889
    Height = 82
    TabOrder = 0
    object VirtualImageMC: TVirtualImage
      Left = 14
      Top = 5
      Width = 71
      Height = 72
      Center = True
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = -1
    end
    object LabelProjectSummaryName: TLabel
      Left = 93
      Top = 5
      Width = 638
      Height = 32
      AutoSize = False
      Caption = 'Project name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelProjectSummaryFile: TLabel
      Left = 93
      Top = 27
      Width = 638
      Height = 15
      AutoSize = False
      Caption = 'project.yaml'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object PanelProjectBadges: TPanel
      Left = 91
      Top = 42
      Width = 640
      Height = 34
      BevelOuter = bvNone
      TabOrder = 0
      object PanelProjectMicrocontroller: TPanel
        AlignWithMargins = True
        Left = 2
        Top = 5
        Width = 56
        Height = 24
        Margins.Left = 2
        Margins.Top = 5
        Margins.Right = 2
        Margins.Bottom = 5
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'ESP32'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = -19
        ExplicitTop = 8
      end
      object PanelProjectBoard: TPanel
        AlignWithMargins = True
        Left = 62
        Top = 5
        Width = 95
        Height = 24
        Margins.Left = 2
        Margins.Top = 5
        Margins.Right = 2
        Margins.Bottom = 5
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Board'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 0
      end
      object PanelProjectFramework: TPanel
        AlignWithMargins = True
        Left = 161
        Top = 5
        Width = 65
        Height = 24
        Margins.Left = 2
        Margins.Top = 5
        Margins.Right = 2
        Margins.Bottom = 5
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Framework'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object PanelProjectWiFi: TPanel
        AlignWithMargins = True
        Left = 230
        Top = 5
        Width = 46
        Height = 24
        Margins.Left = 2
        Margins.Top = 5
        Margins.Right = 2
        Margins.Bottom = 5
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Wi-Fi'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object PanelProjectWebServer: TPanel
        AlignWithMargins = True
        Left = 280
        Top = 5
        Width = 78
        Height = 24
        Margins.Left = 2
        Margins.Top = 5
        Margins.Right = 2
        Margins.Bottom = 5
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Web server'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
    end
    object LinkLabelProjectFile: TLinkLabel
      Left = 754
      Top = 18
      Width = 104
      Height = 19
      Caption = '<a>Open project file '#8599'</a>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnLinkClick = LinkLabelProjectFileLinkClick
    end
    object LinkLabelProjectFolder: TLinkLabel
      Left = 754
      Top = 40
      Width = 119
      Height = 19
      Caption = '<a>Open project folder '#8599'</a>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnLinkClick = LinkLabelProjectFolderLinkClick
    end
  end
  object GroupBoxOptions: TGroupBox
    Left = 8
    Top = 112
    Width = 889
    Height = 434
    Caption = 'Options'
    TabOrder = 1
    object BevelVerticalSeparator: TBevel
      Left = 210
      Top = 27
      Width = 2
      Height = 390
    end
    object CardPanelOptions: TCardPanel
      Left = 223
      Top = 23
      Width = 655
      Height = 394
      ActiveCard = CardProjectOptions
      BevelOuter = bvNone
      Caption = 'CardPanelOptions'
      ParentColor = True
      TabOrder = 0
      object CardProjectOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardProjectOptions'
        CardIndex = 0
        ParentColor = True
        TabOrder = 2
        object LabelProjectTitle: TLabel
          Left = 8
          Top = 5
          Width = 49
          Height = 20
          Caption = 'Project'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelProjectDescription: TLabel
          Left = 8
          Top = 33
          Width = 343
          Height = 15
          AutoSize = False
          Caption = 'Manage files associated with the current ESPHome project.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object GroupBoxProjectDependencies: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 278
          Caption = 'Project dependencies'
          TabOrder = 0
          object LabelDependencies: TLabel
            Left = 12
            Top = 22
            Width = 613
            Height = 18
            AutoSize = False
            Caption = 
              'These files open with the project and can be saved automatically' +
              ' before an ESPHome command runs.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object ListBoxDependencies: TListBox
            Left = 12
            Top = 46
            Width = 613
            Height = 185
            Hint = 
              'Project files to be automatically opened and saved by Notepad++ ' +
              'during development'
            BevelInner = bvNone
            BevelOuter = bvNone
            ItemHeight = 15
            MultiSelect = True
            ParentColor = True
            TabOrder = 0
          end
          object ButtonAddDeps: TButton
            Left = 437
            Top = 241
            Width = 90
            Height = 27
            Hint = 
              'Add a new existing file(s) among the current project dependencie' +
              's'
            Caption = 'Add files...'
            TabOrder = 1
            OnClick = ButtonAddDepsClick
          end
          object ButtonRemoveDeps: TButton
            Left = 535
            Top = 241
            Width = 90
            Height = 27
            Hint = 
              'Remove the selected file(s) among the current project dependenci' +
              'es'
            Caption = 'Remove'
            TabOrder = 2
            OnClick = ButtonRemoveDepsClick
          end
          object ButtonAutoAdd: TButton
            Left = 339
            Top = 241
            Width = 90
            Height = 27
            Hint = 
              'Automatically scan references to external files from the main fi' +
              'le project and adds them to the dependency list'
            Caption = 'Auto'
            TabOrder = 3
            OnClick = ButtonAutoAddClick
          end
          object ButtonClearDeps: TButton
            Left = 241
            Top = 241
            Width = 90
            Height = 27
            Hint =
              'Remove all dependency associations from the current project wit' +
              'hout deleting any file from disk'
            Caption = 'Clear all'
            TabOrder = 4
            OnClick = ButtonClearDepsClick
          end
        end
      end
      object CardESPHomeOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardESPHomeOptions'
        CardIndex = 1
        ParentColor = True
        TabOrder = 4
        DesignSize = (
          655
          394)
        object LabelESPHomeTitle: TLabel
          Left = 8
          Top = 5
          Width = 67
          Height = 20
          Caption = 'ESPHome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelESPHomeDescription: TLabel
          Left = 8
          Top = 33
          Width = 331
          Height = 15
          AutoSize = False
          Caption = 'General options shared by ESPHome commands.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LinkLabelESPHome: TLinkLabel
          Left = 518
          Top = 6
          Width = 114
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 
            '<a href="https://esphome.io/guides/cli/#base-usage">ESPHome CLI ' +
            'help '#8599'</a>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnLinkClick = LinkLabelHelpLinkClick
        end
        object GroupBoxESPHomeTargetLogging: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 118
          Caption = 'Target and logging'
          TabOrder = 1
          object LabelDevice: TLabel
            Left = 12
            Top = 22
            Width = 360
            Height = 27
            AutoSize = False
            Caption = 'Target device'
            FocusControl = ComboBoxDevice
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelDeviceDesc: TLabel
            Left = 12
            Top = 42
            Width = 360
            Height = 15
            AutoSize = False
            Caption = 'Used by Run, Upload and Logs (--device).'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelESPHomeOptionsRow1: TBevel
            Left = 8
            Top = 67
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelLogLevel: TLabel
            Left = 12
            Top = 74
            Width = 360
            Height = 23
            Hint = 
              'Log level reported into the console window during the ESPHome co' +
              'mmand execution.'
            AutoSize = False
            Caption = 'Console log level'
            FocusControl = ComboBoxLogLevel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelLogLevelDescription: TLabel
            Left = 12
            Top = 94
            Width = 360
            Height = 15
            AutoSize = False
            Caption = 'Controls the ESPHome output shown in the console.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object SpeedButtonRefresh: TSpeedButton
            Left = 591
            Top = 27
            Width = 30
            Height = 29
            Hint = 'Refresh the current list of available USB ports'
            ImageName = 'refreshusb'
            Images = VirtualImageList
            Flat = True
            OnClick = SpeedButtonRefreshClick
          end
          object ComboBoxDevice: TJvImageComboBox
            Left = 414
            Top = 27
            Width = 170
            Height = 30
            Hint = 
              'Specify the serial port or host address to be used to upload fir' +
              'mware or retrieve logs by RUN, UPLOAD or LOGS ESPHome commands (' +
              '--device). '
            Style = csOwnerDrawVariable
            ButtonStyle = fsLighter
            DroppedWidth = 200
            ImageHeight = 0
            ImageWidth = 0
            Images = VirtualImageList
            ItemHeight = 24
            ItemIndex = -1
            ParentColor = True
            TabOrder = 0
            OnChange = ComboBoxDeviceChange
            Items = <>
          end
          object ComboBoxLogLevel: TJvImageComboBox
            Left = 414
            Top = 80
            Width = 171
            Height = 25
            Hint = 
              'Log level reported into the console window during the ESPHome co' +
              'mmand execution.'
            Style = csOwnerDrawVariable
            ButtonStyle = fsDark
            DroppedWidth = 207
            ImageHeight = 0
            ImageWidth = 0
            IndentSelected = True
            ItemHeight = 19
            ItemIndex = -1
            ParentColor = True
            TabOrder = 1
            OnChange = ComboBoxLogLevelChange
            Items = <
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Critical'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Error'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Warning'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Info'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Debug'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Default'
              end>
          end
        end
        object GroupBoxESPHomeAdditionalArguments: TGroupBox
          Left = 8
          Top = 199
          Width = 637
          Height = 82
          Caption = 'Additional command-line arguments'
          TabOrder = 2
          object LabelOptionESPHomeAdditionalParameters: TLabel
            Left = 12
            Top = 56
            Width = 613
            Height = 15
            AutoSize = False
            Caption = 'These arguments are appended to ESPHome command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditOptionESPHomeAdditionalParameters: TJvEdit
            Left = 12
            Top = 24
            Width = 613
            Height = 21
            Flat = True
            ParentFlat = False
            ParentColor = True
            TabOrder = 0
            Text = ''
            OnChange = EditOptionESPHomeAdditionalParametersChange
          end
        end
      end
      object CardRunOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardRunOptions'
        CardIndex = 2
        ParentColor = True
        TabOrder = 5
        DesignSize = (
          655
          394)
        object LabelRunTitle: TLabel
          Left = 8
          Top = 5
          Width = 102
          Height = 20
          Caption = 'Run command'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelRunDescription: TLabel
          Left = 8
          Top = 33
          Width = 311
          Height = 15
          AutoSize = False
          Caption = 'Options used when running this ESPHome project.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LinkLabelRunHelp: TLinkLabel
          Left = 518
          Top = 6
          Width = 114
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 
            '<a href="https://esphome.io/guides/cli/#run-command">ESPHome CLI' +
            ' help '#8599'</a>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnLinkClick = LinkLabelHelpLinkClick
        end
        object GroupBoxRunOutputDevice: TGroupBox
          Left = 8
          Top = 67
          Width = 637
          Height = 168
          Caption = 'Output and device'
          TabOrder = 1
          object LabelOptionRunNoLogs: TLabel
            Left = 12
            Top = 22
            Width = 520
            Height = 27
            AutoSize = False
            Caption = 'Disable live logs after upload'
            FocusControl = CheckBoxOptionRunNoLogs
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelRunNoLogsDescription: TLabel
            Left = 12
            Top = 42
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Adds --no-logs to the Run command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelRunOutputRow1: TBevel
            Left = 8
            Top = 67
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelOptionRunNoStates: TLabel
            Left = 12
            Top = 74
            Width = 520
            Height = 23
            AutoSize = False
            Caption = 'Hide entity state changes'
            FocusControl = CheckBoxOptionRunNoStates
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelRunNoStatesDescription: TLabel
            Left = 12
            Top = 93
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Adds --no-states to the Run command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelRunOutputRow2: TBevel
            Left = 8
            Top = 117
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelOptionRunReset: TLabel
            Left = 12
            Top = 124
            Width = 520
            Height = 21
            AutoSize = False
            Caption = 'Reset device before opening logs'
            FocusControl = CheckBoxOptionRunReset
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelRunResetDescription: TLabel
            Left = 12
            Top = 143
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Adds --reset to the Run command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object CheckBoxOptionRunNoLogs: TCheckBox
            Left = 604
            Top = 29
            Width = 17
            Height = 17
            TabOrder = 0
            OnClick = CheckBoxOptionRunNoLogsClick
          end
          object CheckBoxOptionRunNoStates: TCheckBox
            Left = 604
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 1
            OnClick = CheckBoxOptionRunNoStatesClick
          end
          object CheckBoxOptionRunReset: TCheckBox
            Left = 604
            Top = 130
            Width = 17
            Height = 17
            TabOrder = 2
            OnClick = CheckBoxOptionRunResetClick
          end
        end
        object GroupBoxRunAdditionalArguments: TGroupBox
          Left = 8
          Top = 249
          Width = 637
          Height = 80
          Caption = 'Additional command-line arguments'
          TabOrder = 2
          object LabelOptionRunAdditionalParameters: TLabel
            Left = 12
            Top = 56
            Width = 613
            Height = 15
            AutoSize = False
            Caption = 'These arguments are appended only to the Run command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditOptionRunAdditionalParameters: TJvEdit
            Left = 12
            Top = 24
            Width = 613
            Height = 21
            Flat = True
            ParentFlat = False
            AutoSize = False
            ParentColor = True
            TabOrder = 0
            Text = ''
            OnChange = EditOptionRunAdditionalParametersChange
          end
        end
      end
      object CardCompileOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardCompileOptions'
        CardIndex = 3
        ParentColor = True
        TabOrder = 6
        DesignSize = (
          655
          394)
        object LabelCompileTitle: TLabel
          Left = 8
          Top = 5
          Width = 131
          Height = 20
          Caption = 'Compile command'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCompileDescription: TLabel
          Left = 8
          Top = 33
          Width = 335
          Height = 15
          AutoSize = False
          Caption = 'Options used when compiling this ESPHome project.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LinkLabelCompileHelp: TLinkLabel
          Left = 518
          Top = 6
          Width = 114
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 
            '<a href="https://esphome.io/guides/cli/#compile-command">ESPHome' +
            ' CLI help '#8599'</a>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnLinkClick = LinkLabelHelpLinkClick
        end
        object GroupBoxCompileBuildOptions: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 72
          Caption = 'Build options'
          TabOrder = 1
          object LabelOptionCompileGenerateOnly: TLabel
            Left = 12
            Top = 22
            Width = 520
            Height = 27
            AutoSize = False
            Caption = 'Generate source files only'
            FocusControl = CheckBoxOptionCompileGenerateOnly
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelCompileGenerateOnlyDescription: TLabel
            Left = 12
            Top = 42
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Adds --only-generate and skips firmware compilation.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object CheckBoxOptionCompileGenerateOnly: TCheckBox
            Left = 604
            Top = 29
            Width = 17
            Height = 17
            TabOrder = 0
            OnClick = CheckBoxOptionCompileGenerateOnlyClick
          end
        end
        object GroupBoxCompileAdditionalArguments: TGroupBox
          Left = 8
          Top = 153
          Width = 637
          Height = 80
          Caption = 'Additional command-line arguments'
          TabOrder = 2
          object LabelOptionCompileAdditionalParameters: TLabel
            Left = 12
            Top = 56
            Width = 613
            Height = 15
            AutoSize = False
            Caption = 'These arguments are appended only to the Compile command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditOptionCompileAdditionalParameters: TJvEdit
            Left = 12
            Top = 24
            Width = 613
            Height = 21
            Flat = True
            ParentFlat = False
            AutoSize = False
            ParentColor = True
            TabOrder = 0
            Text = ''
            OnChange = EditOptionCompileAdditionalParametersChange
          end
        end
      end
      object CardUploadOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardUploadOptions'
        CardIndex = 4
        ParentColor = True
        TabOrder = 7
        DesignSize = (
          655
          394)
        object LabelUploadTitle: TLabel
          Left = 8
          Top = 5
          Width = 124
          Height = 20
          Caption = 'Upload command'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelUploadDescription: TLabel
          Left = 8
          Top = 33
          Width = 383
          Height = 15
          AutoSize = False
          Caption = 'Options used when uploading firmware to this ESPHome device.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LinkLabelUploadOptions: TLinkLabel
          Left = 518
          Top = 6
          Width = 114
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 
            '<a href="https://esphome.io/guides/cli/#upload-command">ESPHome ' +
            'CLI help '#8599'</a>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnLinkClick = LinkLabelHelpLinkClick
        end
        object GroupBoxUploadAdditionalArguments: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 81
          Caption = 'Additional command-line arguments'
          TabOrder = 1
          object LabelOptionUploadAdditionalParameters: TLabel
            Left = 12
            Top = 56
            Width = 613
            Height = 15
            AutoSize = False
            Caption = 'These arguments are appended only to the Upload command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditOptionUploadAdditionalParameters: TJvEdit
            Left = 12
            Top = 24
            Width = 613
            Height = 21
            Flat = True
            ParentFlat = False
            AutoSize = False
            ParentColor = True
            TabOrder = 0
            Text = ''
            OnChange = EditOptionUploadAdditionalParametersChange
          end
        end
      end
      object CardLogsOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardLogsOptions'
        CardIndex = 5
        ParentColor = True
        TabOrder = 3
        DesignSize = (
          655
          394)
        object LabelLogsTitle: TLabel
          Left = 8
          Top = 5
          Width = 107
          Height = 20
          Caption = 'Logs command'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelLogsDescription: TLabel
          Left = 8
          Top = 33
          Width = 354
          Height = 15
          AutoSize = False
          Caption = 'Options used when viewing logs from this ESPHome device.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LinkLabelLogsOptions: TLinkLabel
          Left = 518
          Top = 6
          Width = 114
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 
            '<a href="https://esphome.io/guides/cli/#logs-command">ESPHome CL' +
            'I help '#8599'</a>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnLinkClick = LinkLabelHelpLinkClick
        end
        object GroupBoxLogsOutputDevice: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 118
          Caption = 'Output and device'
          TabOrder = 1
          object LabelOptionLogsReset: TLabel
            Left = 12
            Top = 22
            Width = 520
            Height = 27
            AutoSize = False
            Caption = 'Reset device before opening logs'
            FocusControl = CheckBoxOptionLogsReset
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelLogsResetDescription: TLabel
            Left = 12
            Top = 42
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Adds --reset to the Logs command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelLogsOutputRow1: TBevel
            Left = 8
            Top = 67
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelOptionLogsNoStates: TLabel
            Left = 12
            Top = 74
            Width = 520
            Height = 31
            AutoSize = False
            Caption = 'Hide entity state changes'
            FocusControl = CheckBoxOptionLogsNoStates
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelLogsNoStatesDescription: TLabel
            Left = 12
            Top = 93
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Adds --no-states to the Logs command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object CheckBoxOptionLogsReset: TCheckBox
            Left = 604
            Top = 29
            Width = 17
            Height = 17
            TabOrder = 0
            OnClick = CheckBoxOptionLogsResetClick
          end
          object CheckBoxOptionLogsNoStates: TCheckBox
            Left = 604
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 1
            OnClick = CheckBoxOptionLogsNoStatesClick
          end
        end
        object GroupBoxLogsAdditionalArguments: TGroupBox
          Left = 8
          Top = 199
          Width = 637
          Height = 82
          Caption = 'Additional command-line arguments'
          TabOrder = 2
          object LabelOptionLogsAdditionalParameters: TLabel
            Left = 12
            Top = 56
            Width = 613
            Height = 15
            AutoSize = False
            Caption = 'These arguments are appended only to the Logs command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditOptionLogsAdditionalParameters: TJvEdit
            Left = 12
            Top = 24
            Width = 613
            Height = 21
            Flat = True
            ParentFlat = False
            AutoSize = False
            ParentColor = True
            TabOrder = 0
            Text = ''
            OnChange = EditOptionLogsAdditionalParametersChange
          end
        end
      end
      object CardCleanOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardCleanOptions'
        CardIndex = 6
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          655
          394)
        object LabelCleanTitle: TLabel
          Left = 8
          Top = 5
          Width = 112
          Height = 20
          Caption = 'Clean command'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelCleanDescription: TLabel
          Left = 8
          Top = 33
          Width = 383
          Height = 15
          AutoSize = False
          Caption = 'Options used when cleaning this ESPHome project'#39's build files.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LinkLabelHelpOptions: TLinkLabel
          Left = 518
          Top = 6
          Width = 114
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 
            '<a href="https://esphome.io/guides/cli/#clean-command">ESPHome C' +
            'LI help '#8599'</a>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnLinkClick = LinkLabelHelpLinkClick
        end
        object GroupBoxCleanAdditionalArguments: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 81
          Caption = 'Additional command-line arguments'
          TabOrder = 1
          object LabelOptionCleanAdditionalParameters: TLabel
            Left = 12
            Top = 56
            Width = 613
            Height = 15
            AutoSize = False
            Caption = 'These arguments are appended only to the Clean command.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditOptionCleanAdditionalParameters: TJvEdit
            Left = 12
            Top = 24
            Width = 613
            Height = 21
            Flat = True
            ParentFlat = False
            AutoSize = False
            ParentColor = True
            TabOrder = 0
            Text = ''
            OnChange = EditOptionCleanAdditionalParametersChange
          end
        end
      end
      object CardNppOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardNppOptions'
        CardIndex = 7
        ParentColor = True
        TabOrder = 1
        object LabelNppTitle: TLabel
          Left = 8
          Top = 5
          Width = 83
          Height = 20
          Caption = 'Notepad++'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelNppDescription: TLabel
          Left = 8
          Top = 33
          Width = 411
          Height = 15
          AutoSize = False
          Caption = 'Options controlling how project files are handled by Notepad++.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object GroupBoxNppFileSaving: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 72
          Caption = 'File saving'
          TabOrder = 0
          object LabelAutosave: TLabel
            Left = 12
            Top = 22
            Width = 300
            Height = 35
            Hint = 
              'Select the way in which the project file(s) are auto saved befor' +
              'e ESPHome commands are started'
            AutoSize = False
            Caption = 'Autosave before running commands'
            FocusControl = ComboBoxOptionAutosave
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelAutosaveDescription: TLabel
            Left = 12
            Top = 42
            Width = 300
            Height = 15
            AutoSize = False
            Caption = 'Select which files Notepad++ saves automatically.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object ComboBoxOptionAutosave: TJvImageComboBox
            Left = 330
            Top = 27
            Width = 291
            Height = 25
            Hint = 
              'Select the way in which the project file(s) are auto saved befor' +
              'e ESPHome commands are started'
            Style = csOwnerDrawVariable
            ButtonStyle = fsLighter
            DroppedWidth = 350
            ImageHeight = 0
            ImageWidth = 0
            ItemHeight = 19
            ItemIndex = -1
            ParentColor = True
            TabOrder = 0
            OnChange = ComboBoxOptionAutosaveChange
            Items = <
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'None'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Current Project File Only'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Current Project File & Dependencies'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'All Opened Files (can save unwanted files)'
              end>
          end
        end
      end
      object CardIntConsoleOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardIntConsoleOptions'
        CardIndex = 8
        ParentColor = True
        TabOrder = 9
        object LabelInternalConsoleTitle: TLabel
          Left = 8
          Top = 5
          Width = 112
          Height = 20
          Caption = 'Internal console'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelInternalConsoleDescription: TLabel
          Left = 8
          Top = 33
          Width = 408
          Height = 15
          AutoSize = False
          Caption = 'Appearance and behavior of the integrated ESPHome console.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object GroupBoxInternalConsoleAppearance: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 92
          Caption = 'Appearance'
          TabOrder = 0
          object LabelIntConsoleForeground: TLabel
            Left = 12
            Top = 22
            Width = 135
            Height = 15
            AutoSize = False
            Caption = 'Text color'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelIntConsoleBackground: TLabel
            Left = 157
            Top = 22
            Width = 145
            Height = 15
            AutoSize = False
            Caption = 'Background color'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelIntConsoleFont: TLabel
            Left = 312
            Top = 22
            Width = 200
            Height = 15
            AutoSize = False
            Caption = 'Terminal font'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelIntConsoleFontSize: TLabel
            Left = 522
            Top = 22
            Width = 99
            Height = 15
            AutoSize = False
            Caption = 'Size'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object PanelIntConsoleForegroundColor: TPanel
            Left = 12
            Top = 42
            Width = 135
            Height = 26
            Cursor = crHandPoint
            Hint = 'Choose the default console text color.'
            BevelOuter = bvLowered
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            OnClick = IntConsoleColorClick
          end
          object PanelIntConsoleBackgroundColor: TPanel
            Left = 157
            Top = 42
            Width = 145
            Height = 26
            Cursor = crHandPoint
            Hint = 'Choose the default console background color.'
            BevelOuter = bvLowered
            Color = clBlack
            ParentBackground = False
            TabOrder = 1
            OnClick = IntConsoleColorClick
          end
          object ComboBoxIntConsoleFont: TJvImageComboBox
            Left = 312
            Top = 42
            Width = 200
            Height = 25
            Style = csOwnerDrawVariable
            ButtonStyle = fsLighter
            DroppedWidth = 250
            DropDownCount = 16
            ImageHeight = 0
            ImageWidth = 0
            ItemHeight = 19
            ItemIndex = -1
            ParentColor = True
            TabOrder = 2
            OnChange = ComboBoxIntConsoleFontChange
            Items = <>
          end
          object EditIntConsoleFontSize: TEdit
            Left = 522
            Top = 42
            Width = 83
            Height = 23
            NumbersOnly = True
            ParentColor = True
            TabOrder = 3
            Text = '10'
            OnChange = EditIntConsoleFontSizeChange
          end
          object UpDownIntConsoleFontSize: TUpDown
            Left = 605
            Top = 42
            Width = 16
            Height = 23
            Associate = EditIntConsoleFontSize
            Min = 6
            Max = 32
            Position = 10
            TabOrder = 4
          end
        end
        object GroupBoxInternalConsoleBehavior: TGroupBox
          Left = 8
          Top = 173
          Width = 637
          Height = 118
          Caption = 'Buffer and behavior'
          TabOrder = 1
          object LabelIntConsoleScrollback: TLabel
            Left = 12
            Top = 22
            Width = 470
            Height = 27
            AutoSize = False
            Caption = 'Scrollback buffer'
            FocusControl = EditIntConsoleScrollback
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelIntConsoleScrollbackDescription: TLabel
            Left = 12
            Top = 42
            Width = 470
            Height = 15
            AutoSize = False
            Caption = 'Maximum number of output lines retained in the console.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelInternalConsoleBehaviorRow1: TBevel
            Left = 8
            Top = 67
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelIntConsoleClearOnStart: TLabel
            Left = 12
            Top = 74
            Width = 520
            Height = 23
            AutoSize = False
            Caption = 'Clear output before each command'
            FocusControl = CheckBoxIntConsoleClearOnStart
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelIntConsoleClearOnStartDescription: TLabel
            Left = 12
            Top = 93
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Start every integrated command with an empty console.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EditIntConsoleScrollback: TEdit
            Left = 510
            Top = 28
            Width = 95
            Height = 23
            NumbersOnly = True
            ParentColor = True
            TabOrder = 0
            Text = '5000'
            OnChange = EditIntConsoleScrollbackChange
          end
          object UpDownIntConsoleScrollback: TUpDown
            Left = 605
            Top = 28
            Width = 16
            Height = 23
            Associate = EditIntConsoleScrollback
            Min = 500
            Max = 20000
            Increment = 500
            Position = 5000
            TabOrder = 1
            Thousands = False
          end
          object CheckBoxIntConsoleClearOnStart: TCheckBox
            Left = 604
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 2
            OnClick = CheckBoxIntConsoleClearOnStartClick
          end
        end
        object ButtonIntConsoleDefaults: TButton
          Left = 515
          Top = 308
          Width = 130
          Height = 27
          Caption = 'Restore defaults'
          TabOrder = 2
          OnClick = ButtonIntConsoleDefaultsClick
        end
      end
      object CardConsoleOptions: TCard
        Left = 0
        Top = 0
        Width = 655
        Height = 394
        Caption = 'CardConsoleOptions'
        CardIndex = 9
        ParentColor = True
        TabOrder = 8
        object LabelExternalConsoleTitle: TLabel
          Left = 8
          Top = 5
          Width = 114
          Height = 20
          Caption = 'External console'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelExternalConsoleDescription: TLabel
          Left = 8
          Top = 33
          Width = 399
          Height = 15
          AutoSize = False
          Caption = 'Behavior and placement of ESPHome command windows.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object GroupBoxExternalConsoleBehavior: TGroupBox
          Left = 8
          Top = 64
          Width = 637
          Height = 168
          Caption = 'Console behavior'
          TabOrder = 0
          object LabelOptionConsoleAutoclose: TLabel
            Left = 12
            Top = 22
            Width = 330
            Height = 27
            AutoSize = False
            Caption = 'After a successful command'
            FocusControl = ComboBoxOptionConsoleAutoclose
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelConsoleAutocloseDescription: TLabel
            Left = 12
            Top = 42
            Width = 330
            Height = 15
            AutoSize = False
            Caption = 'Choose whether the console remains open.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelExternalConsoleBehaviorRow1: TBevel
            Left = 8
            Top = 67
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelOptionConsoleAlwaysOnTop: TLabel
            Left = 12
            Top = 74
            Width = 520
            Height = 31
            AutoSize = False
            Caption = 'Keep console always on top'
            FocusControl = CheckBoxOptionAlwaysOnTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelConsoleAlwaysOnTopDescription: TLabel
            Left = 12
            Top = 93
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Keep the command window above other applications.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelExternalConsoleBehaviorRow2: TBevel
            Left = 8
            Top = 117
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelOptionConsoleSoloMode: TLabel
            Left = 12
            Top = 124
            Width = 520
            Height = 29
            AutoSize = False
            Caption = 'Allow only one console window'
            FocusControl = CheckBoxOptionSoloMode
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelConsoleSoloModeDescription: TLabel
            Left = 12
            Top = 143
            Width = 520
            Height = 15
            AutoSize = False
            Caption = 'Reuse the console instead of opening another window.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object ComboBoxOptionConsoleAutoclose: TJvImageComboBox
            Left = 360
            Top = 27
            Width = 261
            Height = 25
            Style = csOwnerDrawVariable
            ButtonStyle = fsLighter
            DroppedWidth = 320
            ImageHeight = 0
            ImageWidth = 0
            ItemHeight = 19
            ItemIndex = -1
            ParentColor = True
            TabOrder = 0
            OnChange = ComboBoxOptionConsoleAutocloseChange
            Items = <
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Leave the console open'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Close the console automatically'
              end>
          end
          object CheckBoxOptionAlwaysOnTop: TCheckBox
            Left = 604
            Top = 80
            Width = 17
            Height = 17
            TabOrder = 1
            OnClick = CheckBoxOptionAlwaysOnTopClick
          end
          object CheckBoxOptionSoloMode: TCheckBox
            Left = 604
            Top = 130
            Width = 17
            Height = 17
            TabOrder = 2
            OnClick = CheckBoxOptionSoloModeClick
          end
        end
        object GroupBoxExternalConsolePlacement: TGroupBox
          Left = 8
          Top = 249
          Width = 637
          Height = 118
          Caption = 'Window placement'
          TabOrder = 1
          object LabelOptionConsoleMonitor: TLabel
            Left = 12
            Top = 22
            Width = 330
            Height = 39
            AutoSize = False
            Caption = 'Monitor'
            FocusControl = ComboBoxOptionConsoleMonitor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelConsoleMonitorDescription: TLabel
            Left = 12
            Top = 42
            Width = 330
            Height = 15
            AutoSize = False
            Caption = 'Display where the console window opens.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object BevelExternalConsolePlacementRow1: TBevel
            Left = 8
            Top = 67
            Width = 621
            Height = 2
            Shape = bsTopLine
          end
          object LabelOptionConsolePosition: TLabel
            Left = 12
            Top = 74
            Width = 330
            Height = 23
            AutoSize = False
            Caption = 'Starting position'
            FocusControl = ComboBoxOptionConsolePosition
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelConsolePositionDescription: TLabel
            Left = 12
            Top = 93
            Width = 330
            Height = 15
            AutoSize = False
            Caption = 'Initial position of the console on the selected display.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object ComboBoxOptionConsoleMonitor: TJvImageComboBox
            Left = 360
            Top = 27
            Width = 261
            Height = 25
            Style = csOwnerDrawVariable
            ButtonStyle = fsLighter
            DroppedWidth = 320
            ImageHeight = 0
            ImageWidth = 0
            ItemHeight = 19
            ItemIndex = -1
            ParentColor = True
            TabOrder = 0
            OnChange = ComboBoxOptionConsoleMonitorChange
            Items = <>
          end
          object ComboBoxOptionConsolePosition: TJvImageComboBox
            Left = 360
            Top = 76
            Width = 261
            Height = 25
            Style = csOwnerDrawVariable
            ButtonStyle = fsLighter
            DroppedWidth = 320
            ImageHeight = 0
            ImageWidth = 0
            ItemHeight = 19
            ItemIndex = -1
            ParentColor = True
            TabOrder = 1
            OnChange = ComboBoxOptionConsolePositionChange
            Items = <
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Let Windows decide'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Centered on the screen'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Top-left corner of the screen'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Bottom-left corner of the screen'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Top-right corner of the screen'
              end
              item
                Brush.Style = bsClear
                Indent = 0
                Text = 'Bottom-right corner of the screen'
              end>
          end
        end
      end
    end
    object CategoryButtons: TCategoryButtons
      Left = 3
      Top = 15
      Width = 206
      Height = 416
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 40
      ButtonWidth = 60
      ButtonOptions = [boFullSize, boShowCaptions]
      Categories = <
        item
          Caption = 'PROJECT'
          Color = clNone
          Collapsed = False
          CanCollapse = False
          Items = <
            item
              Caption = 'Project'
              ImageName = 'project'
            end
            item
              Caption = 'ESPHome'
              ImageName = 'esphome'
            end
            item
              Caption = 'Run'
              ImageName = 'run'
            end
            item
              Caption = 'Compile'
              ImageName = 'compile'
            end
            item
              Caption = 'Upload'
              ImageName = 'upload'
            end
            item
              Caption = 'Logs'
              ImageName = 'logs'
            end
            item
              Caption = 'Clean'
              ImageName = 'clean'
            end
            item
              Caption = 'Notepad++'
              ImageName = 'npp'
            end
            item
              Caption = 'Internal Console'
              ImageName = 'console2'
            end
            item
              Caption = 'External Console'
              ImageName = 'console'
            end>
          VisibleGutter = False
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      HotButtonColor = clSilver
      Images = VirtualImageList
      RegularButtonColor = clWhite
      SelectedButtonColor = 15132390
      ShowHint = False
      TabOrder = 1
      StyleElements = [seFont, seClient]
      OnSelectedItemChange = CategoryButtonsSelectedItemChange
    end
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 560
    Width = 908
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 552
    ExplicitWidth = 906
    DesignSize = (
      908
      51)
    object ButtonClose: TButton
      Left = 789
      Top = 7
      Width = 101
      Height = 29
      Hint = 'Closes current window'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 787
    end
  end
  object VirtualImageList: TVirtualImageList
    AutoFill = True
    Images = <>
    Width = 24
    Height = 24
    Left = 656
    Top = 24
  end
  object FileOpenDialogDependency: TFileOpenDialog
    DefaultExtension = '*.yaml'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'ESPHome Files (yaml)'
        FileMask = '*.yaml'
      end
      item
        DisplayName = 'ESPHome File (yml)'
        FileMask = '*.yml'
      end
      item
        DisplayName = 'Partitions files (csv)'
        FileMask = '*.csv'
      end
      item
        DisplayName = 'C++ Header file'
        FileMask = '*.h'
      end
      item
        DisplayName = 'C++ Source File'
        FileMask = '*.cpp'
      end
      item
        DisplayName = 'Include Files'
        FileMask = '*.inc'
      end
      item
        DisplayName = 'Text Files'
        FileMask = '*.txt'
      end
      item
        DisplayName = 'Any file'
        FileMask = '*.*'
      end>
    Options = [fdoForceFileSystem, fdoAllowMultiSelect, fdoFileMustExist, fdoNoDereferenceLinks, fdoForceShowHidden]
    Left = 600
    Top = 23
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen, cdAnyColor]
    Left = 707
    Top = 24
  end
end
