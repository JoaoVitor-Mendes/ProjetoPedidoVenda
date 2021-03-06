unit formVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, frmPesquisaCliente,
  frmPesquisaProduto, uPedido, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frmPesquisaPedido;

type
  TfrmVenda = class(TForm)
    pnPrincipal: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edDtEmissao: TDateTimePicker;
    Panel1: TPanel;
    edCdCliente: TEdit;
    btPesquisaCliente: TButton;
    edNomeCliente: TEdit;
    Panel4: TPanel;
    edCdPedido: TEdit;
    btPesquisaPedido: TButton;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    edCdProduto: TEdit;
    btPesquisaProduto: TButton;
    edDsProduto: TEdit;
    Panel8: TPanel;
    edQuantidade: TEdit;
    Panel9: TPanel;
    edVlUnitario: TEdit;
    Panel10: TPanel;
    btIncluirProduto: TButton;
    pnGrid: TPanel;
    dbgItensPedido: TDBGrid;
    Panel11: TPanel;
    pnValores: TPanel;
    Panel12: TPanel;
    edQtProdutos: TEdit;
    pnFooter: TPanel;
    qItensPedido: TFDQuery;
    dsItensPedido: TDataSource;
    qItensPedidoCD_PEDIDO: TIntegerField;
    qItensPedidoDATA_EMISSAO: TDateField;
    qItensPedidoID_CLIENTE: TIntegerField;
    qItensPedidoDESCRICAO: TStringField;
    qItensPedidoCD_PEDIDO_PRODUTO: TIntegerField;
    qItensPedidoID_PRODUTO: TIntegerField;
    qItensPedidoQUANTIDADE: TIntegerField;
    qItensPedidoVALOR_UNITARIO: TFloatField;
    qItensPedidoVALOR_TOTAL: TFloatField;
    edVlTotalVenda: TEdit;
    Panel13: TPanel;
    btGravar: TButton;
    Button2: TButton;
    procedure btPesquisaClienteClick(Sender: TObject);
    procedure btPesquisaProdutoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edCdClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCdProdutoExit(Sender: TObject);
    procedure btIncluirProdutoClick(Sender: TObject);
    procedure btPesquisaPedidoClick(Sender: TObject);
    procedure edCdPedidoExit(Sender: TObject);
    procedure edCdClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCdProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edVlUnitarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edQuantidadeEnter(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    Pedido: TPedido;

    procedure limpaEdits();
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}

procedure TfrmVenda.btGravarClick(Sender: TObject);
begin
  ShowMessage('Pedido Gravo com Sucesso!');
  limpaEdits();
  edCdCliente.SetFocus;
end;

procedure TfrmVenda.btIncluirProdutoClick(Sender: TObject);
var
  vIdPedido: Integer;
  vVlTotalProduto: Currency;
  qTotais: TFDQuery;
