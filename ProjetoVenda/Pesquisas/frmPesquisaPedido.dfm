object formPesquisaPedido: TformPesquisaPedido
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Pedidos'
  ClientHeight = 361
  ClientWidth = 784
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
  object dbgPedidos: TDBGrid
    Left = 0
    Top = 0
    Width = 784
    Height = 361
    Align = alClient
    DataSource = dsPedidos
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgPedidosDblClick
    OnKeyDown = dbgPedidosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_PEDIDO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_EMISSAO'
        Title.Caption = 'Dt. Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome Cliente'
        Width = 501
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = 'Vl. Total'
        Visible = True
      end>
  end
  object qPedidos: TFDQuery
    Left = 344
    Top = 128
    object qPedidosCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
    end
    object qPedidosDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object qPedidosNOME: TStringField
      FieldName = 'NOME'
      Size = 155
    end
    object qPedidosVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object qPedidosCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
  end
  object dsPedidos: TDataSource
    DataSet = qPedidos
    Left = 408
    Top = 128
  end
end
