unit uFormCadastroPessoa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  System.UITypes,
  uDmPessoa,
  uPessoaModel,
  uPessoaController;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TPessoas = class(TForm)
    Panel1: TPanel;
    btnFechar: TButton;
    dsPesq: TDataSource;
    pgControl: TPageControl;
    tbPes: TTabSheet;
    tbDados: TTabSheet;
    pnBtns: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    pnFiltro: TPanel;
    lblEdPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    DBGrid: TDBGrid;
    Codigo: TLabeledEdit;
    lblEdDocumento: TLabeledEdit;
    lblEdNome: TLabeledEdit;
    lblEdTelefone: TLabeledEdit;
    Tipo: TLabel;
    Panel2: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    cbxTipo: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOperacao: TOperacao;
    oPessoaController : TPessoaController;
    oPessoa : TPessoa;
    sErro : String;

    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure PesquisarNome;
    procedure CarregarPessoas;
    procedure Listar;
    procedure Alterar;
    procedure Excluir(Count: Integer);
    procedure Inserir;
    procedure Gravar;
    procedure HabiliatarControllers(aOperacao: TOperacao);
    procedure LimparCampos;
  end;

var
  Pessoas: TPessoas;

implementation

{$R *.dfm}

procedure TPessoas.Alterar;
begin
  try
    with oPessoa do
    begin
      ID := StrToIntDef(Codigo.Text, 0);
      Nome := lblEdNome.Text;
      if cbxTipo.ItemIndex = 0 then
      begin
        Tipo := 'F';
      end
      else if cbxTipo.ItemIndex = 1 then
      begin
        Tipo := 'J';
      end
      else
      begin
        Tipo := EmptyStr;
      end;
      Documento := lblEdDocumento.Text;
      Telefone := lblEdTelefone.Text;
    end;

    if oPessoaController.Alterar(oPessoa, sErro) = False then
      raise Exception.Create(sErro);
  finally
  end;
end;

procedure TPessoas.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabiliatarControllers(opAlterar);
end;

procedure TPessoas.btnCancelarClick(Sender: TObject);
begin
  HabiliatarControllers(opNavegar);
end;

procedure TPessoas.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TPessoas.btnExcluirClick(Sender: TObject);
begin
  if oPessoaController.sqlPes.Active then
  begin
    Excluir(oPessoaController.RecordCountPesquisaUnica);
  end
  else if oPessoaController.sqlAll.Active then
  begin
    Excluir(oPessoaController.RecordCountPesquisa);
  end;
  Pesquisar;
end;

procedure TPessoas.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TPessoas.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabiliatarControllers(opNavegar);
end;

procedure TPessoas.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TPessoas.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabiliatarControllers(opNovo);
end;

procedure TPessoas.btnPesquisarClick(Sender: TObject);
begin
  PesquisarNome;
end;

procedure TPessoas.CarregarPessoas;
begin
  try
    oPessoaController.CarregarPessoa(oPessoa, oPessoaController.PegarID);

    with oPessoa do
    begin
      Codigo.Text := IntToStr(ID);
      lblEdNome.Text := Nome;
      if Tipo = 'F' then
      begin
        cbxTipo.ItemIndex := 0;
      end
      else if Tipo = 'J' then
      begin
        cbxTipo.ItemIndex := 1;
      end
      else
      begin
        cbxTipo.ItemIndex := -1;
      end;
      cbxTipo.Text := Tipo;
      lblEdDocumento.Text := Documento;
      lblEdTelefone.Text := Telefone;
    end;

  finally
  end;

end;

procedure TPessoas.Configuracoes;
begin
  tbPes.TabVisible := False;
  tbDados.TabVisible := False;
  pgControl.ActivePage := tbPes;
  DmPessoa.sqlAll.Active := true;
  oPessoaController.AtivarPesquisa;
  DBGrid.DataSource.DataSet := oPessoaController.sqlAll;
end;

procedure TPessoas.DBGridDblClick(Sender: TObject);
begin
  oPessoaController.AtivarPesquisa;
  DBGrid.DataSource.DataSet := oPessoaController.sqlAll;
end;

procedure TPessoas.Detalhar;
begin
  CarregarPessoas;
  HabiliatarControllers(opNavegar);
  FOperacao := opNavegar;
  pgControl.ActivePage := tbDados;
end;

procedure TPessoas.Excluir(Count: Integer);
begin
  try
    if (Count > 0) then
    begin
      if MessageDlg('Deseja excluir essa pessoa?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
      begin
        if oPessoaController.Excluir(oPessoaController.PegarID, sErro) = False then
        begin
          raise Exception.Create(sErro);
        end;
      end;
    end
    else
    begin
      raise Exception.Create('N�o h� registro para ser exclu�do!');
    end;
    
  finally
  end;
end;

procedure TPessoas.FormCreate(Sender: TObject);
begin
  oPessoa := TPessoa.Create;
  oPessoaController := TPessoaController.Create;
end;

procedure TPessoas.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TPessoas.Gravar;
begin
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;

    Pesquisar;
  finally
    //oPessoa := nil;
  end;
end;

procedure TPessoas.HabiliatarControllers(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo, opAlterar:
    begin
      lblEdDocumento.Enabled := True;
      lblEdNome.Enabled := True;
      lblEdTelefone.Enabled := True;
      cbxTipo.Enabled := True;
      btnListar.Enabled := False;
      btnFechar.Enabled := False;
      btnAlterar.Enabled := False;
      btnGravar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
    opNavegar:begin
      lblEdDocumento.Enabled := False;
      lblEdNome.Enabled := False;
      lblEdTelefone.Enabled := False;
      cbxTipo.Enabled := False;
      btnListar.Enabled := True;
      btnFechar.Enabled := True;
      btnAlterar.Enabled := True;
      btnGravar.Enabled := False;
      btnCancelar.Enabled := False;
    end;
  end;
end;

procedure TPessoas.Inserir;
begin
  try
    with oPessoa do
    begin
      ID := oPessoaController.GerarNovoID;
      Nome := lblEdNome.Text;
      if cbxTipo.ItemIndex = 0 then
      begin
        Tipo := 'F';
      end
      else if cbxTipo.ItemIndex = 1 then
      begin
        Tipo := 'J';
      end
      else
      begin
        Tipo := EmptyStr;
      end;
      Telefone := lblEdTelefone.Text;
      Documento := lblEdDocumento.Text;
    end;

    if oPessoaController.Inserir(oPessoa, sErro) = False then
    begin
      raise Exception.Create(sErro);
    end;

  finally
  end;

end;

procedure TPessoas.LimparCampos;
begin
  lblEdDocumento.Text := '';
  lblEdNome.Text := '';
  lblEdTelefone.Text := '';
  Codigo.Text := '';
  cbxTipo.ItemIndex := 0;
end;

procedure TPessoas.Listar;
begin
  pgControl.ActivePage := tbPes;
  LimparCampos;
end;

procedure TPessoas.Novo;
begin
  FOperacao := opNovo;
  pgControl.ActivePage := tbDados;
end;

procedure TPessoas.Pesquisar;
begin
  try
    DBGrid.DataSource.DataSet := oPessoaController.sqlAll;
    oPessoaController.Pesquisar();
  finally
  end;
end;

procedure TPessoas.PesquisarNome;
begin
  try
    DBGrid.DataSource.DataSet := oPessoaController.sqlPes;
    oPessoaController.PesquisarNome(lblEdPesquisar.Text);
  finally
  end;
end;

end.
