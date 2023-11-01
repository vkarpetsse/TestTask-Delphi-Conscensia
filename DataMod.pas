unit DataMod;

interface

uses
  System.SysUtils, System.Classes, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, Vcl.Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    cdsGroups: TClientDataSet;
    dspGroups: TDataSetProvider;
    cdsStudents: TClientDataSet;
    dspStudents: TDataSetProvider;
    dsGroups: TDataSource;
    dsStudents: TDataSource;
    cdsGroupsGroupId: TAutoIncField;
    cdsGroupsGroupName: TWideStringField;
    qryGroups: TADOQuery;
    cdsStudentsStudentId: TAutoIncField;
    cdsStudentsGroupId: TIntegerField;
    cdsStudentsFirstName: TStringField;
    cdsStudentsLastName: TStringField;
    cdsStudentsBirthDate: TDateField;
    dataSetStudents: TADODataSet;
    cdsStudentsEmail: TStringField;
    cdsStudentsNotes: TStringField;
    cdsStudentsMobile: TStringField;
    procedure cdsGroupsAfterPost(DataSet: TDataSet);
    procedure cdsGroupsAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure dataSetStudentsAfterPost(DataSet: TDataSet);
    procedure cdsStudentsAfterDelete(DataSet: TDataSet);
    procedure cdsGroupsBeforeDelete(DataSet: TDataSet);
    procedure cdsStudentsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    function GetStudentsCountByGroupId(const AGroupId: Integer): Integer;
    function ValidateStudentsMandatoryFields(): Boolean;
  public
    { Public declarations }
    function AddGroup(const AGroupName: string): integer;
    procedure Disconnect;
  end;

  function ValidateEmail(const AEmailAddress: string): Boolean;

var
  DM: TDM;

implementation

uses RegularExpressions;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if DM.ADOConnection.Connected then
    DM.ADOConnection.Close;
  DM.ADOConnection.ConnectionString := EmptyStr;
end;

procedure TDM.Disconnect;
begin
  DM.cdsStudents.Close;
  DM.cdsGroups.Close;
  DM.ADOConnection.Close;
end;

function TDM.AddGroup(const AGroupName: string): Integer;
begin
  var AQuery := TADOQuery.Create(nil);
  AQuery.Connection := Self.ADOConnection;
  try
    AQuery.SQL.Add('insert into Groups(GroupName) values(:GroupName)');
    AQuery.SQL.Add('select :GroupId = SCOPE_IDENTITY()');
    AQuery.Parameters.ParamByName('GroupName').Value := AGroupName;
    AQuery.Parameters.ParamByName('GroupId').Direction:= pdReturnValue;
    AQuery.ExecSQL;

    Result := AQuery.Parameters.ParamByName('GroupId').Value;
  finally
    AQuery.Free;
  end;
end;

function TDM.GetStudentsCountByGroupId(const AGroupId: Integer): Integer;
begin
  var AQuery := TADOQuery.Create(nil);
  AQuery.Connection := Self.ADOConnection;
  try
    AQuery.SQL.Add('select count(*) from Students where GroupId = :GroupId');
    AQuery.Parameters.ParamByName('GroupId').Value := AGroupId;
    AQuery.Open;

    Result := AQuery.Fields[0].AsInteger;
  finally
    AQuery.Free;
  end;
end;

procedure TDM.cdsGroupsBeforeDelete(DataSet: TDataSet);
begin
  var AGroupId := (DataSet as TClientDataSet).FieldByName('GroupId').AsInteger;
  var AGroupame := (DataSet as TClientDataSet).FieldByName('GroupName').AsString;
  var AStudentCount := GetStudentsCountByGroupId(AGroupId);
  if AStudentCount > 0 then
  begin
    MessageDlg(Format('Cannot delete the group %s.'+ #13#10 + 'Group is not empty: %d record(s) exists.', [QuotedStr(AGroupame), AStudentCount]), mtError, [mbOk], 0);
    Abort;
  end;
end;

procedure TDM.cdsGroupsAfterDelete(DataSet: TDataSet);
begin
  cdsGroups.ApplyUpdates(0);
end;

procedure TDM.cdsGroupsAfterPost(DataSet: TDataSet);
begin
  cdsGroups.ApplyUpdates(0);
end;


function TDM.ValidateStudentsMandatoryFields(): Boolean;
begin
  var AEmptyFullName := (DM.cdsStudents.FieldByName('FirstName').asString = EmptyStr);
  var AEmptyLastName := (DM.cdsStudents.FieldByName('LastName').asString = EmptyStr);
  var AEmptyBirthDate := (DM.cdsStudents.FieldByName('BirthDate').asString = EmptyStr);

  Result := not(AEmptyFullName or AEmptyLastName or AEmptyBirthDate);
end;

function ValidateEmail(const AEmailAddress: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegex.Create('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  Result := RegEx.Match(AEmailAddress).Success;
end;

procedure TDM.dataSetStudentsAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
end;

procedure TDM.cdsStudentsAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
end;

procedure TDM.cdsStudentsBeforePost(DataSet: TDataSet);
begin
  if not(ValidateStudentsMandatoryFields) then
  begin
    MessageDlg('Mandatory fields have to be populated.', TMsgDlgType.mtWarning, [mbOK], 0);
    Abort;
  end;

  if not(ValidateEmail(DM.cdsStudents.FieldByName('Email').asString)) then
  begin
    MessageDlg('Email is not valid.', TMsgDlgType.mtWarning, [mbOK], 0);
    Abort;
  end;
end;

end.