begin
  if (Trim(edCdCliente.Text) = '') then
  begin
    ShowMessage('Informar Cliente!');
    edCdCliente.SetFocus;
    exit;
  end;

  if (Trim(edCdProduto.Text) = '') then
  begin
    ShowMessage('Informar Produto!');
    edCdProduto.SetFocus;
    exit;
  end;

  if (Trim(edQuantidade.Text) = '') then
  begin
    ShowMessage('Informar Quantidade!');
    edQuantidade.SetFocus;
    exit;
  end;

  if (Trim(edVlUnitario.Text) = '') then
  begin
    ShowMessage('Informar Valor Unit?rio!');
    edVlUnitario.SetFocus;
    exit;
  end;

  if (StrToCurr(edVlUnitario.Text) <= 0) then
  begin
    ShowMessage('Informar Valor Unit?rio!');
    edVlUnitario.SetFocus;
    exit;
  end;

  vVlTotalProduto := (StrToCurr(edQuantidade.Text) * StrToCurr(edVlUnitario.Text));

  if (Trim(edCdPedido.Text) = '') then
  begin
    vIdPedido :=  Pedido.IncluiNovoPedido(StrToInt(edCdCliente.Text)); // Inclui Novo Pedido e Inclui primeiro Item.
  end
  else
  begin
    vIdPedido := StrToInt(edCdPedido.Text);
  end;

  edCdPedido.Text := IntToStr(vIdPedido);

  Pedido.IncluiItemPedido(vIdPedido, StrToInt(edCdProduto.Text), StrToInt(edQuantidade.Text), StrToFloat(edVlUnitario.Text), vVlTotalProduto);

  edCdProduto.Clear;
  edDsProduto.Clear;
  edQuantidade.Clear;
  edVlUnitario.Clear;

  edCdProduto.SetFocus;

  dsItensPedido.DataSet := Pedido.RetornaProdutosPedido(vIdPedido);

  qTotais  := TFDQuery.Create(nil);

  try
    qTotais              := Pedido.RetornaValorPedido(vIdPedido);
    edQtProdutos.Text    := qTotais.FieldByName('CD_PEDIDO_PRODUTO').AsString;
    edVlTotalVenda.Text  := qTotais.FieldByName('VALOR_TOTAL').AsString;

    Pedido.AtualizaVlTotalPedido(qTotais.FieldByName('VALOR_TOTAL').asCurrency, vIdPedido);

  finally
    qTotais.Free;
  end;

end;

procedure TfrmVenda.btPesquisaClienteClick(Sender: TObject);
var
  PesquisaCliente: TformPesquisaCliente;
begin
  PesquisaCliente := TformPesquisaCliente.Create(Self);
  try
    PesquisaCliente.ShowModal;

    if (PesquisaCliente.vIdCliente <> '') then
    begin
      edCdCliente.Text := PesquisaCliente.vIdCliente;
      edCdClienteExit(nil);
    end;

  finally
    PesquisaCliente.Free;
  end;
end;

procedure TfrmVenda.btPesquisaPedidoClick(Sender: TObject);
var
  PesquisaPedido: TformPesquisaPedido;
begin
  PesquisaPedido := TformPesquisaPedido.Create(Self);
  try
    PesquisaPedido.ShowModal;

    if (PesquisaPedido.vIdPedido > 0) then
    begin
      edCdPedido.Text := IntToStr(PesquisaPedido.vIdPedido);
      edCdPedidoExit(nil);
    end;

  finally
    PesquisaPedido.Free;
  end;
end;

procedure TfrmVenda.btPesquisaProdutoClick(Sender: TObject);
var
  PesquisaProduto: TformPesquisaProduto;
begin
  PesquisaProduto := TformPesquisaProduto.Create(Self);
  try
    PesquisaProduto.ShowModal;

    if (PesquisaProduto.vIdProduto <> '') then
    begin
      edCdProduto.Text := PesquisaProduto.vIdProduto;
      edCdProdutoExit(nil);
    end;


  finally
    PesquisaProduto.Free;
  end;
end;

procedure TfrmVenda.Button2Click(Sender: TObject);
begin

  if (Trim(edCdPedido.Text) = '') then
  begin
    ShowMessage('Nenhum pedido para exclus?o');
    exit;
  end;

  if  MessageDlg('Voc? tem certeza que deseja excluir o Pedido e seus itens?',mtConfirmation,[mbyes,mbno],0) = mryes then
  begin
    Pedido.DeletarPedidoItens(StrToInt(edCdPedido.Text));

    ShowMessage('Pedido Exclu?do!');
    limpaEdits();
  end;
end;

procedure TfrmVenda.edCdClienteExit(Sender: TObject);
var
  query: TFDQuery;
begin
  if not (Trim(edCdCliente.Text) = '') then
  begin
    try
      query := TFDQuery.Create(nil);
      query := Pedido.RetornaClientePorId(edCdCliente.Text);

      if (query.IsEmpty) then
      begin
        ShowMessage('Cliente n?o encontrado!');
        edNomeCliente.Clear;
        exit;
      end;

      edNomeCliente.Text := query.FieldByName('nome').AsString;
    finally
      query.Free;
    end;
  end;
end;

