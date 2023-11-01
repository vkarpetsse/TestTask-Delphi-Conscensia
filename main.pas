unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Mask;

type

  TfrmMain = class(TForm)
    StatusBar: TStatusBar;
    pnlHeader: TPanel;
    pnlGroups: TPanel;
    grdGroups: TDBGrid;
    Splitter1: TSplitter;
    pnlStudents: TPanel;
    grdStudents: TDBGrid;
    pnlNavStudents: TPanel;
    navStudents: TDBNavigator;
    pnlNabGroups: TPanel;
    navGroups: TDBNavigator;
    pnlStudentDetails: TPanel;
    acMain: TActionList;
    acConnect: TAction;
    acDisconnect: TAction;
    acShowSettings: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edtFirstName: TDBEdit;
    edtLastName: TDBEdit;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    edtBirthDate: TDBEdit;
    lblDOB: TLabel;
    pnlGroupsHeader: TPanel;
    Label1: TLabel;
    pnlStudentsHeader: TPanel;
    lblStudentsInfo: TLabel;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblMobilePhone: TLabel;
    edtMobilePhone: TDBEdit;
    lblNotes: TLabel;
    lblYellowfieldsInfo: TLabel;
    pnlDetailsHeader: TPanel;
    lblDetailsInfo: TLabel;
    memoNotes: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure navGroupsClick(Sender: TObject; Button: TNavigateBtn);
    procedure acConnectExecute(Sender: TObject);
    procedure acDisconnectExecute(Sender: TObject);
    procedure acShowSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acConnectUpdate(Sender: TObject);
    procedure acDisconnectUpdate(Sender: TObject);
    procedure navStudentsClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    FIniFileName: string;
  public
    { Public declarations }
  end;

  function ReadValueFromIniFile(const AIniFileName: String; const ASectionName: string; const AIdentName: string): string;
  procedure WriteValueToIniFile(const AIniFileName: String; const ASectionName: string; const AIdentName: string; const AValue: string);
  function ShowInputQueryDialog(const ACaption: string; const APromt: string; var AValue: string; out ANewValue: string): Boolean;

var
  frmMain: TfrmMain;

implementation

uses DataMod, AdoConEd, System.IniFiles;

{$R *.dfm}

function ReadValueFromIniFile(const AIniFileName: String; const ASectionName: string; const AIdentName: string): string;
var
  AIniFile: TIniFile;
begin
  AIniFile := TIniFile.Create(AIniFileName);
  try
    Result := AIniFile.ReadString(ASectionName, AIdentName, '');
  finally
    AIniFile.Free;
  end;
end;

procedure WriteValueToIniFile(const AIniFileName: String; const ASectionName: string; const AIdentName: string; const AValue: string);
var
  AIniFile: TIniFile;
begin
  AIniFile := TIniFile.Create(AIniFileName);
  try
    AIniFile.WriteString(ASectionName, AIdentName, AValue);
  finally
    AIniFile.Free;
  end;
end;

function ShowInputQueryDialog(const ACaption: string; const APromt: string; var AValue: string; out ANewValue: string): Boolean;
begin
  Result := InputQuery(ACaption, APromt, AValue);
  if Result then
    ANewValue := AValue;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FIniFileName := ExtractFilePath(Application.ExeName) + 'settings.ini';
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if DM.ADOConnection.Connected then
    DM.ADOConnection.Close;
  DM.ADOConnection.ConnectionString := ReadValueFromIniFile(FIniFileName, 'Database', 'ConnectionString');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.ADOConnection.Close;
end;

procedure TfrmMain.acShowSettingsExecute(Sender: TObject);
begin
  if EditConnectionString(DM.ADOConnection) then
    WriteValueToIniFile(FIniFileName, 'Database', 'ConnectionString', DM.ADOConnection.connectionString);
end;

procedure TfrmMain.acConnectExecute(Sender: TObject);
begin
  try
    DM.ADOConnection.Open;
  except
     on E:Exception do
     begin
      MessageDlg(format('Cannot connect to database.\nError: %s', [E.Message]), TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      Exit;
     end;
  end;

  if (DM.ADOConnection.Connected) then
  begin
    DM.cdsGroups.Open;
    DM.cdsStudents.Open;
  end;
end;

procedure TfrmMain.acConnectUpdate(Sender: TObject);
begin
  acConnect.Enabled := not DM.ADOConnection.Connected;
end;

procedure TfrmMain.acDisconnectExecute(Sender: TObject);
begin
  DM.Disconnect;
end;

procedure TfrmMain.acDisconnectUpdate(Sender: TObject);
begin
  acDisconnect.Enabled := DM.ADOConnection.Connected;
end;

procedure TfrmMain.navGroupsClick(Sender: TObject; Button: TNavigateBtn);
var
  AGroupId: Integer;
  AGroupName, ANewGroupName: string;
  AResult: Boolean;
begin
  case (Button) of
    nbInsert:
      begin
        AGroupName := 'Group Name';
        AResult := ShowInputQueryDialog('Add new Group', 'Input Group Name', AGroupName, ANewGroupName);
        if AResult then
        begin
          AGroupId := DM.AddGroup(AGroupName);

          grdGroups.DataSource.DataSet.DisableControls;
          try
            DM.cdsGroups.Refresh;
            DM.cdsGroups.Locate('GroupId', VarArrayOf([AGroupId]), []);
          finally
            grdGroups.DataSource.DataSet.EnableControls;
          end;
        end;
      end;

    nbEdit:
      begin
        AGroupName := DM.cdsGroups.FieldByName('GroupName').AsString;
        AResult := ShowInputQueryDialog('Edit Group', 'Input Group Name', AGroupName, ANewGroupName);
        if AResult then
        begin
          DM.cdsGroups.Edit;
          DM.cdsGroups.FieldByName('GroupName').AsString := ANewGroupName;
          DM.cdsGroups.Post;
        end
        else
          DM.cdsGroups.Cancel;
      end;
  end;
end;

procedure TfrmMain.navStudentsClick(Sender: TObject; Button: TNavigateBtn);
begin
  case (Button) of
    nbInsert:
      begin
        edtFirstName.SetFocus;
        DM.cdsStudents.Insert;
      end;
  end;
end;

end.
