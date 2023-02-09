unit fDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Olf.RTL.Translate;

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

{$R *.dfm}

procedure TfrmDialog.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDialog.TranslateTexts;
begin
  caption := TOlfTranslate.getText(name, caption,
    procedure(ToText: string)
    begin
      caption := ToText;
    end);
  btnClose.caption := TOlfTranslate.getText(name + '-' + btnClose.name,
    btnClose.caption,
    procedure(ToText: string)
    begin
      btnClose.caption := ToText;
    end);
end;

end.
