object Form1: TForm1
  Left = 311
  Top = 124
  BorderStyle = bsDialog
  Caption = 
    '                     '#1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1082#1086#1085' Windows    v 1.2 for -TSN- @ ' +
    'Sergius'
  ClientHeight = 516
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = Button1Click
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 312
    Width = 481
    Height = 185
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 202
    Top = 16
    Width = 102
    Height = 13
    Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1077' '#1086#1082#1085#1072':'
  end
  object Label2: TLabel
    Left = 213
    Top = 320
    Width = 80
    Height = 13
    Caption = #1044#1086#1095#1077#1088#1085#1080#1077' '#1086#1082#1085#1072':'
  end
  object Bevel2: TBevel
    Left = 16
    Top = 8
    Width = 481
    Height = 289
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 16
    Top = 304
    Width = 481
    Height = 1
    Shape = bsTopLine
  end
  object ListBox1: TListBox
    Left = 24
    Top = 32
    Width = 457
    Height = 201
    Color = 16378623
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ListBox2: TListBox
    Left = 32
    Top = 336
    Width = 449
    Height = 145
    Color = 16378623
    ItemHeight = 13
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 248
    Width = 305
    Height = 33
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 384
    Top = 240
    Width = 89
    Height = 17
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object CheckBox2: TCheckBox
    Left = 384
    Top = 264
    Width = 89
    Height = 17
    Caption = #1041#1077#1079' '#1089#1082#1088#1099#1090#1099#1093
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = Button1Click
  end
  object XPManifest1: TXPManifest
    Left = 24
    Top = 8
  end
end
