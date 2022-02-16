object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Notas'
  ClientHeight = 352
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 591
    Height = 311
    Align = alClient
    DataSource = dmBancoDados.dsNotas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_NOTA'
        ReadOnly = True
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        ReadOnly = True
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 591
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 541
    ExplicitTop = 303
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 6
      Width = 101
      Height = 25
      Caption = 'Adicionar Nota'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 115
      Top = 6
      Width = 101
      Height = 25
      Caption = 'Salvar Altera'#231#245'es'
      TabOrder = 1
    end
    object Button5: TButton
      Left = 222
      Top = 6
      Width = 101
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button3: TButton
      Left = 329
      Top = 6
      Width = 101
      Height = 25
      Caption = 'Excluir Nota'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 436
      Top = 6
      Width = 101
      Height = 25
      Caption = 'Ver Itens'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
end
