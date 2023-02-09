unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Olf.RTL.Translate,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm, IOlfTranslate)
    MainMenu1: TMainMenu;
    mnuFile: TMenuItem;
    mnuQuit: TMenuItem;
    mnuTools: TMenuItem;
    mnuOptions: TMenuItem;
    mnuLanguage: TMenuItem;
    mnuItallian: TMenuItem;
    mnuFrench: TMenuItem;
    mnuEnglish: TMenuItem;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    mnuMyLanguage: TMenuItem;
    lblCurrentLanguage: TLabel;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure mnuItallianClick(Sender: TObject);
    procedure mnuFrenchClick(Sender: TObject);
    procedure mnuEnglishClick(Sender: TObject);
    procedure mnuMyLanguageClick(Sender: TObject);
    procedure mnuQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure mnuOptionsClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure TranslateTexts;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Olf.RTL.Language, Olf.Vcl.Translate, u_urlOpen, fDialog;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TranslateTexts;
end;

procedure TfrmMain.Label2Click(Sender: TObject);
begin
  url_Open_In_Browser(Label2.Caption);
end;

procedure TfrmMain.mnuAboutClick(Sender: TObject);
begin
  showmessage(TOlfTranslateProject.getText('Hello World !'));
end;

procedure TfrmMain.mnuEnglishClick(Sender: TObject);
begin
  TOlfTranslateProject.CurrentLanguage := 'en';
end;

procedure TfrmMain.mnuFrenchClick(Sender: TObject);
begin
  TOlfTranslateProject.CurrentLanguage := 'fr';
end;

procedure TfrmMain.mnuItallianClick(Sender: TObject);
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

procedure TfrmMain.mnuQuitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.TranslateTexts;
var
  i: integer;
  mi: TMenuItem;
  l: TCustomLabel;
  mmo: tcustommemo;
begin
  lblCurrentLanguage.Caption := TOlfTranslateProject.CurrentLanguage;
  Caption := TOlfTranslate.getText(name, Caption,
    procedure(ToText: string)
    begin
      Caption := ToText;
    end);
  for i := 0 to ComponentCount - 1 do
    if (components[i] <> lblCurrentLanguage) then
      if (components[i] is TMenuItem) then
      begin
        mi := (components[i] as TMenuItem);
        mi.Caption := TOlfTranslate.getText(name + '-' + mi.name, mi.Caption,
          procedure(ToText: string)
          begin
            mi.Caption := ToText;
          end);
      end
      else if (components[i] is TCustomLabel) then
      begin
        l := (components[i] as TCustomLabel);
        l.Caption := TOlfTranslate.getText(name + '-' + l.name, l.Caption,
          procedure(ToText: string)
          begin
            l.Caption := ToText;
          end);
      end
      else if (components[i] is tcustommemo) then
      begin
        mmo := (components[i] as tcustommemo);
        mmo.text := TOlfTranslate.getText(name + '-' + mmo.name, mmo.text,
          procedure(ToText: string)
          begin
            mmo.text := ToText;
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
