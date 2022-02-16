object dmBancoDados: TdmBancoDados
  OldCreateOrder = False
  Height = 216
  Width = 296
  object fdConector: TFDConnection
    Params.Strings = (
      'Database=C:\Desenvolvimento\CRUD\BD.FDB'
      'User_Name=SYSDBA'
      'Password=y97boz77'
      'DriverID=FB')
    Connected = True
    Left = 40
    Top = 24
  end
  object dsNotas: TDataSource
    DataSet = fdNotas
    Left = 40
    Top = 104
  end
  object dsNotaItem: TDataSource
    DataSet = fdNotaItem
    Left = 40
    Top = 160
  end
  object fdQuery1: TFDQuery
    Connection = fdConector
    Left = 112
    Top = 32
  end
  object fdNotas: TFDQuery
    OnNewRecord = fdNotasNewRecord
    Connection = fdConector
    SQL.Strings = (
      'SELECT * FROM NOTAS')
    Left = 104
    Top = 104
    object fdNotasCODIGO_NOTA: TIntegerField
      FieldName = 'CODIGO_NOTA'
      Origin = 'CODIGO_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdNotasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 50
    end
    object fdNotasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object fdNotasVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
  end
  object fdNotaItem: TFDQuery
    OnNewRecord = fdNotaItemNewRecord
    Connection = fdConector
    SQL.Strings = (
      'SELECT * FROM ITENS_NOTA'
      'WHERE CODIGO_NOTA = :CODIGO_NOTA')
    Left = 104
    Top = 160
    ParamData = <
      item
        Name = 'CODIGO_NOTA'
        ParamType = ptInput
      end>
    object fdNotaItemCODIGO_ITEM: TIntegerField
      FieldName = 'CODIGO_ITEM'
      Origin = 'CODIGO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdNotaItemCODIGO_NOTA: TIntegerField
      FieldName = 'CODIGO_NOTA'
      Origin = 'CODIGO_NOTA'
    end
    object fdNotaItemQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      OnValidate = fdNotaItemQUANTIDADEValidate
    end
    object fdNotaItemVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      OnValidate = fdNotaItemVALOR_UNITARIOValidate
    end
    object fdNotaItemVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
  end
end
