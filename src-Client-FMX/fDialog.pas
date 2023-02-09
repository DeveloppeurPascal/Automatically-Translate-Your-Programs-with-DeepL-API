unit fDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Olf.RTL.Translate;

type
  TfrmDialog = class(TForm, IOlfTranslate)
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure TranslateTexts;
  end;

var
  frmDialog: TfrmDialog;

implementation

{$R *.fmx}

procedure TfrmDialog.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDialog.TranslateTexts;
begin
  caption := TOlfTranslate.getText(name, caption,
    procedure(ToText: string)
    begin
      caption := ToText;
    end);
  btnClose.text := TOlfTranslate.getText(name + '-' + btnClose.name,
    btnClose.text,
    procedure(ToText: string)
    begin
      btnClose.text := ToText;
    end);
end;

end.