procedure TfrmVenda.edCdClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    Key := 0;
    if (Trim(edCdCliente.Text) = '') then
    begin
      btPesquisaClienteClick(nil);
    end
    else
    begin
      edCdProduto.SetFocus;
    end;
  end;
end;

procedure TfrmVenda.edCdPedidoExit(Sender: TObject);
var
  query: TFDQuery;
  qTotais: TFDQuery;
  vIdPedido: Integer;
begin
  if not (Trim(edCdPedido.Text) = '') then
  begin
    try

      vIdPedido := StrToInt(edCdPedido.Text);

      query := TFDQuery.Create(nil);
      query := Pedido.RetornaDadosPedidoPorId(StrToInt(edCdPedido.Text));

      if (query.IsEmpty) then
      begin
        ShowMessage('Pedido n?o encontrado!');
        limpaEdits();
        edCdPedido.Clear;
        exit;
      end;

      edDtEmissao.Date   := query.FieldByName('DATA_EMISSAO').AsDateTime;
      edCdCliente.Text   := query.FieldByName('CD_CLIENTE').AsString;
      edNomeCliente.Text := query.FieldByName('NOME').AsString;

      dsItensPedido.DataSet := Pedido.RetornaProdutosPedido(vIdPedido);

      qTotais  := TFDQuery.Create(nil);

      try
        qTotais              := Pedido.RetornaValorPedido(vIdPedido);
        edQtProdutos.Text    := qTotais.FieldByName('CD_PEDIDO_PRODUTO').AsString;
        edVlTotalVenda.Text  := qTotais.FieldByName('VALOR_TOTAL').AsString;

        Pedido.AtualizaVlTotalPedido(qTotais.FieldByName('VALOR_TOTAL').AsCurrency,vIdPedido);

      finally
        qTotais.Free;
      end;

    finally
      query.Free;
    end;
  end;
end;

procedure TfrmVenda.edCdProdutoExit(Sender: TObject);
var
  query: TFDQuery;
begin
  if not (Trim(edCdProduto.Text) = '') then
  begin
    try
      query := TFDQuery.Create(nil);
      query := Pedido.RetornaProdutoPorId(edCdProduto.Text);

      if (query.IsEmpty) then
      begin
        ShowMessage('Produto n?o encontrado!');
        edDsProduto.Clear;
        edVlUnitario.Clear;
        exit;
      end;

      edDsProduto.Text  := query.FieldByName('descricao').AsString;
      edVlUnitario.Text := query.FieldByName('preco_venda').AsString;
    finally
      query.Free;
    end;
  end;
end;

procedure TfrmVenda.edCdProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    Key := 0;
    if (Trim(edCdProduto.Text) = '') then
    begin
      btPesquisaProdutoClick(nil);
    end
    else
    begin
      edQuantidade.SetFocus;
    end;

  end;
end;

procedure TfrmVenda.edQuantidadeEnter(Sender: TObject);
begin
  edQuantidade.Text := '1';
end;

procedure TfrmVenda.edQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    Key := 0;
    edVlUnitario.SetFocus;
  end;
end;

procedure TfrmVenda.edVlUnitarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    Key := 0;
    btIncluirProduto.SetFocus;
  end;
end;

procedure TfrmVenda.FormDestroy(Sender: TObject);
begin
  Pedido.Free;
end;

procedure TfrmVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (KEY = VK_F8) then
  begin
    key := 0;
    btGravarClick(nil);
    exit;
  end;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
begin

  limpaEdits();

  Pedido := TPedido.Create();
end;

procedure TfrmVenda.limpaEdits;
begin
  edCdPedido.Clear;
  edCdCliente.Clear;
  edNomeCliente.Clear;
  edCdProduto.Clear;
  edDsProduto.Clear;
  edQuantidade.Clear;
  edVlUnitario.Clear;
  edQtProdutos.Clear;
  edVlTotalVenda.Clear;

  edDtEmissao.DateTime := Date;

  dbgItensPedido.DataSource.DataSet.Close;

  edCdCliente.SetFocus;
end;

end.
