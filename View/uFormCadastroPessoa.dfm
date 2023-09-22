object Pessoas: TPessoas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pessoas'
  ClientHeight = 552
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 510
    Width = 816
    Height = 42
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 500
    ExplicitWidth = 806
    object btnFechar: TButton
      Left = 720
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgControl: TPageControl
    Left = 0
    Top = 0
    Width = 816
    Height = 510
    ActivePage = tbPes
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 806
    ExplicitHeight = 500
    object tbPes: TTabSheet
      Caption = 'tbPes'
      ExplicitWidth = 798
      ExplicitHeight = 472
      object pnBtns: TPanel
        Left = 0
        Top = 438
        Width = 808
        Height = 44
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        ExplicitTop = 428
        ExplicitWidth = 798
      end
      object pnFiltro: TPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 57
        Align = alTop
        Color = clSilver
        ParentBackground = False
        TabOrder = 3
        ExplicitWidth = 798
        object lblEdPesquisar: TLabeledEdit
          Left = 8
          Top = 24
          Width = 393
          Height = 21
          EditLabel.Width = 124
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite aqui para pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 716
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object DBGrid: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 60
        Width = 802
        Height = 375
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGridDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 460
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Width = 240
            Visible = True
          end>
      end
      object btnNovo: TButton
        Left = 527
        Top = 466
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnDetalhar: TButton
        Left = 622
        Top = 466
        Width = 75
        Height = 25
        Caption = 'Detalhar'
        TabOrder = 1
        OnClick = btnDetalharClick
      end
      object btnExcluir: TButton
        Left = 715
        Top = 466
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      ExplicitWidth = 798
      ExplicitHeight = 472
      object Tipo: TLabel
        Left = 16
        Top = 136
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object Codigo: TLabeledEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        Enabled = False
        TabOrder = 0
      end
      object lblEdDocumento: TLabeledEdit
        Left = 192
        Top = 152
        Width = 121
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Documento'
        MaxLength = 15
        TabOrder = 3
      end
      object lblEdNome: TLabeledEdit
        Left = 16
        Top = 88
        Width = 449
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 50
        TabOrder = 1
      end
      object lblEdTelefone: TLabeledEdit
        Left = 344
        Top = 152
        Width = 121
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Telefone'
        MaxLength = 18
        TabOrder = 4
      end
      object cbxTipo: TComboBox
        Left = 16
        Top = 152
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 2
        Text = 'F'#237'sico'
        Items.Strings = (
          'F'#237'sico'
          'Jur'#237'dico')
      end
      object Panel2: TPanel
        Left = 0
        Top = 441
        Width = 808
        Height = 41
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        ExplicitTop = 431
        ExplicitWidth = 798
        object btnListar: TButton
          Left = 432
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 528
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 624
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 716
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = DmPessoa.sqlAll
    Left = 704
    Top = 112
  end
end
