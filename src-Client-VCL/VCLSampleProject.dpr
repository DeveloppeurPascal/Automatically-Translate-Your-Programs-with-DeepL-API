program VCLSampleProject;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmMain},
  Olf.RTL.Language in '..\src-DX-lib\Olf.RTL.Language.pas',
  OlfSoftware.DeepL.ClientLib in '..\src-DX-lib\OlfSoftware.DeepL.ClientLib.pas',
  Olf.RTL.Translate in '..\src-DX-lib\Olf.RTL.Translate.pas',
  Olf.VCL.Translate in '..\src-DX-lib\Olf.VCL.Translate.pas',
  fDialog in 'fDialog.pas' {frmDialog},
  u_urlOpen in '..\src-DX-lib\u_urlOpen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDialog, frmDialog);
  Application.Run;
end.
