object frmVenda: TfrmVenda
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 566
  ClientWidth = 1104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1104
    Height = 566
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 601
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1102
      Height = 72
      Align = alTop
      TabOrder = 0
      object Panel3: TPanel
        Left = 181
        Top = 12
        Width = 134
        Height = 25
        Caption = 'Emiss'#227'o'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object edDtEmissao: TDateTimePicker
        Left = 181
        Top = 36
        Width = 134
        Height = 27
        Date = 44370.000000000000000000
        Time = 0.719159085645515000
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 323
        Top = 12
        Width = 105
        Height = 25
        Caption = 'Cliente'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object edCdCliente: TEdit
        Left = 323
        Top = 36
        Width = 105
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnExit = edCdClienteExit
        OnKeyDown = edCdClienteKeyDown
      end
      object btPesquisaCliente: TButton
        Left = 428
        Top = 36
        Width = 45
        Height = 27
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btPesquisaClienteClick
      end
      object edNomeCliente: TEdit
        Left = 479
        Top = 36
        Width = 613
        Height = 30
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object Panel4: TPanel
        Left = 11
        Top = 11
        Width = 118
        Height = 25
        Caption = 'Nr'#176' Pedido'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object edCdPedido: TEdit
        Left = 11
        Top = 36
        Width = 118
        Height = 27
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnExit = edCdPedidoExit
      end
      object btPesquisaPedido: TButton
        Left = 130
        Top = 36
        Width = 45
        Height = 27
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = btPesquisaPedidoClick
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 465
      Width = 1102
      Height = 5
      Align = alTop
      Color = 33023
      ParentBackground = False
      TabOrder = 1
    end
    object Panel7: TPanel
      Left = 1
      Top = 78
      Width = 1102
      Height = 67
      Align = alTop
      TabOrder = 2
      object Panel6: TPanel
        Left = 11
        Top = 7
        Width = 118
        Height = 25
        Caption = 'C'#243'd. Produto'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object edCdProduto: TEdit
        Left = 11
        Top = 31
        Width = 118
        Height = 27
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnExit = edCdProdutoExit
        OnKeyDown = edCdProdutoKeyDown
      end
      object btPesquisaProduto: TButton
        Left = 130
        Top = 31
        Width = 45
        Height = 27
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btPesquisaProdutoClick
      end
      object edDsProduto: TEdit
        Left = 181
        Top = 31
        Width = 580
        Height = 30
        Alignment = taCenter
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object Panel8: TPanel
        Left = 181
        Top = 6
        Width = 580
        Height = 25
        Caption = 'Descri'#231#227'o Produto'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object edQuantidade: TEdit
        Left = 773
        Top = 31
        Width = 118
        Height = 27
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnEnter = edQuantidadeEnter
        OnKeyDown = edQuantidadeKeyDown
      end
      object Panel9: TPanel
        Left = 773
        Top = 7
        Width = 118
        Height = 25
        Caption = 'Quantidade'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object edVlUnitario: TEdit
        Left = 903
        Top = 31
        Width = 118
        Height = 27
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnKeyDown = edVlUnitarioKeyDown
      end
      object Panel10: TPanel
        Left = 903
        Top = 6
        Width = 118
        Height = 25
        Caption = 'Vl. Unit'#225'rio'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
      end
      object btIncluirProduto: TButton
        Left = 1027
        Top = 34
        Width = 65
        Height = 27
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = btIncluirProdutoClick
      end
    end
    object pnGrid: TPanel
      Left = 1
      Top = 145
      Width = 1102
      Height = 320
      Align = alTop
      TabOrder = 3
      object dbgItensPedido: TDBGrid
        Left = 1
        Top = 1
        Width = 1100
        Height = 318
        Align = alClient
        DataSource = dsItensPedido
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_PEDIDO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
            Title.Caption = 'Dt. Emiss'#227'o'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_CLIENTE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Title.Caption = 'C'#243'd. Produto'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 734
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PEDIDO_PRODUTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quant.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            Title.Caption = 'Vl. Unit'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Vl. Total'
            Width = 102
            Visible = True
          end>
      end
    end
    object Panel11: TPanel
      Left = 1
      Top = 73
      Width = 1102
      Height = 5
      Align = alTop
      Color = 33023
      ParentBackground = False
      TabOrder = 4
    end
    object pnValores: TPanel
      Left = 1
      Top = 470
      Width = 1102
      Height = 43
      Align = alTop
      TabOrder = 5
      ExplicitLeft = 121
      ExplicitTop = 476
      object Panel12: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 118
        Height = 35
        Margins.Right = 0
        Align = alLeft
        Caption = 'Qt.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 6
        ExplicitHeight = 25
      end
      object edQtProdutos: TEdit
        AlignWithMargins = True
        Left = 122
        Top = 4
        Width = 118
        Height = 35
        Margins.Left = 0
        Align = alLeft
        Alignment = taCenter
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 33023
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ExplicitHeight = 30
      end
      object edVlTotalVenda: TEdit
        AlignWithMargins = True
        Left = 980
        Top = 4
        Width = 118
        Height = 35
        Margins.Left = 0
        Align = alRight
        Alignment = taRightJustify
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 33023
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ExplicitHeight = 30
      end
      object Panel13: TPanel
        AlignWithMargins = True
        Left = 862
        Top = 4
        Width = 118
        Height = 35
        Margins.Right = 0
        Align = alRight
        Caption = 'Valor Total'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        ExplicitLeft = 19
        ExplicitTop = 14
        ExplicitHeight = 25
      end
    end
    object pnFooter: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 516
      Width = 1096
      Height = 46
      Align = alClient
      TabOrder = 6
      ExplicitLeft = 3
      ExplicitTop = 515
      object btGravar: TButton
        Left = 856
        Top = 1
        Width = 239
        Height = 44
        Align = alRight
        Caption = '&Gravar Pedido [F8]'
        TabOrder = 0
        OnClick = btGravarClick
        ExplicitLeft = 862
      end
      object Button2: TButton
        Left = 1
        Top = 1
        Width = 239
        Height = 44
        Align = alLeft
        Caption = 'Cancelar Pedido'
        TabOrder = 1
        OnClick = Button2Click
        ExplicitLeft = 862
      end
    end
  end
  object qItensPedido: TFDQuery
    Left = 424
    Top = 248
    object qItensPedidoCD_PEDIDO: TIntegerField
      FieldName = 'CD_PEDIDO'
    end
    object qItensPedidoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object qItensPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qItensPedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 155
    end
    object qItensPedidoCD_PEDIDO_PRODUTO: TIntegerField
      FieldName = 'CD_PEDIDO_PRODUTO'
    end
    object qItensPedidoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qItensPedidoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object qItensPedidoVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
    object qItensPedidoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
  object dsItensPedido: TDataSource
    DataSet = qItensPedido
    Left = 497
    Top = 249
  end
end
