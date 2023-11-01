program TestTask;

uses
  Vcl.Forms,
  main in 'main.pas' {frmMain},
  DataMod in 'DataMod.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
