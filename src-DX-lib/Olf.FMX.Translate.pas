unit Olf.FMX.Translate;

// (c) Patrick Prémartin 02/2023
//
// This file is distributed under AGPL license.
//
// Get the latest version at
// https://github.com/DeveloppeurPascal/Delphi-Translation-Library
//
// This file has been created for a DelphiCon 2023 online conference demo.
// It depends on the DeepL proxy server given during this session.

interface

uses Olf.RTL.Translate;

type
  TOlfTranslateProject = class(TOlfTranslate)
  public
    class procedure TranslateProjectForms;
  end;

implementation

uses
  System.SysUtils, FMX.Forms;

{ TOlfTranslateProject }

class procedure TOlfTranslateProject.TranslateProjectForms;
var
  i: integer;
  OlfTranslate: IOlfTranslate;
begin
  for i := 0 to Application.ComponentCount - 1 do
    if supports(Application.Components[i], IOlfTranslate, OlfTranslate) then
      OlfTranslate.TranslateTexts;
end;

initialization

TOlfTranslateProject.onLanguageChangedEvent :=
  TOlfTranslateProject.TranslateProjectForms;

end.
