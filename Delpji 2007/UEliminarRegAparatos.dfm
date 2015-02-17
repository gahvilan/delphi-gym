inherited FEliminarRegAparatos: TFEliminarRegAparatos
  Left = 230
  Top = 149
  Width = 750
  Height = 489
  Caption = 'FEliminarRegAparatos'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PEncabezado: TPanel
    Width = 742
    inherited Image1: TImage
      Width = 734
      Stretch = True
    end
    inherited LTitulo: TLabel
      Width = 293
      Caption = 'Eliminar Entrada de Aparatos'
    end
    inherited Image3: TImage
      Left = 576
    end
  end
  object GBDatos: TGroupBox
    Left = 0
    Top = 73
    Width = 742
    Height = 387
    Align = alClient
    Caption = 'Datos del Cliente'
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object LRegistro: TLabel
      Left = 40
      Top = 288
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 738
      Height = 58
      Align = alTop
      Color = clWhite
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 19
        Width = 79
        Height = 13
        Caption = 'Fecha de Pago: '
      end
      object DTPFechaPago: TDateTimePicker
        Left = 119
        Top = 16
        Width = 154
        Height = 21
        Date = 39263.457376655090000000
        Time = 39263.457376655090000000
        TabOrder = 0
        OnChange = DTPFechaPagoChange
      end
    end
    object GBClientes: TGroupBox
      Left = 2
      Top = 73
      Width = 738
      Height = 252
      Align = alClient
      Caption = 'Clientes'
      TabOrder = 1
      object DBGClientes: TDBGrid
        Left = 2
        Top = 15
        Width = 734
        Height = 235
        Align = alClient
        DataSource = DSAparatosPagos
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGClientesCellClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 271
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DISIPLINA'
            Title.Alignment = taCenter
            Title.Caption = 'Modalidad'
            Width = 229
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_INGRESO'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha de Pago'
            Width = 112
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HORA_INGRESO'
            Title.Alignment = taCenter
            Title.Caption = 'Hora de Ingreso'
            Width = 115
            Visible = True
          end>
      end
    end
    object PBotones: TPanel
      Left = 2
      Top = 325
      Width = 738
      Height = 60
      Align = alBottom
      TabOrder = 2
      object Image2: TImage
        Left = 1
        Top = 1
        Width = 736
        Height = 58
        Align = alClient
        Picture.Data = {
          0A544A504547496D61676568120000FFD8FFE000104A46494600010101004800
          480000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
          1414141414141414141414141414141414141414141414141414141414141414
          14141414141414141414141414FFC0001108004102A703012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD42
          FB5FD68FB5FD6B23ED1EE28FB47B8AF3BDB1E9FB035FED7F5A3ED7F5AC8FB47B
          8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5
          A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A
          3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B2
          3ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7
          FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3E
          D1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED
          7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB0
          7B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1
          EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5F
          D68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE
          28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5A
          C8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B03
          5FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28
          FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68F
          B5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6
          C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB
          47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED
          7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47
          B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD
          6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC
          0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8
          A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3DB07B035FED7F5A
          3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23ED1EE28FB47B8A3
          DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7FB5FD68FB5FD6B23
          ED1EE28FB47B8A3DB07B035FED7F5A3ED7F5AC8FB47B8A3ED1EE28F6C1EC0D7F
          B5FD68AC8FB47B8A28F6C1EC0C9FB57FB468FB57FB46B27ED47FC9A3ED47FC9A
          F0BDB1F43EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5
          FED1A3ED5FED1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B2
          7ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00
          268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FE
          D1A3ED5FED1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27E
          D47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF0026
          8F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1
          A3ED5FED1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED4
          7FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F
          6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3
          ED5FED1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47F
          C9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C
          1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED
          5FED1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9
          A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C1E
          C0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5F
          ED1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3
          ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C1EC0
          D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED
          1AC9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED
          47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C1EC0D6
          FB57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1A
          C9FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47
          FC9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C1EC0D6FB
          57FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9
          FB51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC
          9A3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C1EC0D6FB57
          FB468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A3ED5FED1AC9FB
          51FF00268FB51FF268F6C1EC0D6FB57FB468FB57FB46B27ED47FC9A3ED47FC9A
          3DB07B035BED5FED1A3ED5FED1AC9FB51FF268FB51FF00268F6C1EC0D6FB57FB
          468FB57FB46B27ED47FC9A3ED47FC9A3DB07B035BED5FED1A2B27ED47FC9A28F
          6C1EC0C8FB51F5A3ED47D6B27ED5EF47DABDEBC1F6C7D07B0F235BED47D68FB5
          1F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB0
          7B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC
          9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F2
          35BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57
          BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED
          47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6
          AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68
          FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3
          DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F
          5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B
          0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9F
          B57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235
          BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD
          1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47
          D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF
          7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB
          51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB
          07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5A
          C9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F
          235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB5
          7BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BE
          D47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F
          6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D6
          8FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A
          3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51
          F5AC9FB57BD1F6AF7A3DB07B0F235BED47D68FB51F5AC9FB57BD1F6AF7A3DB07
          B0F235BED47D68AC9FB57BD147B60F61E463FDABDE8FB57BD725FDB7FED7EB47
          F6DFFB5FAD7CDFD7627D57D4A5D8EB7ED5EF47DABDEB92FEDBFF006BF5A3FB6F
          FDAFD68FAEC43EA52EC75BF6AF7A3ED5EF5C97F6DFFB5FAD1FDB7FED7EB47D76
          21F529763ADFB57BD1F6AF7AE4BFB6FF00DAFD68FEDBFF006BF5A3EBB10FA94B
          B1D6FDABDE8FB57BD725FDB7FED7EB47F6DFFB5FAD1F5D887D4A5D8EB7ED5EF4
          7DABDEB92FEDBFF6BF5A3FB6FF00DAFD68FAEC43EA52EC75BF6AF7A3ED5EF5C9
          7F6DFF00B5FAD1FDB7FED7EB47D7621F529763ADFB57BD1F6AF7AE4BFB6FFDAF
          D68FEDBFF6BF5A3EBB10FA94BB1D6FDABDE8FB57BD725FDB7FED7EB47F6DFF00
          B5FAD1F5D887D4A5D8EB7ED5EF47DABDEB92FEDBFF006BF5A3FB6FFDAFD68FAE
          C43EA52EC75BF6AF7A3ED5EF5C97F6DFFB5FAD1FDB7FED7EB47D7621F529763A
          DFB57BD1F6AF7AE4BFB6FF00DAFD68FEDBFF006BF5A3EBB10FA94BB1D6FDABDE
          8FB57BD725FDB7FED7EB47F6DFFB5FAD1F5D887D4A5D8EB7ED5EF47DABDEB92F
          EDBFF6BF5A3FB6FF00DAFD68FAEC43EA52EC75BF6AF7A3ED5EF5C97F6DFF00B5
          FAD1FDB7FED7EB47D7621F529763ADFB57BD1F6AF7AE4BFB6FFDAFD68FEDBFF6
          BF5A3EBB10FA94BB1D6FDABDE8FB57BD725FDB7FED7EB47F6DFF00B5FAD1F5D8
          87D4A5D8EB7ED5EF47DABDEB92FEDBFF006BF5A3FB6FFDAFD68FAEC43EA52EC7
          5BF6AF7A3ED5EF5C97F6DFFB5FAD1FDB7FED7EB47D7621F529763ADFB57BD1F6
          AF7AE4BFB6FF00DAFD68FEDBFF006BF5A3EBB10FA94BB1D6FDABDE8FB57BD725
          FDB7FED7EB47F6DFFB5FAD1F5D887D4A5D8EB7ED5EF47DABDEB92FEDBFF6BF5A
          3FB6FF00DAFD68FAEC43EA52EC75BF6AF7A3ED5EF5C97F6DFF00B5FAD1FDB7FE
          D7EB47D7621F529763ADFB57BD1F6AF7AE4BFB6FFDAFD68FEDBFF6BF5A3EBB10
          FA94BB1D6FDABDE8FB57BD725FDB7FED7EB47F6DFF00B5FAD1F5D887D4A5D8EB
          7ED5EF47DABDEB92FEDBFF006BF5A3FB6FFDAFD68FAEC43EA52EC75BF6AF7A3E
          D5EF5C97F6DFFB5FAD1FDB7FED7EB47D7621F529763ADFB57BD1F6AF7AE4BFB6
          FF00DAFD68FEDBFF006BF5A3EBB10FA94BB1D6FDABDE8FB57BD725FDB7FED7EB
          47F6DFFB5FAD1F5D887D4A5D8EB7ED5EF47DABDEB92FEDBFF6BF5A3FB6FF00DA
          FD68FAEC43EA52EC75BF6AF7A3ED5EF5C97F6DFF00B5FAD1FDB7FED7EB47D762
          1F529763ADFB57BD1F6AF7AE4BFB6FFDAFD68FEDBFF6BF5A3EBB10FA94BB1D6F
          DABDE8FB57BD725FDB7FED7EB47F6DFF00B5FAD1F5D887D4A5D8EB7ED5EF47DA
          BDEB92FEDBFF006BF5A3FB6FFDAFD68FAEC43EA52EC75BF6AF7A3ED5EF5C97F6
          DFFB5FAD1FDB7FED7EB47D7621F529763ADFB57BD1F6AF7AE4BFB6FF00DAFD68
          FEDBFF006BF5A3EBB10FA94BB1D6FDABDE8FB57BD725FDB7FED7EB47F6DFFB5F
          AD1F5D887D4A5D8EB7ED5EF47DABDEB92FEDBFF6BF5A3FB6FF00DAFD68FAEC43
          EA52EC75BF6AF7A3ED5EF5C97F6DFF00B5FAD1FDB7FED7EB47D7621F529763AD
          FB57BD1F6AF7AE4BFB6FFDAFD68FEDBFF6BF5A3EBB10FA94BB1D6FDABDE8FB57
          BD725FDB7FED7EB47F6DFF00B5FAD1F5D887D4A5D8EB7ED5EF47DABDEB92FEDB
          FF006BF5A3FB6FFDAFD68FAEC43EA52EC75BF6AF7A2B92FEDBFF006BF5A28FAE
          C43EA52EC73F451457CD1F4E1451450014514500145145001451450014514500
          1451450014514500145145001451450014514500145145001451450014514500
          1451450014514500145145001451450014514500145145001451450014514500
          1451450014514500145145001451450014514500145145001451450014514500
          1451450014514500145145001451450014514500145145001451450014514500
          14514500145145001451450014514500145145007FFFD9}
        Stretch = True
      end
      object BEliminar: TcxButton
        Left = 48
        Top = 16
        Width = 113
        Height = 25
        Caption = 'Eliminar Registro'
        TabOrder = 0
        OnClick = BEliminarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFF
          FEFEFEFEFEFEFCFCFDFCFCFDFCFCFDFCFCFDFBFBFDFBFBFDFBFBFDFBFBFDFCFC
          FDFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFE
          FEFEFEF7F7FAC3C3E2C0C0E0C0C0E1BFBFE0BABADEB7B7DDB6B6DDB8B8DDC3C3
          E1F9F9FBFFFFFFFEFEFEFDFDFDFCFCFDFEFEFEE6E6F30505A90000A50000A600
          00A50000A50000A30000A40000A30F0FACF0F0F6FEFEFEFDFDFDFEFEFEFDFDFE
          FEFEFEE9E9F64A4AD93E3ED94040DA3F3FD94040DA4040DA4141DA3D3DDA5353
          DAF2F2F8FEFEFEFEFEFEFDFDFDFEFEFEFEFEFEEBEBF8ABABF6AEAEFAADADF9AD
          ADF9AEAEF9AFAFF9B0B0F9AFAFFAAFAFF5F0F0F8FEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEF9F9FCE8E8F8E7E7F8E5E5F8E6E6F8E7E7F8E9E9F8EAEAF8EAEAF8EAEA
          F8FAFAFCFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFFFFFF
          FEFEFEFEFEFFFEFEFEFEFEFEFEFEFEFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        UseSystemPaint = False
      end
      object BSalir: TcxButton
        Left = 624
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Salir'
        TabOrder = 1
        OnClick = BSalirClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFD
          FEFEFBFDFCFDFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4FAF8F4FAF8D2
          EBE383CDB3E5F2EDF5FBF9F4FAF8FFFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFF
          FEFFFEFFFFFFF6FBF9DBF2EBC9EADF35B88E00AE7233BF96BFE5D8DEF3ECF1F9
          F7FFFFFFFEFFFEFEFFFFFFFFFFFEFFFEFEFFFEFCFEFEF8FCFBE5F6F1D0F0E57B
          D2B603BF8C00C49129C297BCE6D8DFF4EDF2FAF7FFFFFFFEFFFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFBFCEEF7F48DD9C211C99C00CC9D2AC99EBEE9
          DBDFF5EEF3FAF8FFFEFFFEFEFEF4FBF9E9F9F4C3EDE06ED8B667D7B363D6B155
          D3AB54D1A915C59000D09C00CD9526CB98BDEDDEDAF6EDF3FBF8FBFDFCE9F9F4
          DCF8EF86E1C518D3971DD69C1CD69C1ED79D1FD79D30DBA536DBA938DDAC2DD7
          A3ABEAD6E0F9F1EDFAF6FEFEFEF8FDFBF4FCFAD9F4ECAEECD9B0EDDAADECD8A7
          EBD6A6EAD584E5C885EFCE82EECD92EACFDCF6EEEDFCF7F8FDFBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFFFBFDFCF5FCFABFF0E192F0D493F6D899EFD5DAF6
          EDF0FDF9F7FCFBFEFEFEFFFFFFFEFFFFFEFFFFFDFEFEFBFEFDF3FCFAEDFCF8C2
          F4E5A1F5DCACFCE4AAF3DDDFF7F0F4FEFBF7FCFBFFFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFAFDFDF4FDFBE9FAF5B0F4E0BAFEEAB8F6E4E2F8F1F6FEFCF8FD
          FBFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFDFCFAFEFDE6
          F9F3CCF6E9EEFAF6FBFEFDF9FDFCFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFE
          FEFEFEFFFEFEFEFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        UseSystemPaint = False
      end
    end
  end
  object IBQAparatosPagos: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    AfterOpen = IBQAparatosPagosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select (select c.nombre||'#39' '#39'||c.apellido from clientes c where c' +
        '.id_cliente=a.cliente) as Nombre, a.cliente as idc,(select d.nom' +
        'bre from disiplinas d where d.id_disiplina=a.disiplina) as Disip' +
        'lina, (select d.precio_clase from disiplinas d where d.id_disipl' +
        'ina=a.disiplina) as monto, a.disiplina as iddis,a.fecha_ingreso,' +
        ' a.hora_ingreso from aparatos a where (a.paga='#39'S'#39') and (fecha_in' +
        'greso=:fecha)')
    Left = 346
    Top = 99
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
    object IBQAparatosPagosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 101
    end
    object IBQAparatosPagosDISIPLINA: TIBStringField
      FieldName = 'DISIPLINA'
      Size = 50
    end
    object IBQAparatosPagosFECHA_INGRESO: TIBStringField
      FieldName = 'FECHA_INGRESO'
      Origin = 'APARATOS.FECHA_INGRESO'
      Required = True
      Size = 10
    end
    object IBQAparatosPagosHORA_INGRESO: TIBStringField
      FieldName = 'HORA_INGRESO'
      Origin = 'APARATOS.HORA_INGRESO'
      Size = 5
    end
    object IBQAparatosPagosMONTO: TIBBCDField
      FieldName = 'MONTO'
      Precision = 9
      Size = 3
    end
    object IBQAparatosPagosIDC: TIntegerField
      FieldName = 'IDC'
      Origin = 'APARATOS.CLIENTE'
      Required = True
    end
    object IBQAparatosPagosIDDIS: TIntegerField
      FieldName = 'IDDIS'
      Origin = 'APARATOS.DISIPLINA'
      Required = True
    end
  end
  object DSAparatosPagos: TDataSource
    DataSet = IBQAparatosPagos
    Left = 384
    Top = 99
  end
  object IBQEliminarReg: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'delete from aparatos where disiplina=:dis and cliente=:cli and f' +
        'echa_ingreso=:fecha and hora_ingreso=:hora')
    Left = 410
    Top = 417
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cli'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hora'
        ParamType = ptUnknown
      end>
  end
  object IBQEliminarPago: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'delete from pago_aparatos where cliente=:cli and disiplina=:dis ' +
        'and fecha_ultimo_pago=:fecha')
    Left = 450
    Top = 414
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cli'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dis'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
end