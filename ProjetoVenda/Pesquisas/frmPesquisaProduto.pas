unit frmPesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uPedido;

type
  TformPesquisaProduto = class(TForm)
    dbgProdutos: TDBGrid;
    qProdutos: TFDQuery;
    dsProdutos: TDataSource;
    qProdutoscd_produto: TIntegerField;
    qProdutosdescricao: TVarBytesField;
    qProdutospreco_venda: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations}
  public
    { Public declarations }
    vIdProduto : String;
  end;

var
  formPesquisaProduto: TformPesquisaProduto;

implementation

{$R *.dfm}

procedure TformPesquisaProduto.dbgProdutosDblClick(Sender: TObject);
begin
  if (dbgProdutos.DataSource.DataSet.RecordCount > 0) then
  begin
    vIdProduto := dbgProdutos.DataSource.DataSet.FieldByName('CD_PRODUTO').AsString;

    Close;
  end;

end;

procedure TformPesquisaProduto.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    dbgProdutosDblClick(nil);
  end;
end;

procedure TformPesquisaProduto.FormShow(Sender: TObject);
var
  Pedido: TPedido;
begin
  Pedido := TPedido.Create();

  dsProdutos.DataSet := Pedido.RetornaTodosProdutos();

end;


end.
