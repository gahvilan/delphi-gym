object DMGimnasio: TDMGimnasio
  OldCreateOrder = False
  Left = 337
  Top = 149
  Height = 479
  Width = 688
  object IBDGimnasio: TIBDatabase
    DatabaseName = 'E:\Varios\Programas para Gym\Trabajo Gimnasio\GIMNASIO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTGimnasio
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 40
    Top = 24
  end
  object IBTGimnasio: TIBTransaction
    Active = False
    DefaultDatabase = IBDGimnasio
    AutoStopAction = saNone
    Left = 40
    Top = 88
  end
  object IBQActividades: TIBQuery
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    AfterOpen = IBQActividadesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select * from disiplinas where establecimiento=:esta and nombre<' +
        '>'#39'Aparatos'#39' and id_disiplina <> 33')
    Left = 336
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSActividades: TDataSource
    DataSet = IBQActividades
    Left = 248
    Top = 32
  end
  object IBTPersonal: TIBTable
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    AfterOpen = IBTPersonalAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PERSONAL'
    Left = 464
    Top = 184
    object IBTPersonalID_PERSONAL: TIntegerField
      FieldName = 'ID_PERSONAL'
    end
    object IBTPersonalNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 50
    end
    object IBTPersonalAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Size = 50
    end
    object IBTPersonalEDAD: TIntegerField
      FieldName = 'EDAD'
    end
    object IBTPersonalDNI: TIntegerField
      FieldName = 'DNI'
    end
    object IBTPersonalSUELDO: TIBBCDField
      FieldName = 'SUELDO'
      Precision = 9
      Size = 3
    end
    object IBTPersonalID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object IBTPersonalESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
    end
    object IBTPersonalTIPO_SUELDO: TIBStringField
      FieldName = 'TIPO_SUELDO'
      Size = 1
    end
  end
  object DSPersonal: TDataSource
    DataSet = IBTPersonal
    Left = 528
    Top = 184
  end
  object IBTClases: TIBTable
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_DISIPLINA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PRECIO_CLASE'
        DataType = ftBCD
        Precision = 9
        Size = 3
      end
      item
        Name = 'ESTABLECIMIENTO'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY22'
        Fields = 'ID_DISIPLINA'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN23'
        Fields = 'ESTABLECIMIENTO'
      end>
    StoreDefs = True
    TableName = 'DISIPLINAS'
    Left = 464
    Top = 72
  end
  object DSClases: TDataSource
    DataSet = IBTClases
    Left = 528
    Top = 72
  end
  object IBTUsuarios: TIBTable
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'USUARIOS'
    Left = 464
    Top = 24
  end
  object DSUsuarios: TDataSource
    DataSet = IBTUsuarios
    Left = 528
    Top = 24
  end
  object IBTArticulos: TIBTable
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ARTICULOS'
    Left = 464
    Top = 128
  end
  object DSArticulos: TDataSource
    DataSet = IBTArticulos
    Left = 528
    Top = 128
  end
  object IBTRoles: TIBTable
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    AfterOpen = IBTRolesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_ROL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'ID_ROL'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'ROLES'
    Left = 464
    Top = 248
    object IBTRolesID_ROL: TIntegerField
      FieldName = 'ID_ROL'
      Required = True
    end
    object IBTRolesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 15
    end
  end
  object DSRoles: TDataSource
    DataSet = IBTRoles
    Left = 528
    Top = 248
  end
  object IBQRolesQ: TIBQuery
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from roles')
    Left = 248
    Top = 104
  end
  object IBTDisiplinas: TIBTable
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DISIPLINAS'
    Left = 464
    Top = 304
  end
  object DSDisiplinas: TDataSource
    DataSet = IBTDisiplinas
    Left = 528
    Top = 304
  end
  object IBQActividadesReserva: TIBQuery
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    AfterOpen = IBQActividadesReservaAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from disiplinas where establecimiento=:esta and reserva' +
        '='#39'S'#39)
    Left = 336
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSActividadesReserva: TDataSource
    DataSet = IBQActividadesReserva
    Left = 336
    Top = 232
  end
  object IBQUsuariosSistema: TIBQuery
    Database = IBDGimnasio
    Transaction = IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select U.nombre,(select R.nombre from roles R where R.id_rol=U.i' +
        'd_rol) as rol, (select P.nombre||'#39' '#39'||P.apellido from personal P' +
        ' where P.id_personal=U.id_personal) as Profe, pass, id_usuario, ' +
        'id_rol, id_personal from usuarios U ')
    Left = 152
    Top = 328
    object IBQUsuariosSistemaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'USUARIOS.NOMBRE'
      Size = 10
    end
    object IBQUsuariosSistemaROL: TIBStringField
      FieldName = 'ROL'
      Size = 15
    end
    object IBQUsuariosSistemaPROFE: TIBStringField
      FieldName = 'PROFE'
      Size = 101
    end
    object IBQUsuariosSistemaPASS: TIBStringField
      FieldName = 'PASS'
      Origin = 'USUARIOS.PASS'
      Size = 10
    end
    object IBQUsuariosSistemaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'USUARIOS.ID_USUARIO'
      Required = True
    end
    object IBQUsuariosSistemaID_ROL: TIntegerField
      FieldName = 'ID_ROL'
      Origin = 'USUARIOS.ID_ROL'
    end
    object IBQUsuariosSistemaID_PERSONAL: TIntegerField
      FieldName = 'ID_PERSONAL'
      Origin = 'USUARIOS.ID_PERSONAL'
    end
  end
  object DSUsuariosSistema: TDataSource
    DataSet = IBQUsuariosSistema
    Left = 156
    Top = 376
  end
end
