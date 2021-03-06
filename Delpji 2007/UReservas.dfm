inherited FReservas: TFReservas
  Left = 202
  Top = 119
  Height = 611
  Caption = 'FReservas'
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PEncabezado: TPanel
    inherited LTitulo: TLabel
      Width = 90
      Caption = 'Reservas'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 73
    Width = 687
    Height = 441
    Align = alClient
    Color = clWhite
    TabOrder = 1
    object GBDisiplina: TGroupBox
      Left = 1
      Top = 1
      Width = 685
      Height = 104
      Align = alTop
      Caption = ' Disiplina '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 45
        Height = 13
        Caption = 'Disiplina: '
      end
      object DBLCBDisiplina: TDBLookupComboBox
        Left = 70
        Top = 29
        Width = 177
        Height = 21
        KeyField = 'ID_DISIPLINA'
        ListField = 'NOMBRE'
        ListSource = DMGimnasio.DSActividadesReserva
        TabOrder = 0
        OnCloseUp = DBLCBDisiplinaCloseUp
      end
      object cxDEFechaClase: TcxDateEdit
        Left = 456
        Top = 22
        Width = 153
        Height = 21
        Properties.OnCloseUp = cxDEFechaClasePropertiesCloseUp
        TabOrder = 1
      end
      object cxLabel1: TcxLabel
        Left = 352
        Top = 24
        Width = 96
        Height = 17
        TabOrder = 2
        Caption = 'Fecha de la Clase:'
      end
      object cxLCantidad: TcxLabel
        Left = 199
        Top = 73
        Width = 30
        Height = 16
        AutoSize = False
        TabOrder = 3
        Caption = ''
      end
      object cxLabel2: TcxLabel
        Left = 80
        Top = 72
        Width = 116
        Height = 17
        TabOrder = 4
        Caption = 'Reservas Disponibles: '
      end
      object cxTEHoraClase: TcxTimeEdit
        Left = 456
        Top = 56
        Width = 121
        Height = 21
        EditValue = 0.000000000000000000
        Properties.TimeFormat = tfHourMin
        Properties.OnChange = cxTEHoraClasePropertiesChange
        TabOrder = 5
      end
      object cxLabel3: TcxLabel
        Left = 359
        Top = 57
        Width = 92
        Height = 17
        TabOrder = 6
        Caption = 'Hora de la Clase: '
      end
    end
    object GBReservas: TGroupBox
      Left = 1
      Top = 105
      Width = 685
      Height = 160
      Align = alTop
      Caption = ' Reservaciones Hechas '
      TabOrder = 1
      object DBGReservas: TDBGrid
        Left = 12
        Top = 22
        Width = 385
        Height = 129
        Color = clMenuBar
        DataSource = DSReservas
        FixedColor = clActiveBorder
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'APELLIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Apellido'
            Width = 191
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Alignment = taCenter
            Title.Caption = 'Nombre'
            Width = 187
            Visible = True
          end>
      end
      object BEliminar: TcxButton
        Left = 504
        Top = 64
        Width = 113
        Height = 25
        Caption = 'Eliminar Reserva'
        TabOrder = 1
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
    end
    object GBResNuevas: TGroupBox
      Left = 1
      Top = 265
      Width = 685
      Height = 175
      Align = alClient
      Caption = ' Reservaciones Nuevas '
      TabOrder = 2
      object DBGClientes: TDBGrid
        Left = 14
        Top = 14
        Width = 385
        Height = 142
        Color = clMenuBar
        DataSource = DSClientes
        FixedColor = clActiveBorder
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'APELLIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Apellido'
            Width = 195
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Alignment = taCenter
            Title.Caption = 'Nombre'
            Width = 185
            Visible = True
          end>
      end
      object BAgregar: TcxButton
        Left = 518
        Top = 122
        Width = 96
        Height = 25
        Caption = 'Reservar'
        TabOrder = 1
        OnClick = BAgregarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFEFEFFFFFFF1F7F4CB
          E1D4CBE2D5CAE0D3F3F7F5FFFFFFFDFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFDFDFBFDFCFFFFFFC4DED0017A37017E3D027A39CCE1D5FFFFFFFBFD
          FDFDFDFDFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFDFDFDFBFCFDFEFEFEC3DFD100
          823F008845018441CCE3D7FEFEFEFBFCFCFDFDFDFEFEFEFEFEFEFFFFFFFEFEFE
          FBFDFDFAFCFBF8FBFBFBFDFCC0E0D0008B4801914E028D4AC9E3D6FBFDFCF8FB
          FAFAFCFBFBFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDE7DA00
          9551009B58019754D8EAE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F7F5
          A9DDC8A6DCC6A3DBC5A7DDC77DCCAC01A25F02A66402A36181CDAEA4DBC5A0DA
          C3A1DAC3A8DCC7F3F9F6FFFFFFD7EEE500AA6500A96100AA6200A96100AB6300
          AF6B00AF6A00AF6A00AA6200A85F00AA6100A95F00AB68E0F1EAFEFEFEDDF1EB
          46CE9E44D09F46D09F45D09E46D09F44CF9D44CF9D44CF9D46D09F45D09E46D1
          9F44D09E4DCFA1E6F4EFFFFEFEE3F4EE82E0C185E3C484E2C384E2C381E2C27F
          E4C380E4C480E4C383E2C285E3C485E3C485E4C489E0C3EAF6F2FEFEFEFBFDFC
          EFF7F5EEF7F4ECF7F4F0F8F5CBEEE384E9C98EEDCF86E9CAD2F0E6F0F8F6EDF7
          F4EFF7F5F0F8F5FCFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCF5EE95
          F1D5A2F5DB98F1D6E4F7F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFE
          FEFEFEFDFDFDFCFDFDFEFEFEDDF6EEA6F5DEB2F9E4A9F5DFE3F7F1FEFEFEFCFD
          FDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFEFCFDFDFEFEFEDFF7F0B4
          F9E6C0FDEBB7F9E6E6F8F3FEFEFEFEFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFDFDFDFCFDFDFFFEFEE2F7F1BCF7E7C7FAECBFF7E8E9F8F4FFFEFEFDFD
          FDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFAFCFBF0
          F9F6F1F9F7F1F9F7FBFDFCFEFEFEFEFEFEFEFEFEFFFFFFFFFFFF}
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        UseSystemPaint = False
      end
      object TENombre: TcxTextEdit
        Left = 514
        Top = 71
        Width = 121
        Height = 24
        Properties.OnChange = TENombrePropertiesChange
        Style.Shadow = True
        TabOrder = 2
      end
      object TEApellido: TcxTextEdit
        Left = 514
        Top = 35
        Width = 121
        Height = 24
        Properties.OnChange = TEApellidoPropertiesChange
        Style.Shadow = True
        TabOrder = 3
      end
      object cxLabel4: TcxLabel
        Left = 452
        Top = 72
        Width = 51
        Height = 17
        TabOrder = 4
        Caption = 'Nombre: '
      end
      object cxLabel5: TcxLabel
        Left = 450
        Top = 37
        Width = 51
        Height = 17
        TabOrder = 5
        Caption = 'Apellido: '
      end
    end
  end
  object PBotones: TPanel
    Left = 0
    Top = 514
    Width = 687
    Height = 63
    Align = alBottom
    TabOrder = 2
    object Image2: TImage
      Left = 1
      Top = 1
      Width = 685
      Height = 61
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
    object BAceptar: TcxButton
      Left = 560
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
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
  end
  object IBQClientes: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BeforeOpen = IBQClientesBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select * from clientes where establecimiento=:esta and id_client' +
        'e in (select id_cliente from practica p, disiplinas d where p.id' +
        '_disiplina=d.id_disiplina and p.id_disiplina=:disiplina and d.re' +
        'serva='#39'S'#39') and nombre like :nombre and apellido like :apellido o' +
        'rder by nombre')
    Left = 168
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disiplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'apellido'
        ParamType = ptUnknown
      end>
  end
  object DSClientes: TDataSource
    DataSet = IBQClientes
    Left = 200
    Top = 8
  end
  object IBQCantReservas: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(*) as cant from reservas where fecha_clase=:fecha a' +
        'nd disiplina=:id and hora_clase=:hora')
    Left = 240
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hora'
        ParamType = ptUnknown
      end>
  end
  object IBQMaximoRes: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cantreservas from disiplinas where establecimiento=:esta ' +
        'and id_disiplina=:id')
    Left = 296
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQReservas: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from clientes c, reservas r where r.cliente=c.id_client' +
        'e and r.fecha_clase=:fecha and r.hora_clase=:hora and r.disiplin' +
        'a=:id')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object DSReservas: TDataSource
    DataSet = IBQReservas
    Left = 384
    Top = 8
  end
  object IBQInsert: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into reservas values(:id_c,:id_d,:hora_clase,:fecha_reser' +
        'va,:fecha_clase)')
    Left = 433
    Top = 442
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_c'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_d'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hora_clase'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha_reserva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha_clase'
        ParamType = ptUnknown
      end>
  end
  object IBQEliminar: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'delete from reservas where cliente=:id_c and disiplina=:id_d and' +
        ' fecha_clase=:fecha_c and hora_clase=:hora_c')
    Left = 433
    Top = 242
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_c'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_d'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha_c'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hora_c'
        ParamType = ptUnknown
      end>
  end
end
