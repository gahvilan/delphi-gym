inherited FABMUsuarios: TFABMUsuarios
  Left = 210
  Top = 151
  Width = 701
  Height = 486
  Caption = 'FABMUsuarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PEncabezado: TPanel
    Width = 693
    inherited Image1: TImage
      Width = 685
    end
    inherited LTitulo: TLabel
      Width = 271
      Caption = 'Administraci'#243'n de Usuarios'
    end
  end
  inherited PBotones: TPanel
    Top = 382
    Width = 693
    inherited Image2: TImage
      Width = 685
    end
    inherited BEliminar: TcxButton
      OnClick = BEliminarClick
    end
  end
  inherited PGrilla: TPanel
    Width = 753
    Height = 168
    inherited DBGDatosGenerales: TDBGrid
      Left = -6
      Width = 751
      Height = 164
      Align = alCustom
      BorderStyle = bsNone
      DataSource = DMGimnasio.DSUsuariosSistema
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Alignment = taCenter
          Title.Caption = 'Nombre de Usuario'
          Width = 245
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROFE'
          Title.Alignment = taCenter
          Title.Caption = 'Profesor Asignado'
          Width = 251
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ROL'
          Title.Alignment = taCenter
          Title.Caption = 'Rol'
          Width = 190
          Visible = True
        end>
    end
  end
  inherited PDatos: TPanel
    Top = 184
    Height = 193
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 102
      Height = 13
      Caption = 'Datos del Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 64
      Top = 56
      Width = 97
      Height = 13
      Caption = 'Nombre de Usuario: '
    end
    object LPassNuevo: TLabel
      Left = 101
      Top = 88
      Width = 57
      Height = 13
      Caption = 'Contrase'#241'a:'
    end
    object LConfPassNuevo: TLabel
      Left = 54
      Top = 120
      Width = 107
      Height = 13
      Caption = 'Confirmar Contrase'#241'a: '
    end
    object LPassViejo: TLabel
      Left = 73
      Top = 89
      Width = 83
      Height = 13
      Caption = 'Contrase'#241'a Vieja:'
      Visible = False
    end
    object LNuevoPassViejo: TLabel
      Left = 61
      Top = 120
      Width = 95
      Height = 13
      Caption = 'Contrase'#241'a Nueva: '
      Visible = False
    end
    object LConfPassVieja: TLabel
      Left = 17
      Top = 152
      Width = 139
      Height = 13
      Caption = 'Confirmar Contrase'#241'a Nueva:'
      Visible = False
    end
    object cxNombre: TcxTextEdit
      Left = 178
      Top = 53
      Width = 121
      Height = 24
      Style.Shadow = True
      TabOrder = 0
      Text = 'cxNombre'
    end
    object cxPassNuevo: TcxTextEdit
      Left = 176
      Top = 85
      Width = 122
      Height = 24
      Properties.EchoMode = eemPassword
      Style.Shadow = True
      TabOrder = 1
      Text = 'cxPassNuevo'
    end
    object cxConfPassNuevo: TcxTextEdit
      Left = 176
      Top = 117
      Width = 121
      Height = 24
      Properties.EchoMode = eemPassword
      Style.Shadow = True
      TabOrder = 2
      Text = 'cxConfPassNuevo'
    end
    object cxLabel1: TcxLabel
      Left = 384
      Top = 58
      Width = 86
      Height = 17
      TabOrder = 3
      Caption = 'Rol del Usuario: '
    end
    object cxLabel2: TcxLabel
      Left = 376
      Top = 112
      Width = 97
      Height = 17
      TabOrder = 4
      Caption = 'Usuario Asignado: '
    end
    object cxConfirmPassViejo: TcxTextEdit
      Left = 176
      Top = 149
      Width = 121
      Height = 24
      Properties.EchoMode = eemPassword
      Style.Shadow = True
      TabOrder = 5
      Text = 'cxConfirmPassViejo'
      Visible = False
    end
    object DBLCBRoles: TDBLookupComboBox
      Left = 480
      Top = 56
      Width = 145
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      KeyField = 'ID_ROL'
      ListField = 'NOMBRE'
      ListSource = DMGimnasio.DSRoles
      TabOrder = 6
    end
    object DBLCBPersonal: TDBLookupComboBox
      Left = 480
      Top = 108
      Width = 145
      Height = 21
      KeyField = 'ID_PERSONAL'
      ListField = 'NOMBRE'
      ListSource = DMGimnasio.DSPersonal
      TabOrder = 7
    end
  end
  inherited IBQInsert: TIBQuery
    SQL.Strings = (
      
        'insert into usuarios (nombre,pass,id_rol,id_personal,establecimi' +
        'ento) values (:nombre,:pass,:rol,:personal,:esta)')
    Left = 560
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pass'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'personal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  inherited IBQModificar: TIBQuery
    SQL.Strings = (
      
        'update usuarios set nombre=:nombre,pass=:pass,id_rol=:rol,id_per' +
        'sonal=:personal where establecimiento=:esta and id_usuario=:id')
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pass'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rol'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'personal'
        ParamType = ptUnknown
      end
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
  object IBQEliminar: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from usuarios where id_usuario=:id')
    Left = 464
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
