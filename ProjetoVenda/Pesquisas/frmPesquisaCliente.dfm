object formPesquisaCliente: TformPesquisaCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Cliente'
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
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 361
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 837
    ExplicitHeight = 405
    object dbgClientes: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 776
      Height = 353
      Align = alClient
      DataSource = dsClientes
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgClientesDblClick
      OnKeyDown = dbgClientesKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'cd_cliente'
          Title.Caption = 'C'#243'digo'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome Cliente'
          Width = 427
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Title.Caption = 'Cidade'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Title.Caption = 'UF'
          Visible = True
        end>
    end
  end
  object dsClientes: TDataSource
    DataSet = qClientes
    Left = 400
    Top = 88
  end
  object qClientes: TFDQuery
    Left = 344
    Top = 88
    object qClientescd_cliente: TIntegerField
      FieldName = 'cd_cliente'
    end
    object qClientesnome: TVarBytesField
      FieldName = 'nome'
      Size = 255
    end
    object qClientescidade: TVarBytesField
      FieldName = 'cidade'
      Size = 255
    end
    object qClientesuf: TVarBytesField
      FieldName = 'uf'
      Size = 2
    end
  end
end
