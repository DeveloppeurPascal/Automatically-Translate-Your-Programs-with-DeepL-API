unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  Olf.RTL.Translate, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TfrmMain = class(TForm, IOlfTranslate)
    MainMenu1: TMainMenu;
    mnuFichier: TMenuItem;
    mnuOutils: TMenuItem;
    mnuAide: TMenuItem;
    mnuQuitter: TMenuItem;
    mnuOptions: TMenuItem;
    mnuAPropos: TMenuItem;
    mnuLangues: TMenuItem;
    mnuFrancais: TMenuItem;
    mnuAnglais: TMenuItem;
    mnuItalien: TMenuItem;
    mnuMyLanguage: TMenuItem;
    lblCurrentLanguage: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure mnuAnglaisClick(Sender: TObject);
    procedure mnuFrancaisClick(Sender: TObject);
    procedure mnuItalienClick(Sender: TObject);
    procedure mnuMyLanguageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure mnuOptionsClick(Sender: TObject);
    procedure mnuAProposClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure TranslateTexts;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses Olf.FMX.Translate, Olf.RTL.Language, u_urlOpen, fDialog;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TranslateTexts;
end;

procedure TfrmMain.Label2Click(Sender: TObject);
begin
  url_Open_In_Browser(Label2.Text);
end;

procedure TfrmMain.mnuAnglaisClick(Sender: TObject);
begin
  TOlfTranslateProject.CurrentLanguage := 'en';
end;

procedure TfrmMain.mnuAProposClick(Sender: TObject);
begin
  showmessage(TOlfTranslateProject.getText('Hello World !'));
end;

procedure TfrmMain.mnuFrancaisClick(Sender: TObject);
begin
  TOlfTranslateProject.CurrentLanguage := 'fr';
end;

procedure TfrmMain.mnuItalienClick(Sender: TObject);
begin
  TOlfTranslateProject.CurrentLanguage := 'it';
end;

procedure TfrmMain.mnuMyLanguageClick(Sender: TObject);
begin
  TOlfTranslateProject.CurrentLanguage := GetCurrentLanguageISOCode;
end;

procedure TfrmMain.mnuOptionsClick(Sender: TObject);
begin
  frmDialog.Show;
end;

procedure TfrmMain.TranslateTexts;
var
  i: integer;
  tc: TTextControl;
  ptc: TPresentedTextControl;
  tcm: tcustommemo;
begin
  lblCurrentLanguage.Text := TOlfTranslateProject.CurrentLanguage;
  caption := TOlfTranslate.getText(name, caption,
    procedure(ToText: string)
    begin
      caption := ToText;
    end);
  for i := 0 to ComponentCount - 1 do
    if (components[i] <> lblCurrentLanguage) then
      if (components[i] is TTextControl) then
      begin
        tc := components[i] as TTextControl;
        tc.Text := TOlfTranslate.getText(name + '-' + components[i]
          .name, tc.Text,
          procedure(ToText: string)
          begin
            tc.Text := ToText;
          end);
      end
      else if (components[i] is TPresentedTextControl) then
      begin
        ptc := components[i] as TPresentedTextControl;
        ptc.Text := TOlfTranslate.getText
          (name + '-' + components[i].name, ptc.Text,
          procedure(ToText: string)
          begin
            ptc.Text := ToText;
          end);
      end
      else if (components[i] is tcustommemo) then
      begin
        tcm := components[i] as tcustommemo;
        tcm.Text := TOlfTranslate.getText
          (name + '-' + components[i].name, tcm.Text,
          procedure(ToText: string)
          begin
            tcm.Text := ToText;
          end);
      end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
TOlfTranslateProject.DefaultLanguage := 'en';
TOlfTranslateProject.TranslationServerURL := 'http://localhost:8080';
{$ELSE}
{$MESSAGE FATAL 'sample project only, don''t use it in production'}
{$ENDIF}

end.
