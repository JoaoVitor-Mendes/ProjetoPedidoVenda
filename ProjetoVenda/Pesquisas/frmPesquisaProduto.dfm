object formPesquisaProduto: TformPesquisaProduto
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produtos'
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
  object dbgProdutos: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 778
    Height = 355
    Align = alClient
    DataSource = dsProdutos
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgProdutosDblClick
    OnKeyDown = dbgProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'cd_produto'
        Title.Caption = 'C'#243'digo'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o Produto'
        Width = 575
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_venda'
        Title.Caption = 'Vl. Venda'
        Width = 96
        Visible = True
      end>
  end
  object qProdutos: TFDQuery
    Left = 304
    Top = 104
    object qProdutoscd_produto: TIntegerField
      FieldName = 'cd_produto'
    end
    object qProdutosdescricao: TVarBytesField
      FieldName = 'descricao'
      Size = 155
    end
    object qProdutospreco_venda: TFloatField
      FieldName = 'preco_venda'
    end
  end
  object dsProdutos: TDataSource
    DataSet = qProdutos
    Left = 376
    Top = 104
  end
end
