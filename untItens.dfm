object frmItens: TfrmItens
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Itens'
  ClientHeight = 399
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 369
    Height = 358
    Align = alClient
    DataSource = dmBancoDados.dsNotaItem
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_ITEM'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNITARIO'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        ReadOnly = True
        Title.Caption = 'Valor Total'
        Width = 68
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 369
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 303
    ExplicitWidth = 185
    object Button3: TButton
      Left = 189
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir Item'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 13
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Adicionar Item'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 108
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar Item'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
