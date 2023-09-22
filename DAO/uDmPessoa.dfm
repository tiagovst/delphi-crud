object DmPessoa: TDmPessoa
  OldCreateOrder = False
  Height = 334
  Width = 469
  object sqlPes: TFDQuery
    Connection = DmConexao.FDCon
    SQL.Strings = (
      'select codigo, nome, telefone'
      'from pessoa'
      'where (nome like :nome);')
    Left = 80
    Top = 40
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object sqlPesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object sqlPesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 18
    end
  end
  object DriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 400
    Top = 128
  end
  object sqlInserir: TFDQuery
    Connection = DmConexao.FDCon
    SQL.Strings = (
      'insert into PESSOA (CODIGO, NOME, TIPO, TELEFONE, DOCUMENTO)'
      'values (:CODIGO, :NOME, :TIPO, :TELEFONE, :DOCUMENTO) ')
    Left = 160
    Top = 40
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = ''
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
  end
  object sqlAlterar: TFDQuery
    Connection = DmConexao.FDCon
    SQL.Strings = (
      'update PESSOA'
      'set NOME = :NOME,'
      '    TIPO = :TIPO,'
      '    TELEFONE = :TELEFONE,'
      '    DOCUMENTO = :DOCUMENTO'
      'where (CODIGO = :CODIGO);  ')
    Left = 240
    Top = 40
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sqlExcluir: TFDQuery
    Connection = DmConexao.FDCon
    SQL.Strings = (
      'delete from PESSOA'
      'where (CODIGO = :CODIGO);')
    Left = 320
    Top = 40
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sqlAll: TFDQuery
    Connection = DmConexao.FDCon
    SQL.Strings = (
      'select codigo, nome, telefone from pessoa;')
    Left = 216
    Top = 168
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 18
    end
  end
end
