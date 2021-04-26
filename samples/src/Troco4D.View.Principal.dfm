object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Troco4D'
  ClientHeight = 341
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtValor: TEdit
    Left = 56
    Top = 24
    Width = 75
    Height = 21
    TabOrder = 0
    Text = '178,91'
  end
  object btnTroco: TButton
    Left = 56
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Montar Troco'
    TabOrder = 1
    OnClick = btnTrocoClick
  end
end
