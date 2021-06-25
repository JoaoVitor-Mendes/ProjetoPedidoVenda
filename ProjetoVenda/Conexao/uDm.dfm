object dm: Tdm
  OldCreateOrder = False
  Height = 281
  Width = 464
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=bdpedido'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 152
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\ProjetoVenda\libmysql.dll'
    Left = 56
    Top = 88
  end
  object DataSource1: TDataSource
    Left = 216
    Top = 128
  end
  object qPesquisa: TFDQuery
    Connection = Conexao
    Left = 144
    Top = 32
  end
  object qExecuta: TFDQuery
    Connection = Conexao
    Left = 208
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT CLIENTES.*, PEDIDOS_GERAIS.* FROM PEDIDOS_GERAIS'
      
        'LEFT JOIN CLIENTES ON CLIENTES.CD_CLIENTE = PEDIDOS_GERAIS.ID_CL' +
        'IENTE'
      'WHERE CD_PEDIDO = :CD_PEDIDO')
    Left = 288
    Top = 56
    ParamData = <
      item
        Name = 'CD_PEDIDO'
        ParamType = ptInput
      end>
  end
end
