inherited FArticulos: TFArticulos
  Left = 418
  Top = 178
  Width = 417
  Height = 390
  Caption = 'FArticulos'
  Font.Name = 'Arial'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited PEncabezado: TPanel
    Width = 401
    inherited Image1: TImage
      Width = 393
    end
    inherited LTitulo: TLabel
      Left = 16
      Width = 90
      Caption = 'Articulos'
    end
    inherited Image3: TImage
      Left = 136
      Top = 0
    end
  end
  object PDetalle: TPanel
    Left = 0
    Top = 97
    Width = 401
    Height = 200
    Align = alTop
    TabOrder = 1
    object DBGArticulos: TDBGrid
      Left = 1
      Top = 1
      Width = 399
      Height = 198
      Align = alClient
      DataSource = DMGimnasio.DSArticulos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOMBRE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Articulos'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 225
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRECIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Precio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CANTIDAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Stock Disponible'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 92
          Visible = True
        end>
    end
  end
  object BAceptar: TcxButton
    Left = 280
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 2
    OnClick = BAceptarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDFCFEFDFDFEFDFCFEFCFE
      FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFCFEFFFEC6E2CA5EB36962B56D8EC896FF
      FEFFFEFFFEFDFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFEFD
      FFFFFF68BB76159B2C26A23B1C9D3278C285FDFCFCFEFFFEFDFEFDFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFBFDFBFEFFFEE1F0E437AE523AB1553AB1553BB25628
      A9456FC282F8FAF8FFFFFFFCFEFDFFFFFFFFFFFFFFFFFFFFFFFFF8FCF9FFFFFF
      98D5A933B45645BB6644B96441B76244BB6535B55768C482F3F8F4FFFFFFFCFE
      FDFFFFFFFFFFFFFFFFFFFEFFFEF8FAF95AC57C4DC57340C0698ED5A5CEE9D642
      BE6A50C67742C06B63C884ECF5EFFFFFFFFCFEFCFFFFFFFFFFFFFFFFFFBCE7CC
      4BC97A64D28D4AC879D3EEDDFFFFFFCBEBD74EC87B5BD08751CC7E61CD89E5F3
      EAFFFFFFFCFEFCFFFFFFFEFFFE8ADBAC48D08151D48874D89DFEFDFEFAFDFBFF
      FFFFD3EFDE57D18A66D9965FD6905FD38FDDF2E6FFFFFFFCFEFDFDFEFEF4FAF7
      CAEEDA81DEABC1EDD5FFFFFFFCFEFDFBFDFCFFFFFFD8F1E35FD9976FE1A36DE0
      A160DA97D5F1E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFF
      FFFFFBFDFCFFFFFFDDF4E867E1A376E8AE7DE9B162E1A0C5F0DBFFFFFFFEFEFE
      FCFEFDFCFEFDFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFCFEFDFFFFFFE1F6EC6FE7
      AE70EEB366E8AABFF0D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFCFEFDFFFFFFE7F8F18EEDC2DAF6EAFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFF
      FFFFFFFFFFFFFFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFEFDFDFEFEFFFFFF}
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    UseSystemPaint = False
  end
  object TECantidad: TcxTextEdit
    Left = 130
    Top = 313
    Width = 91
    Height = 25
    Style.Shadow = True
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 70
    Top = 315
    Width = 56
    Height = 18
    TabOrder = 4
    Caption = 'Cantidad: '
  end
  object IBQinsertStock: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into stock values (:id_articulo,:esta,:cantidad,:fecha)')
    Left = 24
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_articulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object IBQUpdateStock: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update articulos set cantidad=:cant where id_articulo=:id')
    Left = 16
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
