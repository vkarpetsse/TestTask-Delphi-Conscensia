object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'TestTask-Delphi-Conscensia'
  ClientHeight = 635
  ClientWidth = 1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 353
    Top = 52
    Height = 564
    ExplicitLeft = 520
    ExplicitTop = 240
    ExplicitHeight = 100
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 616
    Width = 1077
    Height = 19
    Panels = <>
    ExplicitTop = 558
    ExplicitWidth = 1073
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1077
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 1073
    object BitBtn1: TBitBtn
      Left = 8
      Top = 14
      Width = 75
      Height = 32
      Action = acConnect
      Caption = 'Connect'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 89
      Top = 14
      Width = 75
      Height = 32
      Action = acDisconnect
      Caption = 'Disconnect'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 170
      Top = 14
      Width = 75
      Height = 32
      Action = acShowSettings
      Caption = 'Settings'
      TabOrder = 2
    end
  end
  object pnlGroups: TPanel
    Left = 0
    Top = 52
    Width = 353
    Height = 564
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pnlGroups'
    TabOrder = 2
    ExplicitHeight = 506
    object grdGroups: TDBGrid
      Left = 0
      Top = 73
      Width = 353
      Height = 491
      Align = alClient
      DataSource = DM.dsGroups
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'GroupId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GroupName'
          Width = 227
          Visible = True
        end>
    end
    object pnlNabGroups: TPanel
      Left = 0
      Top = 41
      Width = 353
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object navGroups: TDBNavigator
        Left = 8
        Top = 4
        Width = 240
        Height = 25
        DataSource = DM.dsGroups
        TabOrder = 0
        OnClick = navGroupsClick
      end
    end
    object pnlGroupsHeader: TPanel
      Left = 0
      Top = 0
      Width = 353
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 68
        Height = 25
        Caption = 'Groups'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
    end
  end
  object pnlStudents: TPanel
    Left = 356
    Top = 52
    Width = 721
    Height = 564
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 717
    ExplicitHeight = 506
    object grdStudents: TDBGrid
      Left = 0
      Top = 73
      Width = 721
      Height = 230
      Align = alClient
      DataSource = DM.dsStudents
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'StudentId'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GroupId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FirstName'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LastName'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BirthDate'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Email'
          Width = 185
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Mobile'
          Width = 103
          Visible = True
        end>
    end
    object pnlNavStudents: TPanel
      Left = 0
      Top = 41
      Width = 721
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object navStudents: TDBNavigator
        Left = 6
        Top = 4
        Width = 240
        Height = 25
        DataSource = DM.dsStudents
        TabOrder = 0
        OnClick = navStudentsClick
      end
    end
    object pnlStudentDetails: TPanel
      Left = 0
      Top = 344
      Width = 721
      Height = 220
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lblFirstName: TLabel
        Left = 16
        Top = 11
        Width = 57
        Height = 15
        Caption = 'First Name'
      end
      object lblLastName: TLabel
        Left = 183
        Top = 11
        Width = 56
        Height = 15
        Caption = 'Last Name'
      end
      object lblDOB: TLabel
        Left = 359
        Top = 11
        Width = 52
        Height = 15
        Caption = 'Birth Date'
      end
      object lblEmail: TLabel
        Left = 16
        Top = 59
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object lblMobilePhone: TLabel
        Left = 16
        Top = 109
        Width = 74
        Height = 15
        Caption = 'Mobile Phone'
      end
      object lblNotes: TLabel
        Left = 183
        Top = 59
        Width = 31
        Height = 15
        Caption = 'Notes'
      end
      object lblYellowfieldsInfo: TLabel
        Left = 16
        Top = 190
        Width = 161
        Height = 15
        Caption = '* Yellow fields are mandatory'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtFirstName: TDBEdit
        Left = 16
        Top = 32
        Width = 161
        Height = 23
        Color = clYellow
        DataField = 'FirstName'
        DataSource = DM.dsStudents
        TabOrder = 0
      end
      object edtLastName: TDBEdit
        Left = 183
        Top = 32
        Width = 170
        Height = 23
        Color = clYellow
        DataField = 'LastName'
        DataSource = DM.dsStudents
        TabOrder = 1
      end
      object edtBirthDate: TDBEdit
        Left = 359
        Top = 32
        Width = 114
        Height = 23
        Color = clYellow
        DataField = 'BirthDate'
        DataSource = DM.dsStudents
        TabOrder = 2
      end
      object edtEmail: TDBEdit
        Left = 16
        Top = 80
        Width = 161
        Height = 23
        DataField = 'Email'
        DataSource = DM.dsStudents
        TabOrder = 3
      end
      object edtMobilePhone: TDBEdit
        Left = 16
        Top = 130
        Width = 161
        Height = 23
        DataField = 'Mobile'
        DataSource = DM.dsStudents
        TabOrder = 4
      end
      object memoNotes: TDBMemo
        Left = 183
        Top = 80
        Width = 289
        Height = 73
        DataField = 'Notes'
        DataSource = DM.dsStudents
        TabOrder = 5
      end
    end
    object pnlStudentsHeader: TPanel
      Left = 0
      Top = 0
      Width = 721
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 3
      ExplicitWidth = 717
      object lblStudentsInfo: TLabel
        Left = 16
        Top = 8
        Width = 85
        Height = 25
        Caption = 'Students'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
    end
    object pnlDetailsHeader: TPanel
      Left = 0
      Top = 303
      Width = 721
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 4
      ExplicitTop = 8
      object lblDetailsInfo: TLabel
        Left = 16
        Top = 8
        Width = 65
        Height = 25
        Caption = 'Details'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -21
        Font.Name = 'Roboto'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
    end
  end
  object acMain: TActionList
    Left = 536
    Top = 272
    object acConnect: TAction
      Caption = 'Connect'
      Hint = 'Connect to database'
      OnExecute = acConnectExecute
      OnUpdate = acConnectUpdate
    end
    object acDisconnect: TAction
      Caption = 'Disconnect'
      Hint = 'Dissconnect from database'
      OnExecute = acDisconnectExecute
      OnUpdate = acDisconnectUpdate
    end
    object acShowSettings: TAction
      Caption = 'Settings'
      Hint = 'Connection Settings'
      OnExecute = acShowSettingsExecute
    end
  end
end
