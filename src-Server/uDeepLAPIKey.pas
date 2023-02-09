unit uDeepLAPIKey;

interface

{$IFDEF DEBUG}

var
  CDeeplAPIKey: string;
{$ELSE}

const
  CDeeplAPIKey = '';
{$ENDIF}

implementation

{$IFDEF DEBUG}

uses System.SysUtils, System.IOUtils;

initialization

// 'MyDocuments/cle-deepl.dat' is a text file with my DeepL private API key
// on the first line
CDeeplAPIKey := TFile.ReadAllText(tpath.Combine(tpath.GetDocumentsPath,
  'cle-deepl.dat')).trim;
{$ENDIF}

end.
