object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'VCL Sample Project'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object lblCurrentLanguage: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 422
    Width = 618
    Height = 15
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    Caption = 'lblCurrentLanguage'
    ExplicitLeft = 0
    ExplicitTop = 427
    ExplicitWidth = 105
  end
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 628
    Height = 15
    Align = alTop
    Caption = 'Jules Verne bibliography from Wikipedia available at '
    ExplicitWidth = 276
  end
  object Label2: TLabel
    Left = 0
    Top = 15
    Width = 628
    Height = 15
    Cursor = crHandPoint
    Align = alTop
    Caption = 'https://en.wikipedia.org/wiki/Jules_Verne_bibliography'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    StyleElements = [seClient, seBorder]
    OnClick = Label2Click
    ExplicitWidth = 289
  end
  object Memo1: TMemo
    Left = 0
    Top = 30
    Width = 628
    Height = 387
    Align = alClient
    Lines.Strings = (
      
        'Jules Verne (1828'#8211'1905) was a French novelist, poet, and playwri' +
        'ght. Most famous for his novel sequence, the Voyages '
      
        'Extraordinaires, Verne also wrote assorted short stories, plays,' +
        ' miscellaneous novels, essays, and poetry. His works are '
      
        'notable for their profound influence on science fiction and on s' +
        'urrealism, their innovative use of modernist literary '
      
        'techniques such as self-reflexivity, and their complex combinati' +
        'on of positivist and romantic ideologies.'
      ''
      
        'Unless otherwise referenced, the information presented here is d' +
        'erived from the research of Volker Dehs, Jean-Michel '
      'Margot, Zvi Har'#8217'El, and William Butcher.')
    ReadOnly = True
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 225
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 224
    object mnuFile: TMenuItem
      Caption = 'File'
      object mnuQuit: TMenuItem
        Caption = 'Quit'
        OnClick = mnuQuitClick
      end
    end
    object mnuTools: TMenuItem
      Caption = 'Tools'
      object mnuOptions: TMenuItem
        Caption = 'Options'
        OnClick = mnuOptionsClick
      end
    end
    object mnuLanguage: TMenuItem
      Caption = 'Language'
      object mnuItallian: TMenuItem
        Caption = 'Italian'
        OnClick = mnuItallianClick
      end
      object mnuFrench: TMenuItem
        Caption = 'French'
        OnClick = mnuFrenchClick
      end
      object mnuEnglish: TMenuItem
        Caption = 'English'
        OnClick = mnuEnglishClick
      end
      object mnuMyLanguage: TMenuItem
        Caption = 'My language'
        OnClick = mnuMyLanguageClick
      end
    end
    object mnuHelp: TMenuItem
      Caption = 'Help'
      object mnuAbout: TMenuItem
        Caption = 'About'
        OnClick = mnuAboutClick
      end
    end
  end
end
