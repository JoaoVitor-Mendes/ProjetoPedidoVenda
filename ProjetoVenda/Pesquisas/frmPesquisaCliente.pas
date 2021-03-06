unit frmPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPedido, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TformPesquisaCliente = class(TForm)
    pnPrincipal: TPanel;
    dbgClientes: TDBGrid;
    dsClientes: TDataSource;
    qClientes: TFDQuery;
    qClientescd_cliente: TIntegerField;
    qClientesnome: TVarBytesField;
    qClientescidade: TVarBytesField;
    qClientesuf: TVarBytesField;
    procedure FormShow(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure dbgClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vIdCliente : String;
  end;

var
  formPesquisaCliente: TformPesquisaCliente;

implementation

{$R *.dfm}

procedure TformPesquisaCliente.dbgClientesDblClick(Sender: TObject);
begin

  if (dsClientes.DataSet.RecordCount > 0) then
  begin
    vIdCliente := dbgClientes.DataSource.DataSet.FieldByName('cd_cliente').AsString;

    Close;
  end;

end;

procedure TformPesquisaCliente.dbgClientesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_RETURN) then
  begin
    Key := 0;
    dbgClientesDblClick(nil);
  end;
end;

procedure TformPesquisaCliente.FormShow(Sender: TObject);
var
  Pedido: TPedido;
begin
  Pedido := TPedido.Create();

  dsClientes.DataSet := Pedido.RetornaTodosClientes();

end;

end.
